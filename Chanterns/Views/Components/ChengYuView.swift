//
//  ChengYuView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 14/04/23.
//

import SwiftUI

struct ChengYuView: View {
    @State var chengYu: ChengYu
    @State var showPinyin: Bool
    
    var scrollImages = ["ScrollClose", "ScrollSemiOpen", "ScrollOpen"]
    @State var index = 0
    @State var showScrollClose = true
    @State var startAnimation = false
    @State var showChengYu = false
    @State var fontSize = 96
//    @State var showScrollSemi = false
//    @State var showScrollOpen = false
    
    var body: some View {
        ZStack {
            Image(scrollImages[index])
                .resizable()
                .scaledToFit()
//                .frame(width: UIScreen.main.bounds.width / 2)
//                .animation(.linear(duration: 0.2), value: index)
//            VStack {
//                Text(showChengYu ? chengYu.complete : "")
//                    .font(.system(size: CGFloat(fontSize)))
//                if showPinyin && showChengYu {
//                    HStack {
//                        ForEach(chengYu.arrayCharacters){ hanzi in
//                            Text(hanzi.pinyin)
//                                .font(.system(size: 46))
//                        }
//                    }
//                }
//            }
            HStack {
                if showChengYu {
                        ForEach(chengYu.arrayCharacters){ character in
                            VStack {
                                Text(character.hanzi)
                                    .font(.system(size: CGFloat(fontSize)))
                                Text(showPinyin ? character.pinyin : "")
                                    .font(.system(size: CGFloat(fontSize - 30)))
                            }
                        }
                    
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 , execute: {
             index += 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6 , execute: {
             index += 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9 , execute: {
                showChengYu = true
            })
          
        }
    }
}

struct ChengYuView_Previews: PreviewProvider {
    static var previews: some View {
        ChengYuView(chengYu: ChengYu.example, showPinyin: true)
    }
}