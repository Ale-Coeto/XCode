//
//  File.swift
//  MiniGames
//
//  Created by Alejandra Coeto on 03/02/23.
//

import Foundation
import SwiftUI

struct Game {
    var id: Int
    var name: String
    var image: Image
    var description: String
}

let games = [Game(id: 0, name: "Card Battle", image: Image(systemName: "suit.spade"), description: "Game of luck"),
                     Game(id: 1, name: "Slot machine", image: Image(systemName: "bitcoinsign.circle.fill"), description: "Classic game of slot machine")]



