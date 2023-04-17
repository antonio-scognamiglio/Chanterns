//
//  ChengYuListView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct ChengYuListView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @State var isShowingMeaning = false
    @State var chengYuIndex = 0
    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Image("ScrollOpen")
                        .overlay{
                            Text("ChengYu")
                                .font(.system(size: 48))
                        }
                        .padding(.top, 30)
                    Spacer()
                    LazyVGrid(columns: columns, spacing: 100) {
                        ForEach(gameViewModel.levels, id: \.levelNumber) { level in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.scrollPaper)
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 5)
                                    .fill(Color.yellowScroll)
                            }
                            .overlay {
                                if level.isCompleted {
                                    Text(level.chengYu.complete)
                                        .font(.system(size: 60))
                                } else {
                                    Text("????")
                                        .font(.system(size: 60))
                                }
                            }
                            .onTapGesture {
                                if level.isCompleted {
                                    chengYuIndex = gameViewModel.levels.firstIndex(where: { current in
                                        current == level
                                    }) ?? 0
                                    withAnimation {
                                        isShowingMeaning = true
                                    }
                                }
                            }
                            .frame(minHeight: 130)
                            .padding(.horizontal, 30)
                        }
                    }
                    .frame(height: geo.size.height * 0.73)
                    Spacer()
                    HStack {
                        Image("ChineseLantern01")
                            .padding(.leading)
                        Spacer()
                    }
                }
                .onTapGesture {
                    withAnimation {
                        isShowingMeaning = false
                    }
                }
                if isShowingMeaning {
                    ChengYuMeaningView(chengYu: gameViewModel.levels[chengYuIndex].chengYu)
                        .transition(.asymmetric(insertion: .scale, removal: .identity))
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background {
                Image("NightSkyLightNoStars")
                    .onTapGesture {
                        withAnimation {
                            isShowingMeaning = false
                        }
                    }

            }
        }
    }
}

struct ChengYuListView_Previews: PreviewProvider {
    static var previews: some View {
        ChengYuListView()
            .environmentObject(GameViewModel())
    }
}
