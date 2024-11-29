//
//  ContentView.swift
//  Snacks
//
//  Created by GTCSYS Mac Mini 1  on 29/11/24.
//

import SwiftUI
struct ContentView: View {
    @StateObject var cardManager = Cardmanager()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Home()
                    .environmentObject(cardManager)
                
                // Display cart if there are products in the cart
                if cardManager.products.count > 0 {
                    NavigationLink(destination: Cartview()) {
                        HStack {
                            Text("\(cardManager.products.count)")
                                .padding()
                                .background(Color.yellow)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading) {
                                Text("Cart")
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("\(cardManager.products.count) item")
                                    .font(.system(size: 18))
                            }
                            Spacer()
                            
                            // Display images of the products in the cart
                            ForEach(cardManager.products, id: \.id) { product in
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 68, height: 60)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -10)
                            }
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(Color.white)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .environmentObject(cardManager)
    }
}

#Preview {
    ContentView()
}
