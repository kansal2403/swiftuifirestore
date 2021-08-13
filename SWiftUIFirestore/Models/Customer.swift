//
//  Customer.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Customer: Codable, Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var status: Int
}
