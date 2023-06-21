//
//  BackdropBlurView.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 21/06/23.
//

import Foundation
import SwiftUI
/// A transparent View that blurs its background
struct BackdropBlurView: View {
    
    let radius: CGFloat
    
    @ViewBuilder
    var body: some View {
        BackdropView().blur(radius: radius)
    }
}
