//
//  ChallengeViewModel.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 16/01/2022.
//

import Combine
import Foundation

class ChallengeViewModel: ObservableObject {
    
    @Published var users: [ChallengeUser] = []
    
    private var cancelables = Set<AnyCancellable>()
    private let container = ChallengeDataController.shared.container
    
    init() {
        if users.isEmpty {
            downloadData()
        }
    }
    
    private func downloadData() {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.hackingwithswift.com/samples/friendfasce.json")!)
            .tryMap({ return $0.data })
            .decode(type: [ChallengeUser].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (userCompletion) in
                switch userCompletion {
                case .finished:
                    break
                case .failure(let error):
                    self.loadCachedData()
                    print(String(describing: error))
                }
            }) { [weak self] (returnedUsers) in
                self?.saveDataToCache(users: returnedUsers)
                self?.users = returnedUsers
            }
            .store(in: &cancelables)
    }
    
    private func saveDataToCache(users: [ChallengeUser]) {
        print("Saving data to cached ...")
        do {
            users.forEach { (challengeUser) in
                
                challengeUser.friends.forEach({ (challengeFriend) -> Void in
                    let friend = CachedFriend(context: container.viewContext)
                    friend.id = challengeFriend.id
                    friend.name = challengeFriend.name
                    friend.user = CachedUser(context: container.viewContext)
                    friend.user?.name = challengeUser.name
                    friend.user?.email = challengeUser.email
                    friend.user?.id = challengeUser.id
                    friend.user?.about = challengeUser.about
                    friend.user?.address = challengeUser.address
                    friend.user?.tags = challengeUser.tags.joined(separator: ",")
                    friend.user?.registered = challengeUser.registered
                    friend.user?.age = Int16(challengeUser.age)
                    friend.user?.isActive = challengeUser.isActive
                    friend.user?.company = challengeUser.company
                })
            }
            
            if container.viewContext.hasChanges {
                try container.viewContext.save()
                
                print("Save data to cached")
            }
        } catch let error {
            print("Error occur:" + String(describing: error))
        }
    }
    
    private func loadCachedData() {
        print("Loading data from cached ...")
        CDPublisher(request: CachedUser.fetchRequest(), context: container.viewContext)
            .map({ (cachedUsers) in
                return cachedUsers.map {
                    ChallengeUser(
                        id: $0.wrappedId,
                        isActive: $0.isActive, name: $0.wrappedName,
                        company: $0.wrappedAddress,
                        email: $0.wrappedAbout,
                        address: $0.wrappedCompany,
                        about: $0.wrappedEmail,
                        age: Int($0.age),
                        registered: $0.wrappedRegistered,
                        tags: $0.wrappedTag.components(separatedBy: ","),
                        friends: $0.friendArray.map({ (cachedFriend) in
                            ChallengeFriend(id: cachedFriend.wrappedId, name: cachedFriend.wrappedName)
                        }))
                }
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] cachedUsers in
                print("Loaded data from cached successfully")
                self?.users = cachedUsers
            })
            .store(in: &cancelables)
    }
    
}
