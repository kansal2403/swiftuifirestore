//
//  CustomerCell.swift
//  SWiftUIFirestore
//
//  Created by Rahish Kansal on 13/08/21.
//

import SwiftUI

struct CustomerCell: View {
    
    @ObservedObject private(set) var viewModel: CustomerViewModel
    private let memoryTest = DeallocPrinter()
    
    init(_ viewModel: CustomerViewModel) {
        self.viewModel = viewModel
        print("CustomerCell init")
    }
    
    private let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack{
            Text("\(viewModel.name) and id == \(viewModel.id)")
        }
    }
}

class DeallocPrinter {
    deinit {
        print("deallocated")
    }
}

//struct CustomerCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomerCell()
//    }
//}
