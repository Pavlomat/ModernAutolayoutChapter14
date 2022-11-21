//
//  ContainerView4.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 19.11.2022.
//

import UIKit

class ContainerView4: UIView {
    
    private enum ViewMetrics {
        static let margin: CGFloat = 20.0
        static let narrowLayoutLimit: CGFloat = 500.0
    }
    
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
        label.text = "Today will be hot and sunny. If you are going out you will need a hat and sunglasses. There is a small chance of heavy thunderstorm in the afternoon that could cause severe floodng so you may also want to take a boat"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "pngegg")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureView(for: traitCollection)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        configureView(for: traitCollection)
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate(commonConstraints)
    }
    
    private lazy var commonConstraints: [NSLayoutConstraint] = {    //сюда пишутся констранты, которые не изменяются при смене размеров экрана, сразу активируем их
        
        return [
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            textLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor)   //readableContentGuide чобы на ipad не во всю строку была надпись
        ]
    }()
    
    private lazy var wideConstraints: [NSLayoutConstraint] = {  //констранты для большой ширины
        return [
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1.0),
            
            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1.0),
            textLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1.0)
        ]
    }()
    
    private lazy var narrowConstraints: [NSLayoutConstraint] = {    //констрейнты для мелкой ширины
        return [
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1.0),
            imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1.0),
            textLabel.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor) //readableContentGuide чобы на ipad не во всю строку была надпись
        ]
    }()
    
    private func configureView(for traitCollection: UITraitCollection) {
        if traitCollection.verticalSizeClass == .compact {
            NSLayoutConstraint.deactivate(narrowConstraints)
            NSLayoutConstraint.activate(wideConstraints)
        } else {
            NSLayoutConstraint.deactivate(wideConstraints)
            NSLayoutConstraint.activate(narrowConstraints)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.verticalSizeClass != traitCollection.verticalSizeClass {
            configureView(for: traitCollection)
        }
    }
}
