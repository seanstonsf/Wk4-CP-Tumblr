//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Sean Smith on 10/8/15.
//  Copyright © 2015 Sean Smith. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
