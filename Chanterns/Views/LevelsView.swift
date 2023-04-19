//
//  LevelsView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct LevelsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @Environment (\.dismiss) var dismiss
    
    let columns = [
        GridItem(.adaptive(minimum: 260))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    ZStack {
                        Image("ScrollOpen")
                            .overlay{
                                Text("Levels")
                                    .font(.system(size: 48))
                            }
                        HStack {
                            Button {
                                withAnimation {
                                    dismiss()
                                }
                            } label: {
                                Image(systemName: "arrowshape.left.fill")
                                    .font(.system(size: 96))
                                    .foregroundColor(.scrollPaper)
                                    .padding(.leading, 50)
                                
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, 40)
                    Spacer()
                    
                    LazyVGrid(columns: columns, spacing: 100) {
                        ForEach(gameViewModel.levels) { level in

                            if level.isUnlocked {
                                NavigationLink(destination: GameView(currentLevel: level)){
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.scrollPaper)
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 5)
                                            .fill(Color.yellowScroll)
                                    }
                                    .overlay {
                                            Text(level.levelNumber.rawValue)
                                                .font(.system(size: 72))
                                                .foregroundColor(.black)
                                    }
                                    .frame(minHeight: 160)
                                    .padding(.horizontal, 50)
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.scrollPaper)
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 5)
                                        .fill(Color.yellowScroll)
                                }
                                        .overlay {
                                            Text("🔒")
                                                .font(.system(size: 72))
                                            
                                        }
                                        .frame(minHeight: 160)
                                        .padding(.horizontal, 50)
                                
                            }
                        }
                    }
                    .frame(height: geo.size.height * 0.68)
                    Spacer()
                    HStack {
                        Image("ChineseLantern02b")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 0.18)
                            .shadow(color: .pink, radius: 150)
                            .padding(.leading)
                        Spacer()
                    }
                    .frame(height: geo.size.height * 0.12)
                }
          
            }
            .navigationBarBackButtonHidden()
            .frame(width: geo.size.width, height: geo.size.height)
            .background {
                Image("NightSkyLightPortrait")
                    .resizable()
                    
                    .ignoresSafeArea()
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
