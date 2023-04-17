//
//  ChengYuListView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct ChengYuListView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        GeometryReader { geo in
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
            .frame(width: geo.size.width, height: geo.size.height)
            .background {
                Image("NightSkyLightNoStars")
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
