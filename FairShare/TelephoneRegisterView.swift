//
//  TelephoneRegisterView.swift
//  FairShare
//
//  Created by Kerim Civelek on 8.10.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct TelephoneRegisterView: View {
    @State private var phoneNumber: String = ""
    @State private var verificationID: String = ""
    @State private var showVerificationView = false
    @State var isLoggedIn: Bool = false

    var body: some View {
        VStack {
            TextField("Telefon Numarası", text: $phoneNumber)
                .keyboardType(.phonePad)
                .padding()
                .border(Color.gray)

            Button("Kod Gönder") {
                sendVerificationCode()
            }
            .padding()
            .sheet(isPresented: $showVerificationView) {
                VerificationView(verificationID: $verificationID, isLoggedIn: $isLoggedIn)
            }
            NavigationLink(destination: MainView(), isActive: $isLoggedIn) {
                EmptyView()
            }
           
        }
        .padding()
        .navigationTitle("Telefon ile Kayıt")
    }

    private func sendVerificationCode() {
        let phoneNumberWithCode = "+90" + phoneNumber
        print("Gönderilecek telefon numarası: \(phoneNumberWithCode)")

        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberWithCode, uiDelegate: nil) { verificationID, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            guard let verificationID = verificationID else {
                print("Verification ID nil geldi!")
                return
            }
            self.verificationID = verificationID
            print("Kod gönderildi! Verification ID: \(verificationID)")
            showVerificationView = true // Doğrulama ekranını aç
        }
    }
}

struct VerificationView: View {
    @Binding var verificationID: String
    @State private var verificationCode: String = ""
    @Binding var isLoggedIn: Bool
    @StateObject private var userViewModel = UserViewModel() // UserViewModel'i başlat
    @Environment(\.dismiss) var dismiss // Bu, görünümü kapatmak için kullanılır

    
    
    var body: some View {
        VStack {
            TextField("Doğrulama Kodu", text: $verificationCode)
                .padding()
                .border(Color.gray)

            Button("Doğrula") {
                verifyCode()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Doğrulama Kodu")
      
    }

    private func verifyCode() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)

        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            if let user = Auth.auth().currentUser {
                dismiss() // VerificationView'i kapat
                print("Giriş yapmış kullanıcı: \(user.uid)")
                userViewModel.saveUser(uid: user.uid, phoneNumber: user.phoneNumber ?? "")
                // Giriş başarılı olduğunda MainView'e geçiş yap ve VerificationView'i kapat
                isLoggedIn = true
            } else {
                print("Kullanıcı oturumu kapalı.")
            }
        }
    }
}
