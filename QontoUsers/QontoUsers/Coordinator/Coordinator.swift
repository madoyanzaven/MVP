//
//  Coordinator
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
