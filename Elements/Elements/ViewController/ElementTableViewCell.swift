 //
 //  ElementTableViewCell.swift
 //  Elements
 //
 //  Created by Edward O'Neill on 11/8/19.
 //  Copyright © 2019 Edward O'Neill. All rights reserved.
 //
 
 import UIKit
 
 class ElementTableViewCell: UITableViewCell {
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementDetail: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    
    func setElement(element: DetailElements) {
        var thumbnailNumber: String
        
        if element.number ?? 0 < 10 {
            thumbnailNumber = "00\(element.number ?? 0)"
        } else if element.number ?? 10 < 100 {
            thumbnailNumber = "0\(element.number ?? 0)"
        } else {
            thumbnailNumber = "\(element.number ?? 0)"
        }
        
        elementName.text = element.name ?? "nil"
        elementDetail.text = "\(element.symbol ?? "nil")(\(element.number ?? -10)) \(element.atomic_mass ?? 0)"
        if let url = URL(string: "https://www.theodoregray.com/periodictable/Tiles/\(thumbnailNumber)/s7.JPG") {
            elementImage.load(url: url)
        }
    }
 }
 
