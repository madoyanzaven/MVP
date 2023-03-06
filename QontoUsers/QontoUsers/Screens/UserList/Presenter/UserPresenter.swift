//
//  UserPresenter.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 08.11.22.
//

import Foundation
import RxSwift

struct UserListInputs {
    let userListService: UserListServicing
    let cachingService: Caching
}

final class UserPresenter {
    weak var coordinator: MainCoordinator?
    private weak var delegate: ViewInputDelegate?
    
    private let inputs: UserListInputs
    private let disposeBag = DisposeBag()
    private var isLoading = false
    private var currentPage = 1
    
    init(input: UserListInputs) {
        self.inputs = input
    }
    
    func setViewInputDelegate(with delegate: ViewInputDelegate) {
        self.delegate = delegate
    }
    
    private func loadUsersFromServer(with page: Int) {
        isLoading = true
        let parameter = UserListParameter(page: page)
        
        inputs.userListService.fetch(routing: parameter).observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] result in
                self?.isLoading = false
                self?.delegate?.displayUsers(users: result.users)
                self?.saveData(with: result.users)
                self?.currentPage += 1
            },
            onFailure: { [weak self] error in
                self?.isLoading = false
                self?.coordinator?.showAlert(with: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    private func loadUsersFromCache() {
        isLoading = true
        inputs.cachingService.fetchUsers().observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] users in
                self?.isLoading = false
                self?.delegate?.displayUsers(users: users)
            },
            onFailure: { [weak self] error in
                self?.isLoading = false
                self?.coordinator?.showAlert(with: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    private func saveData(with users: [User]) {
        inputs.cachingService.saveUsers(users: users)
    }
}

extension UserPresenter: ViewOutputDelegate {
    func getData() {
        if isNetworkAvailable() {
            if !isLoading {
                loadUsersFromServer(with: currentPage)
            }
        } else {
            if Environment.isMock {
                loadUsersFromServer(with: currentPage)
            } else {
                loadUsersFromCache()
            }
        }
    }
}

// MARK: UserPresenterBusinessRules
extension UserPresenter: UserPresenterBusinessRules {}
