//
//  CommitTableViewCell.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import UIKit

class CommitTableViewCell: UITableViewCell, ConfigurableCell {
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.textColor = .darkText
        return label
    }()

    private let hashLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .darkGray
        return label
    }()

    private let commitMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.layer.masksToBounds = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(userImageView)
        addSubview(authorLabel)
        addSubview(hashLabel)
        addSubview(commitMessageLabel)


        let userImageViewConstraints = [
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            userImageView.heightAnchor.constraint(equalToConstant: 50)
        ]

        NSLayoutConstraint.activate(userImageViewConstraints)

        let authorLabelConstraints = [
            authorLabel.topAnchor.constraint(equalTo: userImageView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(authorLabelConstraints)


        let hashLabelConstraints = [
            hashLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            hashLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            hashLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor)
        ]

        NSLayoutConstraint.activate(hashLabelConstraints)

        let commitMessageConstraints = [
            commitMessageLabel.topAnchor.constraint(equalTo: hashLabel.bottomAnchor, constant: 16),
            commitMessageLabel.leadingAnchor.constraint(equalTo: hashLabel.leadingAnchor),
            commitMessageLabel.trailingAnchor.constraint(equalTo: hashLabel.trailingAnchor),
            commitMessageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(commitMessageConstraints)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: Commit) {
        let request = Request()
        request.download(from: item.author.avatarUrl) { result in
            switch result {
            case .success(let data):
                self.userImageView.image = UIImage(data: data)
                break
            case .failure(let error):
                print(error)
            }
        }

        authorLabel.text = item.author.login
        hashLabel.text = item.sha
        commitMessageLabel.text = item.commit.message
    }
}
