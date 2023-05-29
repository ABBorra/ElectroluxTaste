//
//  PhotoListViewModel.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import Foundation
import Combine
import Toaster

class PhotoListViewModel : ObservableObject {
    
    // MARK: - Propeties
    @Published var isloading: Bool = false
    
    @Published var photoGallery: [Photo]? = []
    
    var pageSize = 20
    var currentPage = 1
    var searchImage: String?
    
    
    // MARK: - Dependency
    let apiService: PhotosApiProtocol
    
    // MARK: - Lifecycle
    init(apiService: PhotosApiProtocol = PhotosApi()) {
        self.apiService = apiService
    }
    
    // MARK: - resetPage
    func resetPage(onComplete: @escaping() -> (Void)) {
        currentPage = 1
        self.photoGallery = []
        fetchData() {
            onComplete()
        }
    }
    
    // MARK: - Api Calls
    
    func fetchData(onComplete: @escaping() -> (Void)) {
        
        if (searchImage ?? "").isEmpty {
            searchImage = SecretKeys.defaultSearchTag
        }
        
        if isloading { return }
        self.isloading = true
        
        apiService.getPhotosItems(pageSize: self.pageSize,
                                  page: self.currentPage,
                                  apiKey: SecretKeys.photoApiKey,
                                  searchImage: searchImage?.trimmingCharacters(in: NSCharacterSet.whitespaces) ?? SecretKeys.defaultSearchTag,
                                  serviceName: SecretKeys.serviceName) { obj,error  in
            if let errorMessage = error {
                DispatchQueue.main.async {
                    let toast = Toast(text: errorMessage.localizedDescription,
                                      delay: Delay.short, duration: Delay.long)
                    ToastView.appearance().backgroundColor = .red
                    toast.show()
                }
                return
            } else {
                if let dataResponse = obj?.photos,
                   let photos = dataResponse.photo, photos.count > 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.photoGallery?.append(contentsOf: photos)
                        self.currentPage += 1
                        self.isloading = false
                    }
                    onComplete()
                } else {
                    // Handle Empty or failure data
                    DispatchQueue.main.async {
                        let toast = Toast(text: obj?.message ?? "No search result found")
                        ToastView.appearance().backgroundColor = .red
                        toast.show()
                    }
                }
            }
            
        }
    }
}
