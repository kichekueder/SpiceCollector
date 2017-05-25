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

    // Prepare add button to be used as Update button (create outlet)
    @IBOutlet weak var addAsUpdateButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    // provide Image Picker
    var imagePicker = UIImagePickerController()

    var spice : Spice? = nil // If + was tapped this will remain nil, otherwise the chose spice will populate the variable.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // image picker in this class
        imagePicker.delegate = self
        
        // Is this a new record?
        
        if spice != nil {
            
            spiceImage?.image = UIImage(data: spice!.image! as! Data)
        spiceTextField.text = spice!.title

            // Change add button to now say "Update"
            addAsUpdateButton.setTitle("Update", for: .normal)
            
        } else {
            
            // If spice is new, hide the delete button
            deleteButton.isHidden = true
            
        }
        
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
        
        // create link to Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // define the spice constant as container for the spice image and title picked by user.
        let spice = Spice(context: context)
        
        // assign the text from the text field and the image selected (must be converted).
        spice.title = spiceTextField.text!
        spice.image = UIImagePNGRepresentation(spiceImage.image!) as NSData?
        
        // save the information to Core Data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // pop back to main VC
        navigationController!.popViewController(animated: true)
        
    }
    
    
}
