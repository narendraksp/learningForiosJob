//
//  cordinatorPatern.swift
//  cordinatorPatern
//
//  Created by narendra kumar s on 30/06/25.
//
import UIKit
//protocol Coordinator: AnyObject {
//    var navigationController: UINavigationController { get set }
//    func start() // Initiates the coordinator's flow
//}
//class AppCoordinator: Coordinator {
//    var navigationController: UINavigationController
//    var childCoordinators: [Coordinator] = []
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    func start() {
//            // Decide the initial view controller to present
////        let homeVC = HomeViewController()
////        homeVC.coordinator = self // Weak reference to the coordinator
////        navigationController.pushViewController(homeVC, animated: false)
//    }
//    
//        // Example method for navigating to a detail screen
//    func showDetail(for item: Item) {
//        let detailVC = DetailViewController(item: item)
//        detailVC.coordinator = self
//        navigationController.pushViewController(detailVC, animated: true)
//    }
//}
