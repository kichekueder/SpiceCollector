//
//  SpiceViewController.swift
//  SpiceCollector
//
//  Created by Tom Munhoven on 25/05/2017.
//  Copyright © 2017 Tom Munhoven. All rights reserved.
//

import UIKit

// Need to add two delegates for the image picker
class SpiceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var spiceImage: UIImageView!
    @IBOutlet weak var spiceTextField: UITextField!
    
    // provide Image Picker
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // image picker in this class
        imagePicker.delegate = self
        
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        // Use photo library as source
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        // need to include a permission request in info.plist
        
    }
    
    // function called once user has selected picture
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        // collect image selected into constant 'image'
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // set the image of the placeholder to the image selected.
        spiceImage.image = image
        
        // dismiss the image picker
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        
        
    }
    
    
}
