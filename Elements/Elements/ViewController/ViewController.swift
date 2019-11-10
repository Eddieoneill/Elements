//
//  ViewController.swift
//  Elements
//
//  Created by Edward O'Neill on 11/6/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let urlReader = URLReader()
    
    var elementList = [DetailElements](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        urlReader.getDetailElement { (elementArr: [DetailElements]) in
            for element in elementArr {
                self.elementList.append(element)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let element = elementList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ElementX") as? ElementTableViewCell else {return UITableViewCell()}
        cell.setElement(element: element)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier! {
        case "ElementDetailScreen":
            if let destination = segue.destination as? ElementDetailViewController {
                destination.element = elementList[tableView.indexPathForSelectedRow!.row]
            }
        default:
            fatalError()
        }

    }
    
}



