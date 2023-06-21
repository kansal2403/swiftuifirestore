//
//  RoundCorner.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 21/06/23.
//

import Foundation
import SwiftUI
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
