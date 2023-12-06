//
//  SpecificTaskViewController.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//

import UIKit

class SpecificTaskViewController: UIViewController , UINavigationControllerDelegate{

    var currentTask: (YogaEntity)? = nil

    
    @IBOutlet var taskImage: UIImageView!
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskType: UILabel!
    
    @IBOutlet var taskDate: UILabel!
    @IBOutlet var taskDuration: UILabel!
    @IBOutlet var taskDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskDesc.text = currentTask?.shortdescription
        taskName.text = currentTask?.name
        taskType.text = currentTask?.type
        if let data = currentTask?.image{
            taskImage.image = UIImage(data: data)
        }else {
            taskImage.image = nil
        }
        
        if let date = currentTask?.taskdate , let taskduration = currentTask?.taskduration{
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateStyle = .medium
                  dateFormatter.timeStyle = .none

                  dateFormatter.locale = Locale(identifier: "ja_JP")

            taskDate.text = "\(dateFormatter.string(from: date))"
            taskDuration.text = "\(taskduration) days"
              }

    }
    
    @IBAction func startTask(_ sender: Any) {
    }
    
    @IBAction func closeTask(_ sender: Any) {
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        if let good = storyboard?.instantiateViewController(withIdentifier: "EditTaskViewController") as? EditTaskViewController {
            good.currentTask = currentTask
            self.navigationController?.pushViewController(good, animated: true)
        }
    }
}
