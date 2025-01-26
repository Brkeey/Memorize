//
//  ContentView.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//

import SwiftUI

struct ContentView: View {
    let emojies = ["😈", "🕷️", "👻", "🎃"]
    
    var body: some View {
        HStack {
            ForEach(emojies, id: \.self) { emoji in
                CardVieW(content: emoji)
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}


struct CardVieW: View {
    @State var isFaceUp = true
    let content: String
    let base = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




















#Preview {
    ContentView()
}
