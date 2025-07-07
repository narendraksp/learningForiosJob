//
//  ContentView.swift
//  NetworkCall
//
//  Created by narendra kumar s on 04/07/25.
//

import SwiftUI
var viewmodel = ContentViewModel()
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            GRPCContactView()
        }
        .padding()
        .onAppear() {
            viewmodel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
