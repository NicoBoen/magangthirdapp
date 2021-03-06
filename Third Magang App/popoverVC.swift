//
//  VC.swift
//  Third Magang App
//
//  Created by Nico Boentoro on 7/25/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

protocol popVCDelegate: class {
    func popViewControllerDidFinish (_ popVC: popoverVC)
}

class popoverVC: UIViewController{

    var SelectedImage: UIImage!
    var Gambar: UIImageView!
    var amanda = UIImagePickerController()
    
    
    var Delegate: popVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("AAAA")
        
    }
    
//    override var shouldAutorotate: Bool {
//        return true
//    }
//    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
//        return .landscape
//    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        amanda.sourceType = .photoLibrary
        amanda.allowsEditing = false
        amanda.delegate = self
        addChildViewController(amanda)
        view.addSubview(amanda.view)
        //amanda.preferredContentSize = CGSize(width: 0.3, height: 1)
        //amanda.view.transform = CGAffineTransform(a: <#T##CGFloat#>, b: <#T##CGFloat#>, c: <#T##CGFloat#>, d: <#T##CGFloat#>, tx: <#T##CGFloat#>, ty: <#T##CGFloat#>)
    }
}

//How to pick picture from library
extension popoverVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    //after User finished pick an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
         if let ImagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage{
         
            //User has the image
//            self.SelectedImage = ImagePicked
//            self.Gambar.image = SelectedImage
            self.Gambar.image = ImagePicked
            
            dismiss(animated: true, completion: nil)
            
            print("BBBB")
            
        }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
//        amanda.view.removeFromSuperview()
//        amanda.removeFromParentViewController()
            
            print("CCC")
        }
    }

}
