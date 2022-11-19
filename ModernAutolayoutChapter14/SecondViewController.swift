//
//  SecondViewController.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 18.11.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let containerView: ContainerView = {
       let view = ContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40) //работает на containerView по отношению к внешнему вью (scrollView)
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.89, blue: 0.89, alpha: 1.0)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(scrollView)
                
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
    }
}
