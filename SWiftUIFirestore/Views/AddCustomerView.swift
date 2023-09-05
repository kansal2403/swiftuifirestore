//
//  AddItemView.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 11/08/21.
//

import SwiftUI

typealias OnTapAddCustomer = (String, Int)->Void
struct AddCustomerView: View {
    @Binding var isPresented: Bool
    var onTapAdd: OnTapAddCustomer
    @State private var customerName: String = ""
    @State private var customerAge: String = ""
    
    var body: some View {
        ZStack {
            BackdropBlurView(radius: 10.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    isPresented.toggle()
                }
            
            VStack(alignment: .center, content: {
                Spacer()
                
                VStack {
                    Image(systemName: "minus")
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    Text("Add New Customer")
                        .fontWeight(.medium)
                        .font(.title2)
                    
                    HStack {
                        TextField("Name", text: $customerName)
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    HStack {
                        TextField("Age", text: $customerAge)
                            .font(.title2)
                            .foregroundColor(.secondary)
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    Button(action: {
                        if customerName.count > 2, let age = Int(customerAge), age > 0 {
                            onTapAdd(customerName, age)
                        }
                    }, label: {
                        
                        Text("Add Customer")
                            .fontWeight(.bold)
                            .foregroundColor(Color.secondary)
                            .padding(.vertical)
                            .frame(width: 200)
                            .font(.system(size: 22, weight: .medium))
                            .cornerRadius(10, corners: .allCorners)
                    })
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.secondary, lineWidth: 1))
                    .padding(.bottom, 64)
                    .padding(.top)
                }
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.secondary, lineWidth: 1))
            })
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomerView(isPresented: .constant(true)) { _, _ in }
    }
}
