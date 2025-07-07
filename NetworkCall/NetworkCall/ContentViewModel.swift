//
//  ContentViewModel.swift
//  NetworkCall
//
//  Created by narendra kumar s on 05/07/25.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var userDealsObj: [UserDeals] = []
    var networkMager = NetworkManger()
    var cancellables = Set<AnyCancellable>()
    
        //When you subscribe to a publisher in Combine (e.g., to receive notifications, network responses, or timer events), that subscription is an active object that needs to be stored somewhere. If you don't hold onto it, the subscription is immediately cancelled, and you won't receive any values.
    init() {
        
    }
    
    func fetchData() {
        
        if let publisher = networkMager.cobinerUsingNetworkCall(url: "https://685b97f389952852c2da1858.mockapi.io/user_detail") {
            publisher
                .catch({ error -> Just<[UserDeals]> in
                    print("network error : \(error.localizedDescription)" )
                    return Just([])
                })
                .sink(
                    receiveCompletion: { completion in
                    switch completion {
                        case .finished:
                            print("Request completed")
                        case .failure(let error):
                            print("Error: \(error)")
                    }
                },
                receiveValue: {[weak self] userDeals in
                    self?.userDealsObj = userDeals
                    print("Received deals: \(userDeals)")
                }
                )
            
//            Once you call .sink(...) or .assign(...), you're no longer working with a publisher — you're just holding a Cancellable.
            
                .store(in: &cancellables)
            
                //In Swift's Combine framework, the .store(in:) method is crucial for managing the lifecycle of your subscriptions to publishers. In essence, it keeps your subscriptions alive by storing them in a collection, preventing them from being immediately cancelled.
        }
    }
    
    
    
    
    func fetchDetailUsingAssignSubscriber() {
        if let publisher = networkMager.cobinerUsingNetworkCall(url: "https://685b97f389952852c2da1858.mockapi.io/user_detail") {
            publisher
                .catch({ error -> Just<[UserDeals]> in
                    print("network error:\(error.localizedDescription)")
                    return Just([])
                    
                    //Just is a Combine publisher that emits exactly one value, then immediately finishes. It’s perfect for mocking data, fallbacks, or replacing errors.
                })
                // Optional: fallback for failed request
                .assign(to: \.userDealsObj, on: self) // ✅ KEY PATH FIX
                .store(in: &cancellables)
        }
    }
    
    
/// assign
//The assign(to:on:) operator in Swift's Combine framework provides a simple, declarative way to bind the output of a publisher directly to a property on an object.
//
//It acts as a subscriber that takes values from a publisher and assigns them to a specified KeyPath on a particular object. This is especially useful for updating your UI or model state in response to data streams.
    


//    The assign(to:on:) operator takes two parameters:
//    
//    to:: A KeyPath that specifies which property of the object you want to update.
//    
//    on:: The object that owns the property.
//    
//    When the publisher emits a new value, assign(to:on:) automatically updates the property on the given object. This operator is a "fire-and-forget" subscriber, meaning it doesn't provide closures to handle completion or failure events directly. It's designed for cases where you only care about successfully published values.
    
    
    

}
    
//    let publisher1 = URLSession.shared.dataTaskPublisher(for: url1)
//    let publisher2 = URLSession.shared.dataTaskPublisher(for: url2)
//    
//    Publishers.Zip(publisher1, publisher2)
//        .receive(on: DispatchQueue.main)
//        .sink { ... }
//        .store(in: &cancellables)

