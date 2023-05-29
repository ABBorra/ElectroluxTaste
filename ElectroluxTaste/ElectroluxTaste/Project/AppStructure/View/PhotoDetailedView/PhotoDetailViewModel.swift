//
//  PhotoDetailViewModel.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import Foundation
import UIKit
import Combine

class PhotoDetailViewModel: ObservableObject {
    
    // MARK: -Donwading Image to Gallery
    func downLoadImageFromUrl(imageUrl:String?,
                              completion: @escaping (_ success: Bool, Error?) -> ()) {
        
        let ImgUrl = imageUrl

        guard let photoUrlValue = URL(string: ImgUrl ?? "") else { return }
        downLoadImgeFromDataFromUrl(url: photoUrlValue) { (data, response, error) in

            guard let data = data, let imageFromData = UIImage(data: data) else { return }
            
            DispatchQueue.main.async() {
                UIImageWriteToSavedPhotosAlbum(imageFromData, nil, nil, nil)
            }
            completion(true, error)
        }
    }
    
    // MARK: -Fetch Image
    func downLoadImgeFromDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    
}
