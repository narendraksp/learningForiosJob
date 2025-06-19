//
//  ContentView.swift
//  DSA
//
//  Created by narendra kumar s on 19/02/25.
//

import SwiftUI
import UIKit
import MapKit

struct DSAContentView: View {
    var viewModel: DashboardViewModel = DashboardViewModel()
    var testRef =  TestLogic()
    var body: some View {
        VStack {
            Button("check Logic", action: {
                testRef.callMainFunc()
            })
            List(viewModel.list, id: \.id){value  in
                Button(value.name,  action:{
                    viewModel.redirect(to: value.id)
                }
                       
                       )
                
            
            }
            Button("Check Loop", action: {
                testRef.link.append(9)
                
            })
       
        }
        .padding()
    }
}

#Preview {
    DSAContentView()
}
