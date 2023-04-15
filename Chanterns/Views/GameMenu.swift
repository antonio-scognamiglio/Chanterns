//
//  GameMenu.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import SwiftUI

struct GameMenu: View {
    let buttonColor = Color(#colorLiteral(red: 0.8797428012, green: 0.8797428012, blue: 0.8797428012, alpha: 1))
    
    var body: some View {
//        GeometryReader { geo in
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
                Button {
                    // Action to come
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(buttonColor)
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.08)
                        .overlay {
                            Text("Play")
                                .foregroundColor(.black)
                                .font(.system(size: 48))
                        }
                }
                .padding(.top, 100)
                Button {
                    // Action to come
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(buttonColor)
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
//        }
    }
}

struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameMenu()
    }
}
