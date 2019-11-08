//
//  URLClass.swift
//  Elements
//
//  Created by Edward O'Neill on 11/6/19.
//  Copyright © 2019 Edward O'Neill. All rights reserved.
//

import Foundation

class URLReader {
    
    func getElement(completion: @escaping ([Elements]) -> ()) {
        
        guard let url = URL(string: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            var elementArr: [Elements] = []
            if let data = data {
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let json = try jsonDecoder.decode([Elements].self, from: data)
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
}
