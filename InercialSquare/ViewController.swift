//
//  ViewController.swift
//  InercialSquare
//
//  Created by Aleksandr Bolotov on 18.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var squareView = {
        let view = UIView(frame: CGRect(x: view.frame.size.width/2 - 40,
                                        y: view.frame.size.height/2 - 40,
                                        width: 80,
                                        height: 80))
        view.layer.cornerRadius = 8
        view.layer.shadowRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var animator = UIDynamicAnimator()
    private var snap: UISnapBehavior?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(squareView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnView(sender:))))
    }
    
    @objc
    private func didTapOnView(sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        
        if let snap = snap {
            animator.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: squareView, snapTo: point)
        snap?.damping = 1
        animator.addBehavior(snap!)
    }
}

