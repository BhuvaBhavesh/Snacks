//
//  Cartview.swift
//  Snacks
//
//  Created by GTCSYS Mac Mini 1  on 09/12/24.
//

import SwiftUI

struct Cartview: View {
    
    @EnvironmentObject var cardManager: Cardmanager
    
    @Environment(\.presentationMode) var mode
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Cart")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button{
                            mode.wrappedValue.dismiss()
                            
                        }label: {
                            Text("3")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Button{
                            mode.wrappedValue.dismiss()
                            
                        }label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                    }
                   
                    }
                .padding(30)
                
                ForEach(productList){ item in
                    CartProductCard(product: item)

                }
                
                }
            }
        
        VStack{
            HStack{
                Text("Delivery Amount")
                Spacer()
                Text("$4.00")
                    .font(.system(size: 24))
                
                Spacer()
                
            }
            
            Divider()
            
            Text("Total Amount")
                .font(.system(size: 24))
            
            Text("USD 38.00")
                .font(.system(size: 36,weight: .semibold))
                
                
        }
        
        
        .padding(30)
        .frame(maxWidth:.infinity)
        .background(.yellow.opacity(0.5))
        .clipShape(.rect(cornerRadius: 60))
        .padding()
        
        
        Button{
            
        }label: {
            Text("Make Payment")
                .frame(maxWidth:.infinity)
                .frame(height:80)
                .background(.yellow.opacity(0.5))
                .font(.system(size: 28,weight: .semibold))
                .foregroundColor(.black)
                .clipShape(Capsule())
                .padding()
        }
        }
    
    
        
        
        
    }


#Preview {
    Cartview()
        .environmentObject(Cardmanager())
}

struct CartProductCard: View {
    var product: Product
    var body: some View {
        
        HStack(alignment: .center, spacing: 28){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                    
                
                Text("\(product.category)")
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            
            Text("\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
                
        }
        
    }
}
