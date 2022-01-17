//
//  CheckoutView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 07/01/2022.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var orderVM: Order
    
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(orderVM.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {
                    Task {
                        await placeOrder()
                    }
                })
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(confirmationTitle, isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    private func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(orderVM.order) else { return }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(OrderModel.self, from: data)
            
            popupAlert(title: "Thank you", msg: "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!")
            
        } catch {
            popupAlert(title: "Checkout failed", msg: "Something went wrong in checkout.")
        }
    }
    
    private func popupAlert(title: String, msg: String) {
        confirmationTitle = title
        confirmationMessage = msg
        showingConfirmation = true
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(orderVM: Order())
        }
    }
}
