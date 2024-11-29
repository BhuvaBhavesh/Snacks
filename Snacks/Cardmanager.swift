//
//  Cardmanager.swift
//  Snacks
//
//  Created by GTCSYS Mac Mini 1  on 09/12/24.
//

import SwiftUI

class Cardmanager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total:Int = 0
    
    func addtoCart(product:Product){
        products.append(product)
        total += product.price
    }
    
    func removefromCart(product:Product){
        products=products.filter{$0.id != product.id}
        total -= product.price
    }
} 
