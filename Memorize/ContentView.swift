//
//  ContentView.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//




import SwiftUI

struct ContentView: View {
    let emojies = ["😈", "🕷️", "👻", "🎃", "🧙", "😱", "👹", "🧟", "👺", "🧛🏿‍♂️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardVieW(content: emojies[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View { // by -> global name, offset -> local name
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojies.count)
    }
    
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
}




struct CardVieW: View {
    @State var isFaceUp = true
    let content: String
    let base = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




















#Preview {
    ContentView()
}
