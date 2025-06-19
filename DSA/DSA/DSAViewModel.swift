//
//  DSAViewModel.swift
//  DSA
//
//  Created by narendra kumar s on 19/02/25.
//
import SwiftUI
import os
class DashboardViewModel :ObservableObject{
    @Published var list: [DSAModel] = []
    init() {
        list.append(DSAModel(name: "Contains Duplicate ", id: 1))
        list.append(DSAModel(name: "Contains Duplicate ", id: 2))
        list.append(DSAModel(name: "Contains Duplicate ", id: 3))
        let log = OSLog(subsystem: "com.yourcompany.yourapp", category: "network")

        os_log("This is a detailed log: %d", log: log, type: .debug, 42)
        
    }
    
    func redirect(to index: Int) {
        switch index {
            case 1:
         let contain =   ContainsDuplicate()
            contain.checkDuplicateItemUsingHashSet([1,2,4,5,6,7,8,2])
        default:
            print("")
        }
        
    }
}





struct DSAModel {
    let name: String
    let id: Int
    
    
}
