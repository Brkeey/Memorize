//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//
// View

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3

    var body: some View {
        VStack {
            cards
                .foregroundColor(.orange)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                .onTapGesture {
                    withAnimation {
                        let scoreBeforeChoosing = viewModel.score
                        viewModel.choose(card)
                        let scoreChange = viewModel.score - scoreBeforeChoosing
                        lastScoreChange = (scoreChange, causedByCardId: card.id)
                    }
                }
        }
    }
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
}









#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
