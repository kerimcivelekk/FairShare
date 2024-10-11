//
//  UserViewModel.swift
//  FairShare
//
//  Created by Kerim Civelek on 10.10.2024.
//

import Firebase
import Combine

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    func saveUser(uid: String, phoneNumber: String) {
        let db = Firestore.firestore()
        let userData: [String: Any] = [
            "uid": uid,
            "phoneNumber": phoneNumber
        ]
        
        db.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                print("Kullanıcı verisi kaydedilirken hata: \(error.localizedDescription)")
            } else {
                print("Kullanıcı verisi başarıyla kaydedildi!")
                self.user = User(uid: uid, phoneNumber: phoneNumber) // Kullanıcıyı güncelle
            }
        }
    }
}
