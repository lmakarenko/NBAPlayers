//
//  Team.swift
//  NBAPlayers
//
//  Created by Aleksandr Anosov on 23.01.2021.
//

import Foundation

struct Team: Decodable {
    let name: String
    let city: String
    let conference: String
    let abbreviation: String

    var fullName: String {
        city + " " + name
    }
}
