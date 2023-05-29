//
//  PhotosApiRepository.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import Foundation
import Toaster

protocol PhotosApiProtocol {
    func getPhotosItems(pageSize: Int, page: Int, apiKey: String,
                        searchImage: String,serviceName: String,
                        onComplete: @escaping(PhotoListModel?, Error?) -> Void)
}

class PhotosApi: PhotosApiProtocol {
    
    // MARK: - Photos request from Api
    func getPhotosItems(pageSize: Int, page: Int,
                        apiKey: String,searchImage: String,
                        serviceName: String,
                        onComplete: @escaping(PhotoListModel?,Error?) -> Void) {
        
        guard NetworkReachablity.isReachable() else {
            let toast = Toast(text: "No internet Connection")
            ToastView.appearance().backgroundColor = .red
            toast.show()
            return
        }
        //Constructing APIUrl
        var url = URL(string: ApiUrls.baseUrl)
        url = url?.appendingQueryComponent("api_key", value: apiKey)
            .appendingQueryComponent("method", value: serviceName)
            .appendingQueryComponent("per_page", value: String(pageSize))
            .appendingQueryComponent("page", value: String(page))
            .appendingQueryComponent("tags", value: searchImage)
            .appendingQueryComponent("format", value: "json")
            .appendingQueryComponent("nojsoncallback", value: "true")
            .appendingQueryComponent("extras", value: "media")
            .appendingQueryComponent("extras", value: "url_sq")
            .appendingQueryComponent("extras", value: "url_m")
        
        Request.get(str: url?.absoluteString ?? "", type: PhotoListModel.self) { response, error in
            onComplete(response, error)
        }
    }
}

