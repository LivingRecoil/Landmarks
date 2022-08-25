//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Tsubasa Ishihara on 2022/08/10.
//

import SwiftUI

struct LandmarkList: View {
    // A property wrapper for an observable object supplied by a parent or ancestor view
    @EnvironmentObject var modelData: ModelData
    
    // Synchronize views referring to this property with
    @State private var showFavaritesOnly: Bool
    init() {
        _showFavaritesOnly = State(initialValue: false)
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            // In which only one of the two values has to be true
            // for the overall expression to be true
            (!showFavaritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // A switcher toggles true or false
                Toggle(isOn: $showFavaritesOnly) {
                    Text("Favorites only")
                }
                
                // Display rows depending on whether
                //the property is true or false
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
