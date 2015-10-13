//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sean Smith on 10/8/15.
//  Copyright © 2015 Sean Smith. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var iconQuote: UIImageView!
    @IBOutlet weak var iconVideo: UIImageView!
    @IBOutlet weak var iconPhoto: UIImageView!
    @IBOutlet weak var iconChat: UIImageView!
    @IBOutlet weak var iconText: UIImageView!
    @IBOutlet weak var iconLink: UIImageView!
    
    var iconQuoteInitialCenter: CGPoint!
    
    var iconRowOnePosition: CGFloat!
    var iconRowOneFinalPosition: CGFloat!
    var iconRowTwoPosition: CGFloat!
    var iconRowTwoFinalPosition: CGFloat!
    
    var iconColumnOnePosition: CGFloat!
    var iconColumnTwoPosition: CGFloat!
    var iconColumnThreePosition: CGFloat!
    
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        iconQuoteInitialCenter = iconQuote.frame.origin
        
        iconRowOnePosition = 112
        iconRowOneFinalPosition = -100
        iconRowTwoPosition = 240
        iconRowTwoFinalPosition = -100
        iconColumnOnePosition = 20
        iconColumnTwoPosition = 123
        iconColumnThreePosition = 225
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
        print("required")
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        print("isPresenting")
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        print("notPresenting")
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        print("timing")
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView!.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    @IBAction func onNevermindPress(sender: AnyObject) {
        modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.iconQuote.frame.origin = CGPoint(x: self.iconColumnThreePosition, y: self.iconRowOneFinalPosition)
            self.iconLink.frame.origin = CGPoint(x: self.iconColumnOnePosition, y: self.iconRowTwoFinalPosition)
            self.iconQuote.alpha = 0
            self.iconLink.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.iconText.frame.origin = CGPoint(x: self.iconColumnOnePosition, y: self.iconRowOneFinalPosition)
            self.iconChat.frame.origin = CGPoint(x: self.iconColumnTwoPosition, y: self.iconRowTwoFinalPosition)
            self.iconText.alpha = 0
            self.iconChat.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.iconVideo.frame.origin = CGPoint(x: self.iconColumnThreePosition, y: self.iconRowTwoFinalPosition)
            self.iconPhoto.frame.origin = CGPoint(x: self.iconColumnTwoPosition, y: self.iconRowOneFinalPosition)
            self.iconVideo.alpha = 0
            self.iconPhoto.alpha = 0
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.4, delay: 1.5, options: [], animations: { () -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
            }, completion: nil)
        print("dismiss")
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.iconQuote.frame.origin = CGPoint(x: self.iconColumnThreePosition, y: self.iconRowOnePosition)
            self.iconLink.frame.origin = CGPoint(x: self.iconColumnOnePosition, y: self.iconRowTwoPosition)
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.iconPhoto.frame.origin = CGPoint(x: self.iconColumnTwoPosition, y: self.iconRowOnePosition)
            self.iconVideo.frame.origin = CGPoint(x: self.iconColumnThreePosition, y: self.iconRowTwoPosition)
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.3, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.iconChat.frame.origin = CGPoint(x: self.iconColumnTwoPosition, y: self.iconRowTwoPosition)
            self.iconText.frame.origin = CGPoint(x: self.iconColumnOnePosition, y: self.iconRowOnePosition)

            }, completion: nil)
        
    }
    
    
    
}
