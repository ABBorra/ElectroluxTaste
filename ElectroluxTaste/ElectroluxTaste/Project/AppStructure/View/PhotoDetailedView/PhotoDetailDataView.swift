//
//  PhotoDetailDataView.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import SwiftUI

struct PhotoDetailDataView: View {
    
    var photo: Photo?
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 6) {
                AsyncImage(url: URL(string: photo?.urlM ?? ""),
                           content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                        .shadow(radius: 10)
                        .frame(height: proxy.size.height * 0.7)
                        .frame(width: proxy.size.width * 0.9, alignment: .center)
                    
                    
                },
                           placeholder: {
                    Image("img")
                })
                
                
                Text("Title: \(photo?.title ?? "")")
                    .foregroundColor(Color(hue: 0.547, saturation: 0.859, brightness: 0.528))
                    .font(.custom(SecretKeys.customFontName, size: 20))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 8)
                
                Text("ID: \(photo?.id ?? "")")
                    .foregroundColor(Color.gray)
                    .font(.custom(SecretKeys.customFontName, size: 15))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text("Owner: \(photo?.owner ?? "")")
                    .foregroundColor(Color.black)
                    .font(.custom(SecretKeys.customFontName, size: 15))
                    .lineLimit(1)
            }
            .padding(.leading)
            //.edgesIgnoringSafeArea(.top)
        }
        
    }
}

// MARK: - Previews
struct PhotoDetailDataView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailDataView()
    }
}
