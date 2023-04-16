//
//  Color-Extension.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import Foundation
import SwiftUI

extension Color {
    static let whiteShade = Color(uiColor: #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1))
    static let scrollPaper = Color(uiColor: #colorLiteral(red: 1, green: 0.9725490196, blue: 0.9176470588, alpha: 1))
    static let yellowStar = Color(uiColor: #colorLiteral(red: 1, green: 0.8980392157, blue: 0.5921568627, alpha: 1))
    static let redHeart = Color(uiColor: #colorLiteral(red: 0.9333333333, green: 0.2862745098, blue: 0.2823529412, alpha: 1))
    static let gameButtonTop = Color(uiColor: #colorLiteral(red: 0.2666666667, green: 0.2745098039, blue: 0.3333333333, alpha: 1))
    static let gameButtonBottom = Color(uiColor: #colorLiteral(red: 0.3176470588, green: 0.337254902, blue: 0.4156862745, alpha: 1))

    static let gameButtonGradient = LinearGradient(gradient: Gradient(colors: [gameButtonTop, gameButtonBottom]), startPoint: .top, endPoint: .bottom)
    
}
