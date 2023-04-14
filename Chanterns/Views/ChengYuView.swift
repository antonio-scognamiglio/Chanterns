//
//  ChengYuView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 14/04/23.
//

import SwiftUI

struct ChengYuView: View {
    @State var chengYu: ChengYu
    
    var body: some View {
        ZStack {
            Image("ScrollOpen")
            
        }
    }
}

struct ChengYuView_Previews: PreviewProvider {
    static var previews: some View {
        ChengYuView(chengYu: ChengYu.example)
    }
}
