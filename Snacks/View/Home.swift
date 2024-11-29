import SwiftUI

struct Home: View {
    @State var selectedCategory = "Choco"
    
    @EnvironmentObject var cardmanager: Cardmanager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.medium)
                            .padding()
                            .frame(width: 50, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // Category List View
                    CategoryListView
                    
                    // Chocolate Collections Section
                    HStack {
                        Text("Chocolate  **Collections**")
                            .font(.system(size: 24))
                        Spacer()
                        
                        NavigationLink{ 
                            CollectView()
                                .environmentObject(cardmanager)                        }label: {
                            Image(systemName: "chevron.right") // Correct system image name
                                .imageScale(.medium)
                        }
                        .foregroundColor(.blue)
                        
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack {
                            ForEach(productList,id: \.id){item in
                                ProductCard(product: item)
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Category List View Definition
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            VStack {
                                Image(item.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 20)
                                
                                Text(item.title)
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCategory == item.title ? Color.blue : Color.gray, lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(Cardmanager())
}

struct ProductCard: View {
    var product: Product
    
    @EnvironmentObject var cardmanager: Cardmanager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.trailing, -50)
                .rotationEffect(Angle(degrees: 30))

            
            ZStack {
                
                
                VStack(alignment: .leading) {
                    Text("\(product.name)")
                        .font(.system(size: 30, weight: .semibold))
                        .frame(width:168)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24, weight:.semibold))
                        
                        Spacer()
                        
                        Button{
                            cardmanager.addtoCart(product:product)
                            
                        }label:{
                            Image(systemName: "basket")
                                .imageScale(.large)
                            
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        
                        .padding(.horizontal,-10)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                    
                    
                }
                .padding(30)
                .frame(width: 336, height: 422)
                .background(product.color.opacity(0.13))
                .clipShape(RoundedRectangle(cornerRadius: 57))
                .padding(.horizontal)
            }
        }
    }
}
