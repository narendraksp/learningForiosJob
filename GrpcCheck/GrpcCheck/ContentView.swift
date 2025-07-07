//
//  ContentView.swift
//  GrpcCheck
//
//  Created by narendra kumar s on 26/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text(message)
            Button("Call gRPC") {
                Task {
                    let greeter = GRPCBGreeterClient()
                    do {
                        let response = try await greeter.sayHello(name: "Narendra")
                        message = response
                    } catch {
                        message = "Error: \(error.localizedDescription)"
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
