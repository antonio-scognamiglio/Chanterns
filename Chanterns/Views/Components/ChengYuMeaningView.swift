//
//  ChengYuMeaningView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 17/04/23.
//

import SwiftUI

struct ChengYuMeaningView: View {
    var chengYu: ChengYu
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("ScrollOpen")
                    .resizable()
//                    .scaledToFit()
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.35)
                    .shadow(radius: 5)
                    .overlay {
                        VStack{
                            Text(chengYu.complete)
                                .font(.system(size: 64))
                                
                            HStack {
                                ForEach(chengYu.arrayCharacters){ character in
                                    Text(character.pinyin)
                                        .font(.system(size: 32))
                                }
                            }
                            .padding(.bottom, 1)
                                
                                Text(chengYu.meaning)
                                    .font(.system(size: 34))
                                    .frame(width: geo.size.width * 0.68, alignment: .leading)
//                                    .padding(.top, 1)
                            Spacer()
                            }
                        .frame(height: geo.size.height * 0.24)
                        }
                    }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ChengYuMeaningView_Previews: PreviewProvider {
    static var previews: some View {
        ChengYuMeaningView(chengYu: ChengYu.example)
    }
}
