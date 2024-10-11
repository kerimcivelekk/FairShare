//
//  HomeScreen.swift
//  FairShare
//
//  Created by Kerim Civelek on 27.09.2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var searchQuery: String = "" // Başlangıç değeri boş bir String
    @State private var items: [(image: String, title: String, location: String, price: String)] = [
        ("bell.fill", "Ekmek", "Sancaktepe", "Ücretsiz"),
        ("book.fill", "Eski kitap", "Sancaktepe", "Ücretsiz"),
        ("chair.fill", "Sandalye", "Sancaktepe", "Ücretsiz"),
        ("tshirt.fill", "Kıyafet", "Sancaktepe", "Ücretsiz"),
        ("plus", "Artı", "Sancaktepe", "Free")
    ]
    
    // Kategoriler (resim ve isim)
    let categories: [(image: String, title: String)] = [
        ("cart.fill", "Gıda"),
        ("chair.fill", "Mobilya"),
        ("tv.fill", "Elektronik"),
        ("tshirt.fill", "Kıyafet"),
        ("gamecontroller.fill", "Oyuncak"),
        ("book.fill", "Kitap")
    ]
    
    // Grid bileşeninin ayarları
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2) // İki hücre için esnek genişlik
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    // Sol üstte logo
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading)
                    
                    Spacer()
                    
                    // Konum butonu
                    Button(action: {
                        // Konum butonuna tıklanınca yapılacaklar
                    }) {
                        HStack {
                            Image(systemName: "location.fill")
                            Text("Konum")
                                .font(.subheadline)
                            
                        }
                        .padding(.horizontal, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.gray, lineWidth: 0.5) // Kenar çizgisi
                        )
                        .shadow(radius: 5) // Gölge efekti
                        
                    }
                    
                    // Bildirim butonu
                    Button(action: {
                        // Bildirim butonuna tıklanınca yapılacaklar
                    }) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.trailing)
                    }
                }
                .padding(.top, 10)
                
                // Arama Çubuğu
                TextField("Ara...", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Kategoriler
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(categories, id: \.title) { category in
                            VStack {
                                Image(systemName: category.image) // Resim
                                    .resizable()
                                    .frame(width: 25, height: 25) // Resim boyutu
                                    .padding()
                                    .background(Color.blue.opacity(0.3))
                                    .cornerRadius(40)
                                
                                Text(category.title) // Başlık
                                    .font(.caption)
                                    .font(.headline)
                                    .padding(.top, 5)
                            }
                            .padding()
                            .background(Color.white) // Arka plan rengi (köşe yuvarlatma düzgün çalışsın diye)
                            .cornerRadius(40) // Hücrenin köşelerini yuvarla
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.gray, lineWidth: 0.5) // Kenar çizgisi
                            )
                            .shadow(radius: 5) // Gölge efekti
                        }.padding(5)
                    }
                    .padding(.horizontal)
                }
                
                // Koleksiyon Görünümü
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items.filter { searchQuery.isEmpty ? true : $0.title.contains(searchQuery) }, id: \.title) { item in
                            VStack(spacing: 10) {
                                // Resim
                                Image(systemName: item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: (UIScreen.main.bounds.width) / 3 - 40, height: (UIScreen.main.bounds.width) / 3 - 70)
                                    .padding()
                                    .background(Color.blue.opacity(0.3))
                                    .cornerRadius(10)
                                
                                // İçerik ve Fiyat Bilgisi
                                VStack(spacing: 5) {
                                    Text(item.title) // Başlık
                                        .font(.callout)
                                        .bold() // Kalın metin
                                        .multilineTextAlignment(.center)
                                    
                                    Text(item.location) // Konum bilgisi
                                        .font(.caption)
                                        .foregroundColor(.gray) // Daha küçük ve soluk yazı
                                    
                                    Text(item.price) // Fiyat bilgisi
                                        .font(.caption)
                                        .foregroundColor(.green) // Yeşil renk
                                }
                            }
                            .padding()
                            .background(Color.white) // Arka plan rengi (köşe yuvarlatma düzgün çalışsın diye)
                            .cornerRadius(10) // Hücrenin köşelerini yuvarla
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.5) // Kenar çizgisi
                            )
                            .shadow(radius: 5) // Gölge efekti
                            .multilineTextAlignment(.center) // Metni ortalamak için
                        }
                    }
                    .padding()
                }
                Spacer()

            }
        }
    }
}
#Preview {
    HomeScreenView()
}
