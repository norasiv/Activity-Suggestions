//
//  ActivityDetailController.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 26/02/2023.
//

import UIKit

class ActivityDetailController: UIViewController {
    
    var activity = ""
    var date = ""
    
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityLabel.text = activity
        dateLabel.text = date
        
        
    }
    

}
