//
//  Fact.swift
//  Happy Facts
//
//  Created by Stewart Lynch on 2021-05-16.
//

import Foundation


struct Fact: Identifiable, Decodable {
    var id:String {
        title
    }
    let title: String
    let imageName: String
    let photoCredit: String
    let caption: String
}
