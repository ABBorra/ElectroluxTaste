//
//  Request.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import Foundation

// MARK: - Api 
class Request {
    
    static func get<T: Decodable>(str: String, type: T.Type, completionHandler: @escaping (_ obj:T?, _ error: Error? )  -> ())  {
        guard let url = URL(string: str) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data,
                   error == nil {
                do {
                    let userResponse = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(userResponse, nil)
                } catch let err {
                    completionHandler(nil, err)
                }
            } else {
                completionHandler(nil, error)
            }
        }.resume()
    }
}
