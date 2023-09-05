//
//  CustomerListView.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import SwiftUI

struct CustomerListView: View {
    
    @StateObject var viewModel: CustomerListViewModel
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                VStack {
                    List(viewModel.customersModels, id: \.id) { cellInfo in
                        CustomerCell(customer: cellInfo)
                    }
                }
                .navigationTitle("Customers List")
                .toolbar {
                    Button("Add") {
                        viewModel.onTapAddTeam()
                    }
                }
            }
            
            if viewModel.showAddTeamView {
                AddCustomerView(isPresented: $viewModel.showAddTeamView,
                                onTapAdd: viewModel.createCustomer)
                .transition(.move(edge: .top))
                .ignoresSafeArea()                
            }
        }
    }
}

struct CustomerListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerListView(viewModel: CustomerListViewModel())
    }
}
