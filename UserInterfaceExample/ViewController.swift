//
//  ViewController.swift
//  UserInterfaceExample
//
//  Created by Ghaida Atoum on 9/14/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    lazy var imageModel:ImageModel = { return ImageModel.sharedInstance() }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(displayImageName))
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var displayImageName = "cat_1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1 //10% of the original size
            self.scrollView.delegate = self //we will be acting as a scroll view delegate
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
 
}

