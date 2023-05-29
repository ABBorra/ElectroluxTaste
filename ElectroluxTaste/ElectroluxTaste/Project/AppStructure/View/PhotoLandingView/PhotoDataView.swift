//
//  PhotoDataView.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import SwiftUI

struct PhotoDataView: View {
    var photoDetails: Photo?
    
    var body: some View {
        GeometryReader { proxy in
            
            VStack(alignment: .center, spacing: 0) {
                
                AsyncImage(url: URL(string: photoDetails?.urlM ?? ""),
                           content: { image in
                    image
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.size.width * 0.8)
                        .frame(height: proxy.size.height * 0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                        .clipped()
                        
                },  placeholder: {
                    
                })
                
                Text(photoDetails?.title ?? "")
                    .lineLimit(2)
                    .foregroundColor(Color(hue: 0.547, saturation: 0.859, brightness: 0.528))
                    .font(.custom(SecretKeys.customFontName, size: 18))
                    .multilineTextAlignment(.leading)
                    
                Text(photoDetails?.id ?? "")
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.custom(SecretKeys.customFontName, size: 15))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding()
        }
    }
}

struct PhotoDataView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDataView()
    }
}
