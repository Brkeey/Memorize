//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//
// Model

import Foundation

struct MemoryGame <CardContent> {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
                
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent // Herhangi bir tür olabilir. Bunu en yüksek dereceli kapsamda belirtmeliyiz.
        
        
    }
}
