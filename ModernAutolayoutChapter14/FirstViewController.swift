//
//  MainViewController.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let padding: CGFloat = 20.0
    
    private enum AnimationMetrics {
        static let duration: TimeInterval = 0.3
        static let transformScale: CGFloat = 1.25
    }
    
    private let topImage = createImageView(name: "screenshot")
    private let middleImage = createImageView(name: "screenshot")
    private let bottomImage = createImageView(name: "screenshot")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topImage, middleImage, bottomImage])
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupView()
        configureView(for: traitCollection) //чтобы при включении приложения в горизонтальном виде сразу менялся stackView
    }
    
    private func setupView() {
        view.addSubview(stackView)
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
    
//    private func configureView(for traitCollection: UITraitCollection) {  //метод для конфигурации вью под разные размеры экранов
//        switch traitCollection.verticalSizeClass {  //следит за вертикальным размером (regular или compact)
//            //есть horizontalSizeClass, displayScale, displayGamut и др.
//        case .compact:
//            stackView.axis = .horizontal
//        default:
//            stackView.axis = .vertical
//        }//    }

    
    private func configureView(for traitCollection: UITraitCollection) {    //метод с switch почему то не работает
        if traitCollection.verticalSizeClass == .compact {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) { //метод постоянно следит за конфигурацией
        super.traitCollectionDidChange(previousTraitCollection) //всегда вначале
        if previousTraitCollection?.verticalSizeClass != traitCollection.verticalSizeClass {    //проверка о выполнении метода configureView только если новое состояние изменилось в отличие от старого
            configureView(for: traitCollection)
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)  //всегда вначале
        if traitCollection.verticalSizeClass != newCollection.verticalSizeClass {
            animateStack(with: coordinator)
        }
    }
    
    private func animateStack(with coordinator: UIViewControllerTransitionCoordinator) {
            coordinator.animate(alongsideTransition: { _ in
                self.stackView.transform = CGAffineTransform(scaleX: AnimationMetrics.transformScale, y: AnimationMetrics.transformScale)
            }, completion: { _ in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: AnimationMetrics.duration, delay: 0, options: [], animations: {
                    self.stackView.transform = .identity
                })
            })
        }
    
}

extension UIViewController {
    static func createImageView(name: String) -> UIImageView {
        let view = UIImageView(image: UIImage(named: name))
        view.contentMode = .scaleAspectFit
        //        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
