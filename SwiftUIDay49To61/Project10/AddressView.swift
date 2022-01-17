//
//  AddressView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 07/01/2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderVM: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderVM.order.name)
                TextField("Street Address", text: $orderVM.order.streetAddress)
                TextField("City", text: $orderVM.order.city)
                TextField("Zip", text: $orderVM.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderVM: orderVM)
                } label: {
                    Text("Checkout")
                }

            }.disabled(!orderVM.order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(orderVM: Order())
        }
    }
}
