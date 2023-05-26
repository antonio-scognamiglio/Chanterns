//
//  ChengYuListView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct ChengYuListView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @Environment (\.dismiss) var dismiss
    
    @State var isShowingMeaning = false
    @State var chengYuIndex = 0
    let columns = [
        GridItem(.flexible(minimum: 150)),
        GridItem(.flexible(minimum: 150)),
        GridItem(.flexible(minimum: 150))
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    
                    ZStack {
                        Image("ScrollOpen")
                            .overlay{
                                Text("ChengYu")
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
                    
                    LazyVGrid(columns: columns, spacing: 100) {
                        ForEach(gameViewModel.levels) { level in
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
                                        .font(.system(size: 50))
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
                            .padding(.horizontal, 20)
                        }
                    }
                    .frame(height: geo.size.height * 0.68)
                    HStack {
                        Image("ChineseLantern01")
                            .padding(.leading)
                        Spacer()
                    }
                    .frame(height: geo.size.height * 0.12)
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
            .navigationBarBackButtonHidden()
            .frame(width: geo.size.width, height: geo.size.height)
            .background {
                Image("NightSkyLightNoStars")
                    .resizable()
                    .ignoresSafeArea()
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
