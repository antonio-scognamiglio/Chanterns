//
//  PauseView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct PauseView: View {
    
    @ObservedObject var gameViewModel: GameViewModel
//    @Binding var isMusicOn: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack {
//                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.popOverGradient)
                        .shadow(radius: 5)
                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.39)
                        .overlay {
                            VStack(spacing: 50) {
                                Button {
                                    withAnimation {
                                        gameViewModel.isAnimationPaused = false
//                                        // generate lanterns again
                                        
//                                        gameViewModel.chineseLanternColumns.columnA.yPosition = gameViewModel.yStartPosition
//                                        gameViewModel.chineseLanternColumns = gameViewModel.temporaryArray
//                                        gameViewModel.temporaryArray = ChineseLanternColumns()
                                    }
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.whiteShade)
//                                        .shadow(radius: 5)
                                        .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.08)
                                        .overlay {
                                            Text("Resume")
                                                .foregroundColor(.black)
                                                .font(.system(size: 44))
                                        }
                                        .padding(.top, 40)
                                }
                                Button {
                                    // pop to root action
                                    //
                                } label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.whiteShade)
//                                        .shadow(radius: 5)
                                        .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.08)
                                        .overlay {
                                            Text("Main Menu")
                                                .foregroundColor(.black)
                                                .font(.system(size: 44))
                                        }
                                }
                                HStack {
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gameButtonGradient)
//                                        .shadow(radius: 3)
                                        .frame(width: geo.size.height * 0.08, height: geo.size.height * 0.07)
                                        
                                        .overlay {
                                            Image(systemName: "speaker.wave.3.fill")
                                                .foregroundColor(.whiteShade)
                                                .font(.system(size: 44))
                                        }
                                }
                                .padding(.trailing, 30)
                            }
                        }
//                }
            }
//            .overlay {
//                Color.gray.opacity(0.1)
//                    .cornerRadius(30)
//            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView(gameViewModel: GameViewModel())
    }
}
