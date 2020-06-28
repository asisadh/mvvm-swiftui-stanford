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
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        if card.isFaceUp || !card.isMatch{
        ZStack {
            Pie()
                .padding(5)
                .opacity(0.4)
            Text(card.content)
                .font(Font.system(size: min(size.width, size.height) * 0.7))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
}

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    var cornerRadius: CGFloat{ return 10.0 }
    var strokeLine: CGFloat{ return 3.0 }
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: self.strokeLine)
                content
            }else{
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
}

extension View{
    func cardify( isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        viewModel.choose(card: viewModel.cards[0])
        return EmojiMemoryGameView(viewModel: viewModel)
    }
}
