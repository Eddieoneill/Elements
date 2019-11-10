//
//  URLClass.swift
//  Elements
//
//  Created by Edward O'Neill on 11/6/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import UIKit

class URLReader {
    
    func getDetailElement(completion: @escaping ([DetailElements]) -> ()) {
        
        guard let url = URL(string: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            var elementArr: [DetailElements] = []
            if let data = data {
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let json = try jsonDecoder.decode([DetailElements].self, from: data)
                    for element in json {
                        elementArr.append(element)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                completion(elementArr)
            }
        }
        task.resume()
    }
    
    func getElementOverview(completion: @escaping ([ElementOverView]) -> ()) {
        
        guard let url = URL(string: "https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            var elementArr: [ElementOverView] = []
            if let data = data {
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let json = try jsonDecoder.decode([ElementOverView].self, from: data)
                    for element in json {
                        elementArr.append(element)
                    }
                } catch {
                    print(error.localizedDescription)
                }
                completion(elementArr)
            }
        }
        task.resume()
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

