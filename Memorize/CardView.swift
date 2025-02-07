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
        TimelineView (.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContents.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
                
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duaration: 1), value: card.isMatched)
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
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 15
        }
    }
}

extension Animation {
    static func spin(duaration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
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
