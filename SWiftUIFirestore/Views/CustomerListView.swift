//
//  CustomerListView.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import SwiftUI

struct CustomerListView: View {
    
    @ObservedObject var customerListViewModel = CustomerListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddItemView(viewModel: customerListViewModel), isActive: $customerListViewModel.moveToAddTeam, label: {
                    EmptyView()
                })
                
                HStack {
                    Text("Add Customer +")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(Color.secondary)
                        .padding(.vertical)
                }
                .onTapGesture {
                    customerListViewModel.addTeamTapped()
                    print("addTeamTapped()")
                }
                .frame(width: 150, height: 54)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary, lineWidth: 1)
                )
                
                List(customerListViewModel.customerViewModels, id: \.id) { cellInfo in
                    CustomerCell(cellInfo)
                }
                
                Spacer()
            }
        }
    }
}
