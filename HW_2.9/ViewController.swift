//
//  ViewController.swift
//  HW_2.9
//
//  Created by Maxim Mitin on 3.08.21.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var viewToAnimate: SpringView!
    @IBOutlet weak var animationNameLbl: UILabel!
    @IBOutlet weak var animationButtonLbl: SpringButton!
    
    
    var currentAnimationIndex = -1
    var currentBtnName = 0
    
    let enu = Spring.AnimationPreset.self
    let animations: [Spring.AnimationPreset] = [
        .shake,
        .pop,
        .morph,
        .squeeze,
        .wobble,
        .swing,
        .flipX,
        .flipY,
        .fall,
        .squeezeLeft,
        .squeezeRight,
        .squeezeDown,
        .squeezeUp,
        .slideLeft,
        .slideRight,
        .slideDown,
        .slideUp,
        .fadeIn,
        .fadeOut,
        .fadeInLeft,
        .fadeInRight,
        .fadeInDown,
        .fadeInUp,
        .zoomIn,
        .zoomOut,
        .flash
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startValues()
    }
    
    private func nextAnim() {
        currentAnimationIndex += 1
        currentBtnName += 1
        if currentAnimationIndex >= animations.count || currentBtnName >= animations.count {
            currentAnimationIndex = 0
            currentBtnName = 1
        } else {
        viewToAnimate.animation = "\(animations[currentAnimationIndex])"
        animationNameLbl.text = "\(animations[currentAnimationIndex])"
        viewToAnimate.force = 2
        viewToAnimate.duration = 4
        viewToAnimate.delay = 0.2
        viewToAnimate.animate()
        print(animations.count)
        print(currentAnimationIndex)
            print(currentBtnName)
        
        animationButtonLbl.setTitle("\(animations[currentBtnName])", for: .normal)
        }
    }
    
    private func startValues() {
        guard let lblName = animations.first else {return}
        guard let btnName = animations.first else {return}
        
        animationNameLbl.text = "\(lblName)"
        animationButtonLbl.setTitle("\(btnName)", for: .normal)
    }
    
    @IBAction func animateBtnClicked(_ sender: SpringButton) {
        nextAnim()
 }
}
