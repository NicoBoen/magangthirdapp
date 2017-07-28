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

class FirstViewController: UIViewController, UIPopoverPresentationControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    var selectedImage: UIImage!
    var gambar: UIImageView!
    var delegate: firstVCDelegate?
    
    @IBOutlet weak var viewDoang: UIView!
    
    @IBAction func bigTapGesture(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var smallTapGesture: UITapGestureRecognizer!
    @IBOutlet var cameraimageTapGesture: UITapGestureRecognizer!
    
    //Ini variabel untuk posisi Popover
    var width: CGFloat = 0
    var height: CGFloat = 0
    var x: CGFloat = 1010
    var y: CGFloat = 350
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var galeryButton: UIButton!
    
//    override var shouldAutorotate: Bool {
//        return true
//    }
//    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
//        return .landscape
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        galeryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
    }
    
    @IBAction func cameraimageTapGesture(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let actionSheet = UIAlertController(title: "Oops!", message: "Camera is not available", preferredStyle: .alert)
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(actionSheet, animated: true, completion: nil)
            print("Camera is not available")
        }
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            //imagePicker.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let actionSheet = UIAlertController(title: "Oops!", message: "Camera is not available", preferredStyle: .alert)
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            self.present(actionSheet, animated: true, completion: nil)
            print("Camera is not available")
        }
    }
  

    
    @IBAction func galleryButton(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "secondsegue", sender: sender)
        
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = false
//        imagePicker.delegate = self
//        //imagePicker.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        //imagePicker.view.transform = CGAffineTransform(translationX: 5, y: 50)
//        self.present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: segue)

        let popVC: popoverVC = segue.destination as! popoverVC
        popVC.Delegate = self
        popVC.Gambar = gambar
        
        if segue.identifier == "secondsegue"{

            let vc = segue.destination
            vc.preferredContentSize = CGSize(width: 1024, height: 550)
            
            let controller = vc.popoverPresentationController
            controller?.sourceView = self.view
            controller?.sourceRect = CGRect(x: x, y: y, width: width, height: height)
            //controller?.permittedArrowDirections = .right
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}

//How to pick picture from library
extension FirstViewController:  popVCDelegate{
    
    //after User finished pick an image
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage{
//            
//            //User has the image
//            self.selectedImage = imagePicked
//            self.gambar.image = selectedImage
//            
//            dismiss(animated: true, completion: nil)
//            
//            print("AAA")
//        }
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
//            dismiss(animated: true, completion: nil)
//            
//            print("BBB")
//        }
//        
//    }
    
    func popViewControllerDidFinish(_ popVC: popoverVC) {
        self.gambar = popVC.Gambar
    }
    
}


