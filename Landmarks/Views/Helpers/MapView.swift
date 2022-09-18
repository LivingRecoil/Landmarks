//
//  MapView.swift
//  Landmarks
//
//  Created by Tsubasa Ishihara on 2022/08/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    // A coordinate of the landmarks
    var coordinate: CLLocationCoordinate2D
    // A region centered around a coordinate
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            // A trigger to caluculate the region
            // based on the current coordinate
            // before displaying the map
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    // This is the trigger action.
    // After taking a coordinate,
    // this fucntion passes a region
    // centered around it to a variable
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2
            )
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            coordinate: CLLocationCoordinate2D(
                latitude: 34.011_286,
                longitude: -116.166_868
            )
        )
    }
}
