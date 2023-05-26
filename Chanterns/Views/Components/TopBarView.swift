//
//  TopBarView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 16/04/23.
//

import SwiftUI

struct TopBarView: View {
    
    @ObservedObject var level: Level
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        
        GeometryReader { geo in
            HStack {
                // Hearts
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gameButtonGradient)
                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.07)
                    HStack(spacing: 15) {
                        Image(systemName: gameViewModel.livesLeft >= 1 ? "heart.fill" : "heart")
                            .foregroundColor(.redHeart)
                            .font(.system(size: 44))
                            .shadow(radius: 5)
                        Image(systemName: gameViewModel.livesLeft >= 2 ? "heart.fill" : "heart")
                            .foregroundColor(.redHeart)
                            .font(.system(size: 44))
                            .shadow(radius: 5)
                        Image(systemName: gameViewModel.livesLeft >= 3 ? "heart.fill" : "heart")
                            .foregroundColor(.redHeart)
                            .font(.system(size: 44))
                            .shadow(radius: 5)
                    }
                }
                Spacer()
                // Time
                if level.timeLeft > 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gameButtonGradient)
                            .frame(width: geo.size.width * 0.16, height: geo.size.height * 0.07)
                        Text("\(level.timeLeft)")
                            .foregroundColor(.whiteShade)
                            .font(.system(size: 76))
                            .shadow(radius: 5)
                    }
                    .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.08)
                } else {
                    ZStack {
                        Image("ScrollOpen")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.08)
                            .animation(.easeIn, value: level.timeLeft)
                        HStack {
                            ForEach(level.chengYu.arrayCharacters) { character in
                                if character.isGuessed{
                                    Text(character.hanzi)
                                        .font(.system(size: UIScreen.main.bounds.width > 850 ? 56 : 46))
                                        .animation(.easeIn, value: character.isGuessed)
                                } else {
                                    Text("?")
                                        .font(.system(size: UIScreen.main.bounds.width > 850 ? 66 : 56))
                                        .animation(.easeIn, value: character.isGuessed)
                                }
                                
                            }
                        }
                    }
                }
                Spacer()
                Spacer()
                Button {
                    
                    withAnimation {
                        gameViewModel.isAnimationPaused = true
                    }
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
            .padding(.horizontal, 10)
            .padding(.top, 30)
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(level: OriginalLevels.defaultLevels[0])
            .environmentObject(GameViewModel())
    }
}
