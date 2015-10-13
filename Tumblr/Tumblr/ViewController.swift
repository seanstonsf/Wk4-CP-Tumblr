//
//  ViewController.swift
//  Tumblr
//
//  Created by Sean Smith on 10/6/15.
//  Copyright © 2015 Sean Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var contentView: UIView!

    var homeViewController: UIViewController!
    var searchViewcontroller: UIViewController!
    var composeViewController: UIViewController!
    var profileViewController: UIViewController!
    var activityViewController: UIViewController!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var popupImageView: UIImageView!
    
    var popupImageInitialCenter: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        scrollView.contentSize = imageView.image!.size

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewcontroller = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        profileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        activityViewController = storyboard.instantiateViewControllerWithIdentifier("ActivityViewController")

        popupImageInitialCenter = popupImageView.frame.origin
        popupImageView.alpha = 0
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func buttonStates(selectedButton: UIButton!){
        homeButton.selected = false
        searchButton.selected = false
        profileButton.selected = false
        activityButton.selected = false
        
        selectedButton.selected = true
        UIView.animateWithDuration(0.5, delay: 1.5, options: [.Repeat, .Autoreverse], animations: { () -> Void in
            self.popupImageView.frame.origin.y = self.popupImageInitialCenter.y - 5
            }, completion: nil)

        UIView.animateWithDuration(0.3, delay: 1.0, options: [], animations: { () -> Void in
            self.popupImageView.alpha = 1
            }, completion: nil)

    }
    @IBAction func onHomeButton(sender: AnyObject) {
        homeViewController.view.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
        buttonStates(homeButton)
    }
    @IBAction func onSearchButton(sender: AnyObject) {
        searchViewcontroller.view.frame = contentView.frame
        contentView.addSubview(searchViewcontroller.view)
        buttonStates(searchButton)
        UIView.animateWithDuration(0.2, delay: 0.2, options: [], animations: { () -> Void in
            self.popupImageView.alpha = 0
            }, completion: nil)    }
    @IBAction func onProfileButton(sender: AnyObject) {
        profileViewController.view.frame = contentView.frame
        contentView.addSubview(profileViewController.view)
        buttonStates(profileButton)
    }
    @IBAction func onActivityButton(sender: AnyObject) {
        activityViewController.view.frame = contentView.frame
        contentView.addSubview(activityViewController.view)
        buttonStates(activityButton)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
}

