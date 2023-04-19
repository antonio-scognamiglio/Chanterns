//
//  PageTwoView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 16/04/23.
//

import SwiftUI

struct PageTwoView: View {
    @State var topText: Text
    @State var bottomText: Text
    @State var showNextButton: Bool
    @State var showPreviousButton: Bool
    @State var showSkipButton: Bool
    @State var showStartButton: Bool
    
    @Binding var showOnboarding: Bool
    @Binding var selection: Int
    @State var innerPosition: CGPoint?
    @State var forceUpdate = UUID()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.75)
                    .cornerRadius(20)
                VStack {
                    topText
                        .font(.system(size: 36))

                    GeometryReader { innerGeo in
                            ZStack {
                                Image("NightSkyDark")
                                    .resizable()
                                    .cornerRadius(10)
    //                                .scaledToFill()
                                    .frame(width: geo.size.width * 0.75, height: geo.size.height * 0.25)
                                
                                Image("ChineseLantern01")
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        Text("好")
                                            .font(.system(size: 48))
                                            .padding(.bottom, 20)
                                    }
                                    .frame(width: geo.size.width * 0.15)
                                //                                .padding(.vertical, 30)
                                    .position(x: innerPosition?.x ?? innerGeo.frame(in: .local).midX + 200, y: innerPosition?.y ?? innerGeo.frame(in: .local).midY)
                                   
                            }
                            .id(forceUpdate)
                            .onAppear {
                                forceUpdate = UUID()
                                innerPosition = CGPoint(x: innerGeo.frame(in: .local).midX + 200, y: innerGeo.frame(in: .local).midY)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                    withAnimation(Animation.linear(duration: 5).repeatForever()) {
                                            innerPosition?.x -= 400
                                        }
                                }
                        }
                            .onDisappear {
                                innerPosition = CGPoint(x: innerGeo.frame(in: .local).midX + 200, y: innerGeo.frame(in: .local).midY)
                            }
                    }
                    
                    
                    bottomText
                        .font(.system(size: 36))
//                    .padding(.horizontal, 30)
                    
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

struct PageTwoView_Previews: PreviewProvider {
    static var previews: some View {
        PageTwoView(topText: Text("The main goal of this game is to discover the meaning of these ChengYu.\nAs you can see on this Chinese lantern, there’s a character."), bottomText: Text("You need to recreate the sequence shown on the scroll by tapping on lanterns. Order matters."), showNextButton: true, showPreviousButton: true, showSkipButton: true, showStartButton: false, showOnboarding: .constant(false), selection: .constant(2))
    }
}
