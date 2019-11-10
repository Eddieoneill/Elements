//
//  Elements.swift
//  Elements
//
//  Created by Edward O'Neill on 11/8/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import Foundation

struct DetailElements: Codable {
    let name: String?
    let appearance: String?
    let atomic_mass: Double?
    let boil: Double?
    let category: String?
    let color: String?
    let density: Double?
    let discovered_by: String?
    let melt: Double?
    let molar_heat: Double?
    let named_by: String?
    let number: Int?
    let period: Int?
    let phase: String?
    let source: String?
    let spectral_img: String?
    let summary: String?
    let symbol: String?
    let xpos: Int?
    let ypos: Int?
    let shells: [Int]?
    
}

struct ElementOverView: Codable {
    let id: Int?
    let elementSymbol: String?
    let elementName: String?
    let favoritedBy: String?
}

