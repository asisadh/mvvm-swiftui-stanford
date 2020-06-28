//
//  Pie.swift
//  Memorise
//
//  Created by Asis on 6/26/20.
//  Copyright © 2020 Aashish. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle = Angle.degrees(0-90)
    var endAngle: Angle = Angle.degrees(110-90)
    var clockwise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.height, rect.width) / 2
        
        var path = Path()
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)),
                                 y: center.y + radius * sin(CGFloat(startAngle.radians))))
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        path.addLine(to: center)
        return path
    }
}
