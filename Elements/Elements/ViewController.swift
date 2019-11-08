//
//  ViewController.swift
//  Elements
//
//  Created by Edward O'Neill on 11/6/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementSymbleNumberMass: UILabel!
    @IBOutlet weak var elementImge: UIImageView!
    
    let urlReader = URLReader()
    var elementList = [Elements]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlReader.getElement { (elementArr: [Elements]) in
            for element in elementArr {
                self.elementList.append(element)
            }
        }
    }
    
    
}

