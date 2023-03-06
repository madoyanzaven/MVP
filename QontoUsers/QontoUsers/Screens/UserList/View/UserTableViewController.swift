//
//  UserTableViewController.swift
//  QontoUsers
//
//  Created by Zaven Madoyan on 07.11.22.
//

import UIKit

final class UserTableViewController: UITableViewController {
    var presenter: UserPresenter?
    private let reuseIdentifier = "UserItemTableViewCell"
    private var users: [User] = []
    private weak var viewOutputDelegate: ViewOutputDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        registerTableView()
        viewOutputDelegate = presenter
        viewOutputDelegate?.getData()
    }
    
    // MARK: UITableViewDataSource & UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)! as! UserItemTableViewCell
        if let currentUser = users[safe: indexPath.row] {
            cell.setup(with: currentUser)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard !decelerate else { return }
        
        fetchDataWhileScrollingDown(for: scrollView)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        fetchDataWhileScrollingDown(for: scrollView)
    }
    
    // MARK: Private methods
    
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        title = "UserList"
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func fetchDataWhileScrollingDown(for scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY >= contentHeight - scrollView.frame.height {
            guard !Environment.isMock else { return }
            
            presenter?.getData()
        }
    }
    
}

// MARK: ViewInputDelegate

extension UserTableViewController: ViewInputDelegate {
    func setup() {
        presenter?.setViewInputDelegate(with: self)
    }
    
    func displayUsers(users: [User]) {
        self.users.append(contentsOf: users)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        guard self.users.count > Constants.Foundation.limitPageCount else { return }
        
        UIView.animate(withDuration: 1) {
            self.tableView.contentOffset.y += 50
        }
    }
}
