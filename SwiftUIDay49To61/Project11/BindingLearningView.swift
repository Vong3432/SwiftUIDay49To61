//
//  BindingLearningView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 08/01/2022.
//

import SwiftUI

struct BindingLearningView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct BindingLearningView_Previews: PreviewProvider {
    static var previews: some View {
        BindingLearningView()
    }
}

