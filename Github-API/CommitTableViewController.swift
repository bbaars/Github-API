//
//  ViewController.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import UIKit

class CommitTableViewController: UITableViewController {

    private var commits: [Commit] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Vapor Commits"

        tableView.register(CommitTableViewCell.self,
                           forCellReuseIdentifier: CommitTableViewCell.reuseIdentifier)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let service = GithubService()

        showProgressView {
            service.getCommits { (result) in
                self.hideProgressView {
                    switch result {
                    case .success(let commits):
                        self.commits = commits
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        break
                    case .failure(let error):
                        self.showErrorAlertView(withMessage: error.localizedDescription)
                        break
                    }
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CommitTableViewCell.reuseIdentifier) as? CommitTableViewCell {
            cell.configure(with: commits[indexPath.row])

            return cell
        }

        return super.tableView(tableView, cellForRowAt: indexPath)
    }
}

