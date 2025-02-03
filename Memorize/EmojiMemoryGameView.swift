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
                .foregroundColor(.orange)
                Button("Shuffle") {
                    withAnimation {
                        viewModel.shuffle()
                    }
                }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                    }
                }
        }
    }
}









#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
