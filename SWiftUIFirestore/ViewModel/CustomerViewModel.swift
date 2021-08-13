//
//  CustomerViewModel.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import Foundation
import SwiftUI
import Combine

class CustomerViewModel: ObservableObject, Identifiable {
    
    @Published private(set) var customer: Customer
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var id = ""
    @Published var name: String
    
    init(customer: Customer) {
        
        print("CustomerViewModel init == \(customer.name)")
        self.customer = customer
        self.name = customer.name
        self.id = customer.id ?? "123"
        
        $customer
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $customer.compactMap { customer in
            return customer.name
        }
        .assign(to: \.name, on: self)
        .store(in: &cancellables)
    }
    
    deinit {
        print("CustomerViewModel deinit called")
    }
}
