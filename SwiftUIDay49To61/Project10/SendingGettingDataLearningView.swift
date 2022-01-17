//
//  SendingGettingDataLearningview.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 05/01/2022.
//

import SwiftUI

struct SendingGettingDataLearningView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponseData = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponseData.results
            }
        } catch {
            
        }
    }
}

struct SendingGettingDataLearningView_Previews: PreviewProvider {
    static var previews: some View {
        SendingGettingDataLearningView()
    }
}
