//
//  FoourthViewController.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 19.11.2022.
//

import UIKit

class FourthViewController: UIViewController {
    
    private let padding: CGFloat = 20.0
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather For Today"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Today will be hot and sunny. If you are going out you will need a hat and sunglasses. There is a small chance of heavy thunderstorm in the afternoon that could cause severe floodng so you mmay also want to take a boat"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView = createImageView(name: "pngegg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.9, alpha: 1.0)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(imageView)
        
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1.0),
            imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1.0),
            textLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
}
