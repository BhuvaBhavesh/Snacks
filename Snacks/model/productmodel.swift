//
//  productmodel.swift
//  Snacks
//
//  Created by GTCSYS Mac Mini 1  on 29/11/24.
//

import SwiftUI

struct Product: Identifiable {
    var id:UUID = .init()
    var name:String
    var category:String
    var image:String
    var color: Color
    var price:Int
}

var productList=[
    Product(name: "Good source", category: "choco", image: "Goodsource",
            color:.pink,price: 8),
    Product(name: "Unreal muffins", category: "choco", image: "unreal",color:.yellow, price: 8),
    Product(name: "Twister Chips", category: "chips", image: "twister", color:.red,price: 8),
    Product(name: "Twister Chips", category: "chips", image: "twisterchips", color:.green,price: 8),
    Product(name: "Regular Naturn", category: "chips", image: "regular",color:.blue, price: 8),
    Product(name: "Dark Russet", category: "chips", image: "dark", color:.brown,price: 8),
    Product(name: "Smithns chips", category: "chips", image: "smithns", color:.orange,price: 8),
    Product(name: "Deep river", category: "chips", image: "deep", color:.purple,price: 8),
]

