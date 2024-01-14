//
//  GamePreview.swift
//  MiniGames
//
//  Created by Alejandra Coeto on 03/02/23.
//

import SwiftUI



struct GamePreview: View {
    var game: Game
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            game.image
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .scaledToFit()
                
            VStack(alignment: .leading) {
                Text(game.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                .foregroundColor(Color.blue)
                Text(game.description)
            }
            Spacer()
        }
        .padding(.vertical)
        .background(Color(hue: 0.544, saturation: 0.074, brightness: 0.992))
        
        
    }
}

struct GamePreview_Previews: PreviewProvider {
    static var previews: some View {
        GamePreview(game: Game(id: 1, name:"om", image: Image(systemName: "bitcoinsign.circle"), description: "HI"))
    }
}
