//
//  MessageListView.swift
//  FairShare
//
//  Created by Kerim Civelek on 7.10.2024.
//

import SwiftUI

// Mesaj listesi görünümü
struct MessageListView: View {
    // Yalnızca "gelen" mesajlar gösterilecek
    let messagesList: [MessageList] = [
        MessageList(isSent: false, name: "Ahmet", message: "Merhaba, nasılsın?", profileImage: "ist"),
        MessageList(isSent: true, name: "Mehmet", message: "Bugün hava nasıl?", profileImage: nil),
        MessageList(isSent: false, name: "Ayşe", message: "Yarın buluşalım mı?", profileImage: "ist")
    ].filter { !$0.isSent }  // Yalnızca gelen mesajları filtrele
    
    var body: some View {
        NavigationView {
            List(messagesList) { message in
                NavigationLink(destination: MessageView(messages: [message])) {
                    HStack(alignment: .top) {
                        if let profileImage = message.profileImage {
                            Image(profileImage)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading) {
                            Text(message.name)
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            Text(message.message)
                                .font(.callout)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden) // Satır separator çizgilerini gizlemek için
            }
            .listStyle(PlainListStyle())  // Listeyi sadeleştiriyoruz
        }
    }
}

// Önizleme
#Preview {
    MessageListView()
}
