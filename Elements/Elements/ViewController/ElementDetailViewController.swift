//
//  ElementDetailViewController.swift
//  Elements
//
//  Created by Edward O'Neill on 11/8/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementNumber: UILabel!
    @IBOutlet weak var elementMeltingPoint: UILabel!
    @IBOutlet weak var elementBoilingPoiny: UILabel!
    @IBOutlet weak var discoveredBy: UILabel!
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementAtomicMass: UILabel!
    
    var element: DetailElements? = nil
    
    func setElementDetail(element: DetailElements) {
        var thumbnailName = element.name
        
        elementName.text = element.name ?? "nil"
        elementNumber.text = "\(element.number)"
        elementMeltingPoint.text = "\(element.melt)"
        elementBoilingPoiny.text = "\(element.boil)"
        elementSymbol.text = "\(element,symbol)"
        if let url = URL(string: " http://images-of-elements.com/\(thumbnailName).jpg") {
            elementImage.load(url: url)
        }
    }
}
