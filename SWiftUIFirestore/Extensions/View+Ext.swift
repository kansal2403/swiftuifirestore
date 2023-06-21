//
//  View+Ext.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 21/06/23.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
