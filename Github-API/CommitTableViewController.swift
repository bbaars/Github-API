//
//  ViewController.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import UIKit

class CommitTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Vapor Commits"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let service = GithubService()
        service.getCommits { (result) in
            switch result {
            case .success(let commits):
                print(commits)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

