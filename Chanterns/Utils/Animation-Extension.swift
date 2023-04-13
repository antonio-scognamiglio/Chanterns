//
//  Animation-Extension.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 13/04/23.
//

import Foundation
import SwiftUI

extension View {
    func animate(duration: CGFloat, _ execute: @escaping () -> Void) async {
        await withCheckedContinuation { continuation in
            withAnimation(.linear(duration: duration)) {
                execute()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                continuation.resume()
            }
        }
    }
}



/* Si usa in questo modo con task
 .onTapGesture {
        Task {
            let animationTime = 0.5
  
            await animate(duration: animationTime) {
                firstAnimation = true
            }
  
            await animate(duration: animationTime) {
                secondAnimation = true
            }
  
            displaySheet = true
        }
    }
 */

// Ma a me serve comunque un Publisher, non posso fare sempre onChange
