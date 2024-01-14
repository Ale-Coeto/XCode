//
//  Memorize.swift
//  MiniGames
//
//  Created by Alejandra Coeto on 06/02/23.
//

import SwiftUI

struct Memorize: View {
    @State var index = 0
    
    
    

   
    var body: some View {

        
        
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
//                ForEach(emojis[index][0..<emojis[index].count], id: \.self) { emoji in
//                    MemoCardView(txt: emoji)
//
//                }
                
            }.padding(.horizontal)
            Spacer()
            HStack {
                sportTheme
                Spacer()
                weatherTheme
                Spacer()
                flagTheme
            }.padding(.horizontal)
                .font(.title)
        }
    }
    
    var sportTheme: some View {
            Button {
                index
            } label: {
                VStack {
                    Image(systemName: "sportscourt.circle")
                    Text("Sports")
                }
        }
    }
    var weatherTheme: some View {
            Button {
                index
            } label: {
                VStack {
                    Image(systemName: "sun.max.circle")
                    Text("Weather")
                }
        }
    }
    var flagTheme: some View {
            Button {
                index
            } label: {
                VStack {
                    Image(systemName: "flag.circle")
                    Text("Flags")
                }
        }
    }
}


struct MemoCardView: View {
    var txt: String
    @State var faceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack {
            if faceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(txt)
            } else {
                shape.fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
            .foregroundColor(.blue)
            .onTapGesture {
                faceUp = !faceUp
            }
    }
}

struct Memorize_Previews: PreviewProvider {
    static var previews: some View {
        Memorize()
    }
}
