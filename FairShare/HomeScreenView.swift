//
//  HomeScreen.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var searchQuery: String = "" // Başlangıç değeri boş bir String
    @State private var items: [String] = ["Ekmek", "Eski kitap", "Sandalye", "Kıyafet"]
    
    var body: some View {
        VStack {
            // Arama Çubuğu
            TextField("Ara...", text: $searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Liste Görünümü
            List {
                ForEach(items.filter { searchQuery.isEmpty ? true : $0.contains(searchQuery) }, id: \.self) { item in
                    Text(item)
                }
            }
            .frame(maxHeight: 300)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    HomeScreenView()
}
