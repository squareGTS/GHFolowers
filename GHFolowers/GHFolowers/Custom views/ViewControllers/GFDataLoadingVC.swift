//
//  GFDataLoadingVC.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 14.10.2022.
//

import UIKit

class GFDataLoadingVC: UIViewController {

    var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)

        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0

        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.8
        }

        let activityIndicatior = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicatior)

        activityIndicatior.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicatior.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicatior.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])

        activityIndicatior.startAnimating()
    }

    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }

    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
