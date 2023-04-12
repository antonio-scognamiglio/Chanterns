//
//  ChineseLanternView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import SwiftUI

struct ChineseLanternView: View {
    @StateObject var chineseLantern: ChineseLantern

    
    var body: some View {
        if chineseLantern.isAnimationEnd || chineseLantern.isTapped {
            withAnimation {
                EmptyView()
            }
        } else {
            ZStack {
                Image(chineseLantern.lanternImage)
                Text(chineseLantern.character)
                    .font(.system(size: 96))
                    .padding(.bottom, 40)
            }
        }
    }
}

struct ChineseLanternView_Previews: PreviewProvider {
    static var previews: some View {
        ChineseLanternView(chineseLantern: ChineseLantern.example)
    }
}
