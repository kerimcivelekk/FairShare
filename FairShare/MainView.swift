//
//  MainView.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
      
          
                
                // TabView kısmı
                TabView {
                    HomeScreenView()
                        .tabItem {
                            Label("Ana Sayfa", systemImage: "house.fill")
                        }
                    
                    MessageListView()
                        .tabItem {
                            Label("Message", systemImage: "paperplane")
                        }
                    
                    AddItem()
                        .tabItem {
                            Label("Ürün Ekle", systemImage: "plus")
                        }
                    
                    ProfileScreen()
                        .tabItem {
                            Label("Profil", systemImage: "person.fill")
                        }
                    
                    SettingsScreen()
                        .tabItem {
                            Label("Ayarlar", systemImage: "gear")
                        }
                }
                .navigationBarBackButtonHidden(true) // Geri butonunu gizler
                     .navigationBarHidden(true) // Navigation bar'ı tamamen gizler
                     .edgesIgnoringSafeArea(.top) // Safe Area boşluğunu da kaldırır
            }


        }
    


#Preview {
    MainView()
}
