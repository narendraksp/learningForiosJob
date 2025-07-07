//
//  Combane.swift
//  NetworkCall
//
//  Created by narendra kumar s on 06/07/25.
//
///Publisher Types
/**
Just    Emit one value then finish
PassthroughSubject    Emits values manually (imperative)
CurrentValueSubject    Holds latest value (like BehaviorRelay)
Future    Async work that returns once
Deferred    Defers creation of publisher until subscribed
 */


///Subscribers
/**
.sink    Most common. Get values/errors
.assign    Bind to property with KeyPath
.subscribe()    Attach a custom Subscriber
*/


/**
 
 Transform    map, flatMap, compactMap
 Combine streams    merge, zip, combineLatest
 Filtering    filter, removeDuplicates, debounce, throttle
 Error Handling    catch, retry, tryMap
 Side Effects    handleEvents, print
 */

///Error Handling
/**
 .catch { ... }    You want to recover and continue
 .replaceError(with:)    You want to ignore the error and fallback
 .tryMap, .tryCatch    You’re throwing from your logic
 */



///retry
//
//publisher
.retry(3)


// retryWithDelay(publisher, retries: retries - 1, delay: delay)
//


/// PassthroughSubject
//
// A manual publisher: you control when it sends values.
//
//It doesn’t store any previous value (unlike CurrentValueSubject).
//
//Perfect for events, network responses, or manual triggers.


class UserDealsViewModel {
    var userDealsSubject = PassthroughSubject<[UserDeals], Never>()
    private var cancellables = Set<AnyCancellable>()
    private let networkManager = NetworkManager()
}

func fetchUserDeals() {
    guard let publisher = networkManager.combineUsingNetworkCall(
        url: "https://mockapi.io/user_detail"
    ) else {
        userDealsSubject.send([]) // fallback in case of bad URL
        return
    }
    
    publisher
        .catch { error -> Just<[UserDeals]> in
            print("❌ Network error: \(error)")
            return Just([])
        }
        .sink(receiveValue: { [weak self] deals in
            self?.userDealsSubject.send(deals) // 👈 emit manually
        })
        .store(in: &cancellables)
}


viewModel.userDealsSubject
    .sink { deals in
        print("✅ Got updated deals: \(deals)")
            // update your view, table, etc.
    }
    .store(in: &cancellables)

///CurrentValueSubject


///  feture
//Wrapping traditional completion handlers
//
//Bridging legacy async APIs into Combine
//
//Async work you want to integrate into a Combine chain


func fetchUserDealsFuture() -> Future<[UserDeals], Error> {
    return Future { promise in
        guard let url = URL(string: "https://mockapi.io/user_detail") else {
            promise(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                promise(.failure(error))
                return
            }
            
            guard let data = data else {
                promise(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let deals = try JSONDecoder().decode([UserDeals].self, from: data)
                promise(.success(deals))
            } catch {
                promise(.failure(error))
            }
        }.resume()
    }
}
fetchUserDealsFuture()
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: { completion in
        switch completion {
            case .finished:
                print("✅ Fetched successfully")
            case .failure(let error):
                print("❌ Failed with error: \(error)")
        }
    }, receiveValue: { userDeals in
        print("📦 Got deals: \(userDeals)")
    })
.store(in: &cancellables)



