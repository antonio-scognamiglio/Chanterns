//
//  TopBarView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 16/04/23.
//

import SwiftUI

struct TopBarView: View {
    @Binding var livesLeft: Int
    @Binding var timeLeft: Int
    
    var body: some View {
        
        GeometryReader { geo in
            HStack {
                // Hearts
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gameButtonGradient)
                        .frame(width: geo.size.width * 0.27, height: geo.size.height * 0.07)
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
                // Time
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gameButtonGradient)
                        .frame(width: geo.size.width * 0.16, height: geo.size.height * 0.07)
                    Text("\(timeLeft)")
                        .foregroundColor(.whiteShade)
                        .font(.system(size: 76))
                        .shadow(radius: 5)
                }
                Spacer()
                Spacer()
                // Play/Pause Button
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gameButtonGradient)
                            .frame(width: geo.size.height * 0.08, height: geo.size.height * 0.07)
                        Image(systemName: "pause.fill")
                            .foregroundColor(.whiteShade)
                            .font(.system(size: 60))
                            .shadow(radius: 5)
                    }
                }
              
            }
            .padding(.horizontal, 20)
            .padding(.top, 30)
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(livesLeft: .constant(2), timeLeft: .constant(10))
    }
}
