//
//  AddTaskViewController.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//

import UIKit

class AddTaskViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskType: UITextField!
    @IBOutlet var taskDate: UIDatePicker!
    @IBOutlet var taskDuration: UISlider!
    @IBOutlet var taskDesc: UITextView!
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)

    }
    
    @IBAction func btnSave(_ sender: Any) {
        if let name = taskName.text,
           let shortdescription = taskDesc.text,
           let type = taskType.text{
            
            let newTask = YogaEntity(context: DBManager.share.context)
            newTask.name = name
            newTask.shortdescription = shortdescription
            newTask.type = type
            newTask.taskdate = taskDate.date
            newTask.taskduration = Int16(taskDuration.value)
            newTask.image = image?.jpegData(compressionQuality: 1)

            DBManager.share.saveContext()
            print (newTask)
        }
    }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let userPickedImage = info[.editedImage] as? UIImage else { return}
            image = userPickedImage
            picker.dismiss(animated: true)
        }
}
