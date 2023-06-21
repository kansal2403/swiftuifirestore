//
//  CustomerCell.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 13/08/21.
//

import SwiftUI

struct CustomerCell: View {
    
    let customer: Customer
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(customer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
                Text("\(customer.age)")
                    .font(.title2)
                    .fontWeight(.medium)
            }
            HStack {
                Text(customer.id ?? "")
                    .font(.body)
                Spacer()
            }
        }
    }
}


struct CustomerCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCell(customer: Customer.init(name: "Test User", age: 32, status: 0))
    }
}
