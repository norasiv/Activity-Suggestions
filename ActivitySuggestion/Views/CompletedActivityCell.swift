//
//  CompletedActivity.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 25/02/2023.
//

import UIKit

class CompletedActivityCell: UITableViewCell {
    
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
