//
//  LevelsView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct LevelsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
   
    let columns = [
        GridItem(.adaptive(minimum: 270))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Image("ScrollOpen")
                            .overlay{
                                Text("Levels")
                                    .font(.system(size: 48))
                            }
                            .padding(.top, 30)
                    Spacer()
                    LazyVGrid(columns: columns, spacing: 100) {
                        ForEach(gameViewModel.levels) { level in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.scrollPaper)
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 5)
                                    .fill(Color.yellowScroll)
                            }
                            .overlay {
                                if level.isUnlocked {
                                    Text(level.levelNumber.rawValue)
                                        .font(.system(size: 72))
                                } else {
                                    Text("🔒")
                                        .font(.system(size: 72))
                                }
                            }
                            .frame(minHeight: 160)
                            .padding(.horizontal, 50)
                        }
                    }
                    .frame(height: geo.size.height * 0.7)
                    Spacer()
                    HStack {
                        Image("ChineseLantern02b")
                            .shadow(color: .pink, radius: 150)
                            .padding(.leading)
                        Spacer()
                    }
                }
          
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background {
                Image("NightSkyLightNoStars")

            }
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
            .environmentObject(GameViewModel())
    }
}
