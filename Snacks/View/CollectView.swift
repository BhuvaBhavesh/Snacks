//
//  CollectView.swift
//  Snacks
//
//  Created by GTCSYS Mac Mini 1  on 09/12/24.
//

import SwiftUI

struct CollectView: View {
    @EnvironmentObject var cardmanager: Cardmanager
    @Environment(\.presentationMode) var mode
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    LazyVGrid(columns:[GridItem(.flexible()),GridItem(.flexible())],
                    content: {
                ForEach(productList,id:\.id){ item in SmallProductCard(product:item)
                        .environmentObject(cardmanager)
                        }
                    })	
                    .padding(.horizontal)
                }
            }
        }
    }
}
        
        #Preview {
            CollectView()
                .environmentObject(Cardmanager())
        }



struct SmallProductCard: View {
    var product: Product
    
    @EnvironmentObject var cardmanager: Cardmanager

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Image
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                    .frame(
                        width: geometry.size.width * 0.4, // 40% of the card width
                        height: geometry.size.height * 0.4 // 40% of the card height
                    )
                    .rotationEffect(Angle(degrees: 30))
                    .offset(x: -geometry.size.width * 0.1) // Slightly shift the image

                // Card Content
                VStack(alignment: .leading) {
                    // Product Name
                    Text(product.name)
                        .font(.system(size: geometry.size.width * 0.08, weight: .semibold)) // Scaled font size
                        .lineLimit(1)

                    // Product Category
                    Text(product.category)
                        .font(.system(size: geometry.size.width * 0.04))
                        .padding(8)
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())

                    Spacer()

                    // Price and Add to Basket Button
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: geometry.size.width * 0.06, weight: .semibold))

                        Spacer()

                        Button {
                            cardmanager.addtoCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(
                                    width: geometry.size.width * 0.2,
                                    height: geometry.size.height * 0.1
                                )
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top)
                }
                .padding(20)
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
                .background(product.color.opacity(0.13))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .frame(height: 300) // Default height for the card
    }
}
