//
//  ValidateFormView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 05/01/2022.
//

import SwiftUI

struct ValidateFormView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    private var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account")
                }
            }.disabled(disableForm)
        }
    }
}

struct ValidateFormView_Previews: PreviewProvider {
    static var previews: some View {
        ValidateFormView()
    }
}
