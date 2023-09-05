//
//  CustomerListViewModel.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import Foundation
import SwiftUI
import Combine

class CustomerListViewModel: ObservableObject {
    
    @Published var showAddTeamView = false
    @Published var customersModels: [Customer] = []
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var customerRepository = CustomerRepository()
    
    init() {
        customerRepository.$customers
            .map { customers in
                customers
            }
            .assign(to: \.customersModels, on: self)
            .store(in: &cancellables)
    }
    
    func onTapAddTeam() {
        showAddTeamView.toggle()
    }
    
    func onTapCancelAddTeam() {
        showAddTeamView.toggle()
    }
    
    func createCustomer(name: String, age: Int) {
        showAddTeamView.toggle()
        
        customerRepository.createCustomer(
            name: name,
            age: age,
            completion: { [unowned self] in
                showAddTeamView.toggle()
            }
        )
    }
}
