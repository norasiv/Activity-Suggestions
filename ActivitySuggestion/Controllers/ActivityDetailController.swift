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
    var price = 0.0
    
    let emojis = [0.0: "💯",
                  0.1 : "✅"
    ] as [AnyHashable : String]
    
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityLabel.text = activity
        dateLabel.text = date
        
        getEmoji()
        
    }
    
    
    func getEmoji() {
        let numberOfEmoji = 20
        for _ in 1...numberOfEmoji {
            let emojiLabel = UILabel()
            let randomXPosition = Int(arc4random_uniform(300) + 1)
            emojiLabel.frame = CGRect(x: randomXPosition, y: 0, width: 200, height: 100)
            
            for (activtiyPrice, emoji) in emojis {
                if (price == activtiyPrice as! Double){
                    emojiLabel.text = emoji
                    self.view.addSubview(emojiLabel)
                    
                    rainAnimation(label: emojiLabel, randomXPosition: randomXPosition)
                }
            }
        }
    }
    
    func rainAnimation(label: UILabel, randomXPosition: Int){
        UILabel.animate(withDuration: 5, delay: 0.5, options: [.curveLinear], animations: {
            label.frame = CGRect(x: randomXPosition, y: 0, width: 200, height: 2000)
        }, completion: nil)
    }
    

}
