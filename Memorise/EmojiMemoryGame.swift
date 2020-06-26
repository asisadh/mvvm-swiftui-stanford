//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Asis on 6/25/20.
//  Copyright © 2020 Aashish. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        let emojiArray = [ "🤣", "🙂", "👷🏻‍♂️", "😛", "😅", "😍", "😝"]
        return MemoryGame<String>(numberOfPairOfCards: emojiArray.count) { index in
            return emojiArray[index]
        }
    }
    
    //MARK:- Access to Model
    var cards: [MemoryGame<String>.Card]{
        model.cards
    }
    
    //MARK:- Intent(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
