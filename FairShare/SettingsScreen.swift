//
//  SettingsScreen.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Kapat")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }
        
    }
}

#Preview {
    SettingsScreen()
}
