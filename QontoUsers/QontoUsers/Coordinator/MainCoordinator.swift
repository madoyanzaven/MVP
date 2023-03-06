//
//  MainCoordinator.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewControllerProvider.Main.list
        vc.presenter?.coordinator = self
        vc.presenter?.setViewInputDelegate(with: vc)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        
        navigationController.present(alert, animated: true)
    }
}
