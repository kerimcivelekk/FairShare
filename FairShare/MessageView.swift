//
//  MessageView.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI

// Model yapısı
struct MessageList: Identifiable {
    let id = UUID()
    let isSent: Bool
    let name: String
    let message: String
    let profileImage: String?
}

// Mesaj görünümü
struct MessageView: View {
    let messages: [MessageList]
    @State private var newMessage: String = ""
    @State private var allMessages: [MessageList] = []
    
    init(messages: [MessageList]) {
        self.messages = messages
        _allMessages = State(initialValue: messages)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(allMessages) { message in
                    if message.isSent {
                        // Giden mesaj
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(message.name)
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                Text(message.message)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                    } else {
                        // Gelen mesaj
                        HStack {
                            if let profileImage = message.profileImage {
                                Image(profileImage)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .scaledToFit()
                                    .clipShape(Circle())
                            }
                            VStack(alignment: .leading) {
                                Text(message.name)
                                    .font(.headline)
                                    .foregroundColor(.green)
                                Text(message.message)
                                    .padding()
                                    .background(Color.green.opacity(0.2))
                                    .cornerRadius(10)
                            }
                            Spacer()
                        }
                    }
                }
            }
            
            // Mesaj yazma alanı ve gönder butonu
            HStack {
                TextField("Mesaj yazın", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                
                Button(action: {
                    let sentMessage = MessageList(isSent: true, name: "Ben", message: newMessage, profileImage: nil)
                    allMessages.append(sentMessage)
                    newMessage = ""
                }) {
                    Text("Gönder")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
    }
}
