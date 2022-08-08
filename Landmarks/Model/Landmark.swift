//
//  Landmark.swift
//  Landmarks
//
//  Created by Tsubasa Ishihara on 2022/08/08.
//

import Foundation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
}
