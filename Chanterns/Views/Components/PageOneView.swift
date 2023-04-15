//
//  OnBoardingPageView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import SwiftUI

struct PageOneView: View {
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.whiteShade
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.75)
                    .cornerRadius(20)
                VStack {
                    Text("Hey you, \(Text("你好").fontWeight(.bold)) (hello)!\nIn this playground, I’ll introduce you to a bit of Chinese Culture.")
                    .font(.system(size: 48))
                    .padding(.horizontal, 30)
                    .padding(.top, 100)
                    ChengYuView(chengYu: .example, showPinyin: true, fontSize: 70)
                        .frame(width: geo.size.width * 0.4)
                        .padding(.vertical, 30)
                    Text("This above is a Chengyu a type of traditional Chinese idiomatic expression and they are very common in the spoken language.")
                    .font(.system(size: 48))
                    .padding(.horizontal, 30)
//                    Spacer()
                }
                .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.75, alignment: .top)
            }
            .padding(.bottom, 50)
            .frame(width: geo.size.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        }
    }
}

struct OnBoardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneView()
    }
}
