//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static let emojis = ["😈", "🕷️", "👻", "🎃", "🧙", "😱", "👹", "🧟", "👺", "🧛🏿‍♂️"]
    
    @Published private var model = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12){ pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var score:Int {
        model.score
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
