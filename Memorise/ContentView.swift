//
//  ContentView.swift
//  Memorise
//
//  Created by Aashish Adhikari on 6/25/20.
//  Copyright © 2020 Aashish. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
        }
            .foregroundColor(.orange)
            .padding()
            .font(Font.largeTitle)
    }
}

struct CardView: View{
    var isFaceUp: Bool
    var body: some View{
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke()
                Text("👻")
            }else{
                RoundedRectangle(cornerRadius: 10.0)
                .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
