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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct PhotoLandingView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLandingView()
    }
}
