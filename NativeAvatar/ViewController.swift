//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Margarita Slesareva on 22.02.2024.
//

import UIKit

private enum Metrics {
    static let imageViewColor: UIColor = .systemGray5
    static let iconHeight: CGFloat = 36
    static let spacing: CGFloat = 10
    
    static let contentHeight: CGFloat = 1000
}


final class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupImage()
    }
    
    private func configureViews() {
        view.addSubview(scrollView)

        navigationItem.title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = .systemBackground
        scrollView.contentSize.height = Metrics.contentHeight
        scrollView.frame = view.bounds
    }
    
    private func setupImage() {
        let image = UIImage(systemName: "person.crop.circle.fill")

        let imageView = UIImageView(image: image)
        imageView.tintColor = Metrics.imageViewColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        if let largeTitleView = getLargeTitleView() {
            largeTitleView.addSubview(imageView)

            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: Metrics.iconHeight),
                imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
                imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -Metrics.spacing),
                imageView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -Metrics.spacing)
            ])
        }
    }
    
    private func getLargeTitleView() -> UIView? {
        guard let subviews = navigationController?.navigationBar.subviews else {
            return nil
        }
        
        for subview in subviews {
            if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {
                return subview
            }
        }
        
        return nil
    }
}
