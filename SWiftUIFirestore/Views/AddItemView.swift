//
//  AddItemView.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import SwiftUI

struct AddItemView: View {
    
    @ObservedObject var viewModel: CustomerListViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Enter Customer name", text: $viewModel.customerNam)
                    .font(.title2)
                    .foregroundColor(.secondary)
                    .frame(width: UIScreen.main.bounds.width - 40)
            }
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 1)
            )
            
            Button(action: {
                viewModel.createCustomer()
            }, label: {
                
                Text("Add")
                    .fontWeight(.bold)
                    .foregroundColor(Color.secondary)
                    .padding(.vertical)
                    .frame(width: 200)
                    .font(.system(size: 22, weight: .medium))
            })
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 1))
        }
        .onAppear {
                        print("ContentView appeared!")
                    }
                    .onDisappear {
                        print("ContentView disappeared!")
                    }
        .navigationTitle("Name Your Team!")
    }
}
