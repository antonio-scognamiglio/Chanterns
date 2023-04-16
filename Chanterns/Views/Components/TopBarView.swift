//
//  TopBarView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 16/04/23.
//

import SwiftUI

struct TopBarView: View {
    @Binding var livesLeft: Int
    
    var body: some View {
        
        GeometryReader { geo in
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gameButtonGradient)
                        .frame(width: geo.size.width * 0.27, height: geo.size.height * 0.075)
                    HStack(spacing: 30) {
                        Image(systemName: livesLeft >= 1 ? "heart.fill" : "heart")
                            .foregroundColor(.redHeart)
                            .font(.system(size: 44))
                            .shadow(radius: 5)
                        Image(systemName: livesLeft >= 2 ? "heart.fill" : "heart")
                            .foregroundColor(.redHeart)
                            .font(.system(size: 44))
                            .shadow(radius: 5)
                        Image(systemName: livesLeft >= 3 ? "heart.fill" : "heart")
                            .foregroundColor(.redHeart)
                            .font(.system(size: 44))
                            .shadow(radius: 5)
                    }
                }
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gameButtonGradient)
                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.075)
                Spacer()
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gameButtonGradient)
                    .frame(width: geo.size.height * 0.08, height: geo.size.height * 0.075)
            }
            .padding(.horizontal, 20)
            .padding(.top, 30)
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(livesLeft: .constant(2))
    }
}
