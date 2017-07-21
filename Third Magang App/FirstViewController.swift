//
//  FirstViewController.swift
//  Third Magang App
//
//  Created by Nico Boentoro on 7/20/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

protocol firstVCDelegate: class {
    func firstViewControllerDidFinish (_ firstVC: FirstViewController)
}

class FirstViewController: UIViewController {

    var selectedImage: UIImage!
    var gambar: UIImageView!
    var delegate: firstVCDelegate?
    //var location = CGPoint(x: 0, y: 0)
    
    
    
    
    @IBOutlet weak var viewDoang: UIView!
    
    @IBAction func bigTapGesture(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var smallTapGesture: UITapGestureRecognizer!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewDoang.center = CGPoint(x: 300, y: 500)
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func cameraButton(_ sender: Any) {
                let actionSheet = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .alert)
                actionSheet.addAction(UIAlertAction(title: "Go to Camera", style: .default, handler: {(_) in
                    //option that allows User to go to Camera
                    let imagePicker = UIImagePickerController()
                    if UIImagePickerController.isSourceTypeAvailable(.camera){
                        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
                    imagePicker.sourceType = .camera
                    imagePicker.allowsEditing = false
                    imagePicker.delegate = self
        
                    self.present(imagePicker, animated: true, completion: nil)
                    }
        
                }))
                actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                
                
                self.present(actionSheet, animated: true, completion: nil)
        
        
    }
  
    
    @IBAction func galleryButton(_ sender: Any) {
        
        let actionScheet = UIAlertController(title: "Pick your option", message: "", preferredStyle: .alert)
        actionScheet.addAction(UIAlertAction(title: "Pick an image", style: .default, handler: {(_) in
            //option that allows User to pick an image
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionScheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        
    
        self.present(actionScheet, animated: true, completion: nil)
    
    }

    

}

//How to pick picture from library
extension FirstViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    //after User finished pick an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            //User has the image
            self.selectedImage = imagePicked
            self.gambar.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            dismiss(animated: true, completion: nil)
        }
        
    }
    
}


