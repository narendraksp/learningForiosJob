//
//  networkManger.swift
//  GrpcCheck
//
//  Created by narendra kumar s on 26/06/25.
//
import GRPC
import NIO
import SwiftProtobuf

class GRPCBGreeterClient {
    private let client: Helloworld_GreeterAsyncClient
    private let channel: GRPCChannel
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    
    init() {
        self.channel = try! GRPCChannelPool.with(
            target: .host("grpcb.in", port: 9000),
            transportSecurity: .plaintext,  // grpcb.in is not TLS
            eventLoopGroup: group
        )
        
        self.client = Helloworld_GreeterAsyncClient(channel: channel)
    }
    
    func sayHello(name: String) async throws -> String {
        var request = Helloworld_HelloRequest()
        request.name = name
        
        let response = try await client.sayHello(request)
        return response.message
    }
    
    deinit {
        try? channel.close().wait()
        try? group.syncShutdownGracefully()
    }
}
