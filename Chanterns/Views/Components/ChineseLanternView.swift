//
//  ChineseLanternView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import SwiftUI

struct ChineseLanternView: View {
    @StateObject var chineseLantern: ChineseLantern
    var dynamicSize: CGFloat {
        (UIScreen.main.bounds.width - 250) / 4
    }
    
    var body: some View {
//        if chineseLantern.isAnimationEnd || chineseLantern.isTapped {
//            withAnimation {
//                EmptyView()
//            }
//        } else {
            ZStack {
                Image(chineseLantern.lanternImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dynamicSize)
                Text(chineseLantern.character)
                    .font(.system(size: UIScreen.main.bounds.width > 850 ? 96 : 70))
                    .padding(.bottom, 30)
            }
//        }
    }
}

struct ChineseLanternView_Previews: PreviewProvider {
    static var previews: some View {
        ChineseLanternView(chineseLantern: ChineseLantern.example)
    }
}
