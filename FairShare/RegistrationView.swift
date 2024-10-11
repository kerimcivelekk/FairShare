//
//  RegistrationView.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var showRegistrationView = false
    
    var body: some View {
            ScrollView{
                VStack(spacing: 20) {
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .padding()
                    
                    // E-posta ile giriş
                    Button(action: {
                        // E-posta ile giriş işlemi burada
                    }) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.white)
                            Text("E-posta ile Giriş")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    
                    // Telefon ile giriş
                    Button(action: {
                        // Telefon ile giriş işlemi burada
                        showRegistrationView = true
                    }) {
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.white)
                            Text("Telefon ile Giriş")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: TelephoneRegisterView(), isActive: $showRegistrationView){
                        EmptyView()
                    }
                    
                    // Google ile giriş
                    Button(action: {
                        // Google ile giriş işlemi burada
                    }) {
                        HStack {
                            Image("google_icon") // Google icon dosyasını projeye eklemeniz gerekebilir
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Google ile Giriş")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                    }
                    
                    // Apple ile giriş
                    Button(action: {
                        // Apple ile giriş işlemi burada
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundColor(.white)
                            Text("Apple ile Giriş")
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    }
                    
                    
                    
                    Spacer()
                    
                }
                .padding()
            }
        }}


#Preview {
    RegistrationView()
}
