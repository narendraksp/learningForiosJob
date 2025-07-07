//
//  networkManger.swift
//  NetworkCall
import Combine

//
//  Created by narendra kumar s on 04/07/25.
//
import Foundation
class NetworkManger {
    init () {
        
    }
    func cobinerUsingNetworkCall(url:String)  -> AnyPublisher<[UserDeals], Error>?  {
        guard let url =  URL(string: url) else {
            return Just([UserDeals]())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.httpBody = nil
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { element in
                print(url)
                guard  let htttpResonce = element.response as? HTTPURLResponse ,(200...299).contains(htttpResonce.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                print(htttpResonce.statusCode)

                return element.data
            }
            .decode(type: [UserDeals].self, decoder: JSONDecoder())
           
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveSubscription: { _ in print("🔄 Subscribed") },
                          receiveOutput: { _ in print("📥 Received data") },
                          receiveCompletion: { completion in print("✅ Completion: \(completion)") },
                          receiveCancel: { print("🚫 Cancelled") })
        
            .eraseToAnyPublisher()
    }
}
