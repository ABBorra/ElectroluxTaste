//
//  PhotoDetailView.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import SwiftUI
import Toaster

struct PhotoDetailView: View {
    
    var photoDetails: Photo?
    @StateObject var photoDetailViewModel = PhotoDetailViewModel()
    
    // MARK: - View
    var body: some View {
        Spacer()
        
            VStack {
                PhotoDetailDataView(photo: photoDetails)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                Button {
                    photoDetailViewModel.downLoadImageFromUrl(imageUrl: photoDetails?.urlM) { success, error in
                        DispatchQueue.main.async {
                            let toast = Toast(text: "Photo Downloaded ")
                            ToastView.appearance().backgroundColor = .orange
                            toast.show()
                        }
                    }
                } label: {
                    Text("Save")
                    .foregroundColor(.blue)
                    .font(.custom(SecretKeys.customFontName, size: 20))
                }
            }
            .onAppear(perform: {
            })
    }
}

// MARK: - Previews
struct PhotoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView()
    }
}
