//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Aashish Adhikari on 6/25/20.
//  Copyright © 2020 Aashish. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .foregroundColor(.orange)
            .padding(5.0)
        }
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp{
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(lineWidth: self.strokeLine)
                    Text(self.card.content)
                }else{
                    if !self.card.isMatch{
                       RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontMultiplier))
        }
    }
    
    let cornerRadius: CGFloat = 10.0
    let strokeLine: CGFloat = 3.0
    let fontMultiplier: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
