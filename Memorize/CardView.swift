//
//  CardView.swift
//  Memorize
//
//  Created by Berke Yılmaz on 1.02.2025.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card

    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.easeInOut(duration: 1), value: card.isMatched) // easeInOut ile animasyon suresini kontrol edebiliriz.
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 15
        }
    }
}


typealias Card = MemoryGame<String>.Card

#Preview {
    VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "x", id: "test1"))
            CardView(Card(isFaceUp: false, content: "x", id: "test2"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "this is very long text and this is a test ", id: "test1"))
            CardView(Card(isFaceUp: false, content: "x", id: "test2"))
        }
    }
    .padding()
    .foregroundColor(.green)
}
