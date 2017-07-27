//
//  ViewController.swift
//  Third Magang App
//
//  Created by Nico Boentoro on 7/20/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        
        let firstVC: FirstViewController = segue.destination as! FirstViewController
        
        firstVC.delegate = self
        firstVC.gambar = imageView
        
        
        
        
        
    }
    
    
}

extension ViewController: firstVCDelegate{

    func firstViewControllerDidFinish(_ firstVC: FirstViewController) {
        self.imageView = firstVC.gambar
    }

    
}

