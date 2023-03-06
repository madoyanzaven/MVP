//
//  UserItemTableViewCell.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import UIKit
import RxSwift

protocol Setupable {
    associatedtype SetupModel
    
    func setup(with model: SetupModel)
}

final class UserItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var fullnameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}

extension UserItemTableViewCell: Setupable {
    typealias SetupModel = User
    
    func setup(with model: SetupModel) {
        fullnameLabel.text = model.fullName
        emailLabel.text = model.emailAddress
    }
}
