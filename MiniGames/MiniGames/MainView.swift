//
//  ContentView.swift
//  MiniGames
//
//  Created by Alejandra Coeto on 03/02/23.
//

import SwiftUI



struct MainView: View {
    
    var body: some View {
        ZStack {
            
            Image("back").ignoresSafeArea()
            
            
            NavigationView {
                List(games, id: \.id) { gameSelected in
                    if gameSelected.id == 0 {
                        NavigationLink(destination: CardView()){
                            GamePreview(game: gameSelected)
                        }
                    } else {
                        NavigationLink(destination: SlotView()){
                            GamePreview(game: gameSelected)
                        }
                    }
                    
                }.navigationTitle("Test")
            }
            
        }
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
