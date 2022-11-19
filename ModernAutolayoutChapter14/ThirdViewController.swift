//
//  ThirdViewController.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 19.11.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let previewBotton = customButton(title: "Preview", backgroundColor: .yellow)
    let buyBotton = customButton(title: "Buy", backgroundColor: .green)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [previewBotton, buyBotton])
        stackView.spacing = 32.0
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        setupView()
        configureView(for: traitCollection)
    }
    private func setupView() {
        view.addSubview(stackView)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
        ])
    }
    
    private func configureView(for traitCollection: UITraitCollection) {
        if traitCollection.verticalSizeClass == .compact {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.verticalSizeClass != traitCollection.verticalSizeClass {
            configureView(for: traitCollection)
        }
    }
    
}

extension UIViewController {
    static func customButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        //        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
