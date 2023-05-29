//
//  NetworkReachablity.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import Foundation
import Alamofire

// MARK: - Internet Connectivity
class NetworkReachablity {
    
    class func isReachable() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
