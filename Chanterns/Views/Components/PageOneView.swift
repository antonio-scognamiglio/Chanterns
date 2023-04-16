//
//  OnBoardingPageView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import SwiftUI

struct PageOneView: View {
    @State var topText: Text
    @State var bottomText: Text
    @State var showNextButton: Bool
    @State var showPreviousButton: Bool
    @State var showSkipButton: Bool
    @State var showStartButton: Bool
    
    @Binding var showOnboarding: Bool
    @Binding var selection: Int
    @State var innerPosition: CGPoint?
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.whiteShade
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.75)
                    .cornerRadius(20)
                VStack {
                    topText
                    .font(.system(size: 44))
                    .padding(.horizontal, 30)
//                    .padding(.top)
 
//                        .frame(width: geo.size.width * 0.4)
//                        .padding(.vertical, 30)
                    GeometryReader { innerGeo in
                     
                            VStack {
                                ChengYuView(chengYu: .example, showPinyin: true, fontSize: 70)
                                    .frame(width: innerGeo.size.width * 0.7)
                            }
                            .frame(width: innerGeo.size.width, height: innerGeo.size.height)
                        }
                                                
                    
                    
                    bottomText
                    .font(.system(size: 44))
                    .padding(.horizontal, 30)
                    
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

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneView(topText: Text("Hey you, \(Text("你好").fontWeight(.bold)) (hello)!\nIn this playground, I’ll introduce you to a bit of Chinese Culture."), bottomText: Text("This above is a Chengyu a type of traditional Chinese idiomatic expression and they are very common in the spoken language."), showNextButton: true, showPreviousButton: true, showSkipButton: true, showStartButton: false, showOnboarding: .constant(false), selection: .constant(2))
    }
}
