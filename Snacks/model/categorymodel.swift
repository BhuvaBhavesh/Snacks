//
//  categorymodel.swift
//  Snacks
//
//  Created by GTCSYS Mac Mini 1  on 29/11/24.
//

import SwiftUI

struct Categorymodel: Identifiable,Hashable{
    var id:UUID = .init()
    var icon:String
    var title:String
    
}

var categoryList:[Categorymodel]=[
    Categorymodel(icon: "", title: "All"),
    Categorymodel(icon: "choco", title: "Choco"),
    Categorymodel(icon: "waffel", title: "Waffel"),
    Categorymodel(icon: "toffie", title: "Toffie"),
]
