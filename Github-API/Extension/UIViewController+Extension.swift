//
//  UIViewController+Extension.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import UIKit

extension UIViewController {

    /// Show the progress view
    /// - Parameters:
    ///   - title: The title to display while the progress view is on the screen
    ///   - completion: The completion to fire when the progress view has presented itself
    func showProgressView(withLoadingTitle title: String = "Please wait...", completion: (() -> Void)? = nil) {
        // Make sure the presented view controller is nil, otherwise still call our completion handler and return
        guard self.presentedViewController == nil else {
            completion?()
            return
        }

        let loading = UIAlertController(title: nil, message: title, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        loading.view.addSubview(loadingIndicator)
        DispatchQueue.main.async {
            self.present(loading, animated: false, completion: completion)
        }
    }

    /// Hides the progress vie
    /// - Parameter completion: When the progress view has dismissed
    func hideProgressView(_ completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if let progressView = self.presentedViewController as? UIAlertController {
                progressView.dismiss(animated: true, completion: completion)
            } else {
                completion?()
            }
        }
    }

    /// Shows an error alert view with a default title of "Whoops", and message.
    ///
    /// - Parameters:
    ///   - title: The title of the alert controller
    ///   - message: The message displayed on the alert controller
    func showErrorAlertView(withTitle title: String = "Whoops", withMessage message: String, okayCompletion: (() -> ())? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        let cancel = UIAlertAction(title: "Okay", style: .destructive) { (action) in
            alert.dismiss(animated: true, completion: okayCompletion)
        }

        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }}


