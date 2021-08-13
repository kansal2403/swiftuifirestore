//
//  CustomerRepository.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import Foundation
import Combine
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class CustomerRepository: ObservableObject {
    
    private let path: String = "customers"
    private let store = Firestore.firestore()
    @Published private(set) var customers: [Customer] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting customers \(error.localizedDescription)")
                    return
                }
                
                self.customers = querySnapshot?.documents.compactMap({ snapShot in
                    try? snapShot.data(as: Customer.self)
                }) ?? []
            }
    }
    
    func update(_ customer: Customer) {
        guard let customerID = customer.id else { return }
        
        do {
            try store.collection(path).document(customerID).setData(from: customer)
        } catch {
            fatalError("Unable to update record: \(error.localizedDescription)")
        }
    }
    
    func createCustomer(_ customerName: String, completion: @escaping ()-> Void) {
        let customer = Customer.init(id: nil, name: customerName, status: 0)
        do {
            try store.collection(path).document().setData(from: customer, completion: { _ in
                completion()
            })
            
        } catch {
            fatalError("Unable to update record: \(error.localizedDescription)")
        }
    }
}
