//
//  EditTaskViewController.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//

import UIKit

class EditTaskViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet var editname: UITextField!
    @IBOutlet var edittype: UITextField!
    @IBOutlet var editDate: UIDatePicker!
    @IBOutlet var editNoOfItems: UISlider!
    @IBOutlet var editDesc: UITextView!
    
    
    var currentTask : (YogaEntity)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editDesc.text = currentTask?.shortdescription
        editname.text = currentTask?.name
        edittype.text = currentTask?.type
      
//        if let data = currentTask?.image{
//            taskImage.image = UIImage(data: data)
//        }else {
//            taskImage.image = nil
//        }
//        
        if let date = currentTask?.taskdate , let taskduration = currentTask?.taskduration{
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateStyle = .medium
                  dateFormatter.timeStyle = .none

                  dateFormatter.locale = Locale(identifier: "ja_JP")

//            editDate.text = "\(dateFormatter.string(from: date))"
//            editNoOfItems.text = "\(taskduration) days"
              }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSelect(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    
    @IBAction func btnUpdate(_ sender: Any) {
//        if let imageData = editImage.image?.jpegData(compressionQuality: 1) {
      //            updateGoods?.name = editName.text
      //            updateGoods?.brand = editBrand.text
      //            updateGoods?.shortdescription = editDesc.text
      //
      //
      //            DBManager.share.update()
      //        }

              var dialogMessage = UIAlertController(title: "Success", message: "Data Update Success!", preferredStyle: .alert)
              let OK = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
                  self.navigationController?.popViewController(animated: true)
              })
              dialogMessage.addAction(OK)
              self.present(dialogMessage, animated: true , completion: nil)
          }
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return}
//        editImage.image = userPickedImage
        picker.dismiss(animated: true)
    }
}
