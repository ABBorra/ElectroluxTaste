//
//  PhotoListModel.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import Foundation


// MARK: - PhotoListModel
struct PhotoListModel: Codable {
    let photos: Photos?
    let stat: String?
    let message: String?
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
}

// MARK: - Photo
struct Photo: Identifiable, Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    let urlM: String?
    let heightM, widthM: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
        case urlM = "url_m"
        case heightM = "height_m"
        case widthM = "width_m"
    }
}
