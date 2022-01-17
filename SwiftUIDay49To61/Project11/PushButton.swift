//
//  PushButtonView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 08/01/2022.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct PushButton_Previews: PreviewProvider {
    static var previews: some View {
        PushButton(title: "Tap me", isOn: .constant(true))
    }
}
