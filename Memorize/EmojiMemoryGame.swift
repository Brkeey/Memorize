//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame {
    private var model = MemoryGame(numberOfPairsOfCards: 4){ pairIndex in
        return ["😈", "🕷️", "👻", "🎃", "🧙", "😱", "👹", "🧟", "👺", "🧛🏿‍♂️"][pairIndex]
    }
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
