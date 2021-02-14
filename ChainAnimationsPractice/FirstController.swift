//
//  FirstController.swift
//  ChainAnimationsPractice
//
//  Created by Viktor Varsano on 14.02.21.
//

import UIKit
import Lottie

class FirstController: UIViewController {
    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lottieAnimation()
//        perform(#selector(lottieAnimation()), with: nil, afterDelay: 0.01)

}
    @objc fileprivate func lottieAnimation() {
        let animationview = AnimationView(name: "hello-bee")
        animationview.frame = CGRect(x: 0, y: 0, width: 400, height: 700)
        animationview.center = self.view.center
        animationview.contentMode = .scaleAspectFit
        view.addSubview(animationview)
        animationview.play()
        animationview.loopMode = .loop

    }
    
}

