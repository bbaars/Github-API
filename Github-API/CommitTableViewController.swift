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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let service = GithubService()
        service.getCommits { (result) in
            switch result {
            case .success(let commits):
                self.commits = commits
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case .failure(let error):
                print(error)
                break
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

