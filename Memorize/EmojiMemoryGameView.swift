//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//
// View

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3

    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards) // Animasyonun uygulanabilmesi icin animasyonu uyguladıgımız seyin esitlenebilir == Equatable olmasi gerekir.
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(.orange)
    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card
    let base = RoundedRectangle(cornerRadius: 12)
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}




















#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
