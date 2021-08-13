//
//  CustomerDetailView.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import SwiftUI

struct CustomerDetailView: View {
    var customerViewModel: CustomerViewModel
    
    var body: some View {
        VStack {
            
            Text(customerViewModel.customer.status.description)
                .padding()
            Text(customerViewModel.name)
            
        }.onTapGesture {
            nextTask()
        }
        .navigationTitle(customerViewModel.name)
    }
    
    private func nextTask() {
//        switch customerViewModel.customer.status {
//        case 1:
//            //customerViewModel.customer.status = 1
//            
//        default:
//            return
//        }
        
        update(customer: customerViewModel.customer)
        
    }
    
    func update(customer: Customer) {
        //customerViewModel.update(customer: customer)
    }
}
