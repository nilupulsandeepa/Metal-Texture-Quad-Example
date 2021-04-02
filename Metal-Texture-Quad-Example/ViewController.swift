//
//  ViewController.swift
//  Metal-Texture-Quad-Example
//
//  Created by Nilupul Sandeepa on 2021-04-01.
//

import UIKit

class ViewController: UIViewController {

    private var metalView: MetalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Attach Metal View
        self.metalView = MetalView(frame: self.view.frame)
        self.view.addSubview(metalView)
    }


}

