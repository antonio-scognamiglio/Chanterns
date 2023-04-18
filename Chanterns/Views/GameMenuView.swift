//
//  GameMenu.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import SwiftUI

struct GameMenuView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @State var isShowingOnboarding = true
    var body: some View {
        
        NavigationView {
            VStack(spacing: 50) {
                Spacer()
                ZStack {
                    Image("BigChineseLantern01")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.3)
                    Image("Sticker")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.22)
                        .padding(.bottom, 50)
                    Text("你好")
                        .font(.system(size: 64))
                        .padding(.bottom, 50)
                        
                }
                    NavigationLink(destination: LevelsView()){
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.whiteShade)
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.08)
                            .overlay {
                                Text("Play")
                                    .foregroundColor(.black)
                                    .font(.system(size: 48))
                            }
                    }
                    .padding(.top, 100)
                    NavigationLink(destination: ChengYuListView()){
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.whiteShade)
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.08)
                            .overlay {
                                Text("ChengYu")
                                    .foregroundColor(.black)
                                    .font(.system(size: 48))
                            }
                    }
                Spacer()
                Spacer()
                }
                .background {
                    Image("NightSkyLightPortrait")
                        .ignoresSafeArea()
            }
                .fullScreenCover(isPresented: $isShowingOnboarding) {
                    OnBoardingView(showOnboarding: $isShowingOnboarding)
                }
                
        }
        .navigationViewStyle(.stack)

    }
}

struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuView()
            .environmentObject(GameViewModel())
    }
}
