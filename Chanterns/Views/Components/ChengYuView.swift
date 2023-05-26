//
//  ChengYuView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 14/04/23.
//

import SwiftUI

struct ChengYuView: View {
    @Binding var chengYu: ChengYu
    @State var showPinyin: Bool
    
    var scrollImages = ["ScrollClose", "ScrollSemiOpen", "ScrollOpen"]
    @State var index = 0
    @State var showScrollClose = true
    @State var startAnimation = false
    @State var showChengYu = false
    
    
    var body: some View {
        ZStack {
            Image(scrollImages[index])
                .resizable()
                .scaledToFit()
            
            HStack {
                if showChengYu {
                    ForEach(chengYu.arrayCharacters){ character in
                        VStack {
                            Text(character.hanzi)
                                .font(.system(size: UIScreen.main.bounds.width > 850 ? 72 : 64))
                            Text(showPinyin ? character.pinyin : "")
                                .font(.system(size: UIScreen.main.bounds.width > 850 ? 50 : 40))
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 , execute: {
                if index < 2 {
                    index += 1
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6 , execute: {
                if index < 2 {
                    index += 1
                }
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9 , execute: {
                showChengYu = true
            })
            
        }
        .onDisappear {
            index = 0
            showChengYu = false
        }
    }
}

struct ChengYuView_Previews: PreviewProvider {
    static var previews: some View {
        ChengYuView(chengYu: .constant(ChengYu.example), showPinyin: true)
    }
}
