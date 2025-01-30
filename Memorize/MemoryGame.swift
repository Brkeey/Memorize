//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Berke Yılmaz on 26.01.2025.
//
// Model

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
                
        }
    }
    
    var indexOfTheOneAndOnlFaceUpCard: Int? {
        get {
            var faceUpCardIndicies = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndicies.append(index)
                }
            }
            if faceUpCardIndicies.count == 1 {
                return faceUpCardIndicies.first
            } else {
                return nil
            }
        }
        set {
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
        
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[potentialMatchIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable { // Equatable --> == esitlenebilir yaptik.
        var isFaceUp = false
        var isMatched = false
        var content: CardContent // Herhangi bir tür olabilir. Bunu en yüksek dereceli kapsamda belirtmeliyiz.
        var id: String
        
        
    }
}
