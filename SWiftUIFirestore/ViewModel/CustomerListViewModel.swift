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
    
    @Published var moveToAddTeam = false
    var customerNam = ""
    @Published var customerViewModels: [CustomerViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var customerRepository = CustomerRepository()
    
    init() {
        print("CustomerListViewModel init")
        customerRepository.$customers.map { customers in
            customers.map { customr in
                return CustomerViewModel.init(customer: customr)
            }
        }
        .assign(to: \.customerViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func addTeamTapped() {
        print("Add team tapped ")
        moveToAddTeam.toggle()
    }
    
    func createCustomer() {
        customerRepository.createCustomer(customerNam) { [self] in
            customerNam = ""
            moveToAddTeam.toggle()
            print("moveToAddTeam after adding Cust \(moveToAddTeam)")
        }
    }
    
    deinit {
        print("CustomerListViewModel deinit")
    }
}
