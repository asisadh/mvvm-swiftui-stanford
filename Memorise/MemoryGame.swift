//
//  MemoryGame.swift
//  Memorise
//
//  Created by Asis on 6/25/20.
//  Copyright © 2020 Aashish. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent: Equatable>{
    
    var cards: [Card]
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatch{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[potentialMatchIndex].content == cards[chosenIndex].content{
                    cards[potentialMatchIndex].isMatch = true
                    cards[chosenIndex].isMatch = true
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> (CardContent)){
        var cards = [Card]()
        for index in 0..<numberOfPairOfCards{
            let cardContent = cardContentFactory(index)
            cards.append(Card(id: index * 2, content: cardContent))
            cards.append(Card(id: index * 2 + 1, content: cardContent))
        }
        self.cards = cards.shuffled()
    }
    
    struct Card: Identifiable{
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        
        let content: CardContent
    }
}
