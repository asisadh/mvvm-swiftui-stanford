//
//  Grid.swift
//  Memorise
//
//  Created by Asis on 6/25/20.
//  Copyright © 2020 Aashish. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var viewForItem: (Item) -> (ItemView)
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> (ItemView)){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View{
        ForEach(items){ item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View{
        let index = self.items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count{
            if self[index].id == matching.id {
                return index
            }
        }
        return nil // TODO: Bogus
    }
}

extension Array{
    var only: Element? { count == 1 ? first : nil }
}
