//
//  GRPCNetworkManger.swift
//  NetworkCall
//
//  Created by narendra kumar s on 07/07/25.
//

import GRPC
import NIO
import SwiftProtobuf

//class GRPCClient {
//    private var group: EventLoopGroup!
//    private var channel: GRPCChannel!
//    private var client: Helloworld_GreeterAsyncClient!
//    
//    init() {
//        group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
//        channel = ClientConnection.insecure(group: group)
//            .connect(host: "grpcb.in", port: 9000)
//        
//        client = Helloworld_GreeterAsyncClient(channel: channel)
//    }
//    
//    func sayHello(name: String) async throws {
//        var request = Helloworld_HelloRequest()
//        request.name = name
//        
//        let response = try await client.sayHello(request)
//        print("Response: \(response.message)")
//    }
//}



class GRPCBGreeterClient {
    private let client: Helloworld_GreeterAsyncClient
    private let channel: GRPCChannel
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
//    It creates an event loop group with 1 thread.
//    
//    An EventLoopGroup is essentially a pool of threads that handle asynchronous events like networking or I/O.
//    
//    MultiThreadedEventLoopGroup is a common implementation used when multiple threads might be needed — but here, only 1 thread is requested.
    
    
//    Used when setting up gRPC clients or servers.
//    
//    Controls concurrency for network operations.
//        
//        Ensures non-blocking event processing.
    
    
    
    init() {
        self.channel = try! GRPCChannelPool.with(
            target: .host("grpcb.in", port: 9001),
            transportSecurity: .plaintext,  // grpcb.in is not TLS
            eventLoopGroup: group
        )
//        Creates a pooled gRPC client channel.
//        Connects to grpcb.in:9001, which is a public test gRPC server.
//        Uses plaintext (no TLS) – which is okay for local testing or servers without SSL.
//Uses the group you defined earlier (MultiThreadedEventLoopGroup).
        
        
        self.client = Helloworld_GreeterAsyncClient(channel: channel)
    }
    
    func sayHello(name: String) async throws -> String {
        var request = Helloworld_HelloRequest()
        request.name = name
        do {
            let response = try await client.sayHello(request)
            print(response.debugDescription)
            print(response.message)
            return response.message
        }
        catch {
      
            print("❌ gRPC Error: \(error)")
            return"❌ gRPC Error: \(error)"
        }
    }
    
    deinit {
        try? channel.close().wait()
        try? group.syncShutdownGracefully()
    }
}
