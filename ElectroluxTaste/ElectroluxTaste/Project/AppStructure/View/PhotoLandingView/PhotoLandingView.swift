//
//  ContentView.swift
//  ElectroluxTaste
//
//  Created by AB_Borra on 5/29/23.
//

import SwiftUI

struct PhotoLandingView: View {
    
    @State var selectedIndex: Int  = 0
    @State var moveToDetailScreen: Bool = false
    @State private var searchText: String = ""
    @StateObject var photoListViewModel = PhotoListViewModel()
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true ) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),
                                                                 spacing: 4), count: 3), spacing: 20) {
                        
                        ForEach(0..<(photoListViewModel.photoGallery?.count ?? 0), id: \.self) { index in
                            VStack{
                                if let photo = photoListViewModel.photoGallery {
                                    /* Updating UI in below frame */
                                    PhotoDataView(photoDetails: photo[index])
                                        .frame(height: 200)
                                        .frame(width: 150)
                                    
                                        .contentShape(Path(CGRect(x: 0, y: 0, width: 150, height: 200)))
                                        .onTapGesture {
                                            selectedIndex = index
                                            moveToDetailScreen = true
                                        }
                                    if index == (photoListViewModel.photoGallery?.count ?? 0) - 1 {
                                        
                                        HStack {
                                            Spacer()
                                            ProgressView()
                                                .onAppear {
                                                    photoListViewModel.fetchData(){}
                                                }
                                            Spacer()
                                        }
                                    }
                                    
                                } else {
                                    Color.clear
                                        .frame(width: 0, height: 0)
                                }
                            }
                        }
                        
                    }
                   .listStyle(.plain)
                }
                if ((photoListViewModel.photoGallery?.count ?? 1) > 0) {
                    
                    NavigationLink(destination: PhotoDetailView(photoDetails: photoListViewModel.photoGallery?[selectedIndex]),
                                   isActive: $moveToDetailScreen) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle("Flickr Photos")
            .searchable(text: $searchText, placement:
                    .navigationBarDrawer(displayMode: .always),
                        prompt: SecretKeys.defaultSearchTag)
            
            .onChange(of: searchText) {  search in
                
                photoListViewModel.searchImage = search
                photoListViewModel.resetPage { }
            }
            .onAppear {
                if photoListViewModel.photoGallery?.count == 0 {
                    photoListViewModel.fetchData(){ }
                }
            }
        }
    }
}

// MARK: - Previews
struct PhotoLandingView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLandingView()
    }
}
