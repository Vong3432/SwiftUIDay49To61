//
//  CupcakeCornerAppView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 05/01/2022.
//

import SwiftUI

struct CupcakeCornerAppView: View {
    @StateObject var orderVM = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderVM.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(orderVM.order.quantity)", value: $orderVM.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $orderVM.order.specialRequestEnabled.animation())
                    
                    if orderVM.order.specialRequestEnabled {
                        Toggle("Add extra frosting?", isOn: $orderVM.order.extraFrosting)
                        Toggle("Add extra sprinkles?", isOn: $orderVM.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(orderVM: orderVM)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct CupcakeCornerAppView_Previews: PreviewProvider {
    static var previews: some View {
        CupcakeCornerAppView()
    }
}
