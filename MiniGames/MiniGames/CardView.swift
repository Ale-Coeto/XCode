//
//  SwiftUIView.swift
//  MiniGames
//
//  Created by Alejandra Coeto on 03/02/23.
//

import SwiftUI

struct CardView: View {
    @State private var playerScore = 0
    @State private var CPUScore = 0
    @State private var playerCard = "card" + String(2)
    @State private var CPUCard = "card" + String(2)
    @State private var tie = "Click on Deal button to begin"
    
    var body: some View {
        ZStack{
            Image("background").ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(CPUCard)
                    Spacer()
                }
                Spacer()
                
                Button(action:{
                    let c1 = Int.random(in: 2...14)
                    let c2 = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(c1)
                    CPUCard = "card" + String(c2)
                    
                    if c2  > c1 {
                        CPUScore += 1
                        tie = "Point for CPU"
                    }
                    else if c1 > c2 {
                        playerScore += 1
                        tie = "Point for Player"
                    }
                    else {
                        tie = "Tie!"
                    }
                    
                    },label:{
                        Image("dealbutton")
                    }
                )
                
                Text(tie)
                    .foregroundColor(Color.white)
                    .font(.title2)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle).foregroundColor(Color.white)
                    }
                    Spacer()
                    
                    VStack {
                        Text("CPU").font(.title).foregroundColor(Color.white).padding(.bottom, 10.0)
                            
                        Text(String(CPUScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            
                    }
                    Spacer()
                }
                
                Spacer()
            
            }
        }
        
       
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
