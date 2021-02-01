//
//  ViewController.swift
//  ChainAnimationsPractice
//
//  Created by Viktor Varsano on 8.12.20.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func setupLabels() {
        //setup UI
        titleLabel .numberOfLines = 0
        titleLabel.text = "Leave us a message \n"
        titleLabel.font = UIFont(name: "Futura", size: 58)
        
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hello and thank you so much for downloading our brand new app! We hope you enjoy it and give us a nice review on the AppStore! Don't forget to give us feedback on what you would like to see in the future! \n\n\n Contact:\n viktor_varsano@hotmail.com"
        bodyLabel.font = UIFont(name: "Futura", size: 22)
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        //enable autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100 ).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupStackView()
            
        //fun animation
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }

    @objc fileprivate func handleTapAnimations() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5 , initialSpringVelocity: 0.5, options: .curveEaseOut) {
             
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                
        } completion: { (_) in
            
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations:  {
                
            self.titleLabel.alpha = 0
            self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -400)
                
            })
        }

        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5 , initialSpringVelocity: 0.5, options: .curveEaseOut) {
             
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                
        } completion: { (_) in
            
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations:  {
              
            self.bodyLabel.alpha = 0
            self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -400)
                
            })
        }
        
        
        
    }
    
}

