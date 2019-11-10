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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let element = element else { return }
        setElementDetail(element: element)
    }
    
    func setElementDetail(element: DetailElements) {
        let thumbnailName = element.name?.lowercased() ?? "nil"
        
        view.backgroundColor = .black
        elementName.textColor = .white
        elementNumber.textColor = .white
        elementMeltingPoint.textColor = .white
        elementBoilingPoiny.textColor = .white
        elementSymbol.textColor = .white
        discoveredBy.textColor = .white
        elementAtomicMass.textColor = .white
        
        elementName.text = element.name ?? "nil"
        elementNumber.text = "\(element.number ?? 0)"
        elementMeltingPoint.text = "\(element.melt ?? 0)"
        elementBoilingPoiny.text = "\(element.boil ?? 0)"
        elementSymbol.text = "\(element.symbol ?? "nil")"
        discoveredBy.text = "\(element.discovered_by ?? "nil")"
        elementAtomicMass.text = "\(element.atomic_mass ?? 0)"
        
        if let url = URL(string: "https://images-of-elements.com/\(thumbnailName).jpg") {
            elementImage.load(url: url)
        }
    }
}
