//
//  ViewController.swift
//  Photos
//
//  Created by Madison Williams on 3/11/19.
//  Copyright © 2019 Madison Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
  
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {            
            let alertController = UIAlertController(title: "No Camera", message: "The devide does not have a camera", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        } else {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func folderButtonPressed(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
 
}

