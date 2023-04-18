//
//  PageThreeView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 16/04/23.
//

import SwiftUI

struct PageThreeView: View {
    @State var showNextButton: Bool
    @State var showPreviousButton: Bool
    @State var showSkipButton: Bool
    @State var showStartButton: Bool
    
    @Binding var showOnboarding: Bool
    @Binding var selection: Int
 

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.75)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text("In every level there will be a top bar composed of three elements.")
                        .font(.system(size: 36))
                    .padding(.horizontal, 30)
                    
                    GeometryReader { innerGeo in
                        VStack {
                            Image("TopBar")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(width: innerGeo.size.width * 0.9)
                        }
                        .frame(width: innerGeo.size.width, height: innerGeo.size.height)
                    }
                    
                    Text("On the left are your chances of making a mistake, every time you tap on the wrong lantern you will lose a chance.")
                        .font(.system(size: 36))
                        .padding(.horizontal, 30)
                        .padding(.bottom)
                    Text("In the center is the time you have to memorize the scroll before it disappears.")
                        .font(.system(size: 36))
                        .padding(.horizontal, 30)
                        .padding(.bottom)
                    Text("Finally on the right is a button to pause the game.")
                        .font(.system(size: 36))
                        .padding(.horizontal, 30)
//                    Spacer()
                    
                    HStack {
                        if showSkipButton {
                            Button(action: {
                                withAnimation {
                                    showOnboarding = false
                                }
                            }, label: {
                                Text("Skip")
                                    .foregroundColor(.gameButtonTop)
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(uiColor: .systemGroupedBackground))
                                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.05)
                                    .padding(.horizontal, 7)
//                                    .padding(.top)
                            })
                        }
                        
                        Spacer()
                        if showPreviousButton{
                            Button(action: {
                                withAnimation {
                                    selection -= 1
                                }
                            }, label: {
                                Text("\(Image(systemName: "chevron.left")) Previous")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(uiColor: .systemGroupedBackground))
                                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.05)
                                    .background(Color.gameButtonGradient)
                                    .cornerRadius(15)
                                    .shadow(radius: 2)
                                    .padding(.horizontal, 10)
//                                    .padding(.top)
                            })
                        }
                        
                        if showNextButton {
                            Button(action: {
                                withAnimation {
                                    selection += 1
                                }
                            }, label: {
                                Text("Next \(Image(systemName: "chevron.right"))")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(uiColor: .systemGroupedBackground))
                                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.05)
                                    .background(Color.gameButtonGradient)
                                    .cornerRadius(15)
                                    .shadow(radius: 2)
                                    .padding(.trailing, 50)
//                                    .padding(.top)
                            })
                        }
                        
                        if showStartButton {
                            Button(action: {
                                withAnimation {
                                    showOnboarding = false
                                }
                            }, label: {
                                Text("Get Started")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(uiColor: .systemGroupedBackground))
                                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.05)
                                    .background(Color.gameButtonGradient)
                                    .cornerRadius(15)
                                    .shadow(radius: 2)
                                    .padding(.trailing, 50)
//                                    .padding(.top)
                            })
                        }

                    }
                }
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.70, alignment: .top)
            }
            .padding(.bottom, 50)
            .frame(width: geo.size.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        }
    }
}

struct PageThreeView_Previews: PreviewProvider {
    static var previews: some View {
        PageThreeView(showNextButton: true, showPreviousButton: true, showSkipButton: true, showStartButton: false, showOnboarding: .constant(false), selection: .constant(2))
    }
}
