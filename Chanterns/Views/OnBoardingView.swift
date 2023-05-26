//
//  OnBoardingView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var selection = 1
    @Binding var showOnboarding: Bool
    
    var body: some View {
        
        TabView(selection: $selection) {
            PageOneView(
                topText: Text("Hey you, \(Text("你好").fontWeight(.bold)) (hello)!\nIn this playground, I’ll introduce you to a bit of Chinese Culture."),
                bottomText: Text("This above is a \(Text("Chengyu").fontWeight(.bold)), a type of traditional Chinese idiomatic expression and they are very common in the spoken language."),
                showNextButton: true,
                showPreviousButton: false,
                showSkipButton: true,
                showStartButton: false,
                showOnboarding: $showOnboarding,
                selection: $selection)
                .tag(1)
            PageTwoView(
                topText: Text("The main goal of this game is to discover the meaning of these ChengYu.\nAs you can see on this Chinese lantern, there’s a character."), bottomText: Text("You need to recreate the sequence shown on the scroll by tapping on the lanterns. Order matters."),
                showNextButton: true,
                showPreviousButton: true,
                showSkipButton: true,
                showStartButton: false,
                showOnboarding: $showOnboarding,
                selection: $selection)
                .tag(2)
            PageThreeView(showNextButton: false, showPreviousButton: true, showSkipButton: false, showStartButton: true, showOnboarding: $showOnboarding, selection: $selection)
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .background{
            ZStack {
                Image("NightSkyLightPortrait")
                Image("ChineseLantern01")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottomTrailing)
                    .padding(.trailing, 50)
                    .padding(.top, 50)
            }
        }
        .ignoresSafeArea()
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(showOnboarding: .constant(true))
    }
}
