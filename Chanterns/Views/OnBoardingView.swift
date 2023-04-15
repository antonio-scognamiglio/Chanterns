//
//  OnBoardingView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import SwiftUI

struct OnBoardingView: View {
@State private var selection = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            PageOneView()
                .tag(1)
            Text("Bro 2")
                .tag(2)
            Text("Pagina 3")
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
        OnBoardingView()
    }
}
