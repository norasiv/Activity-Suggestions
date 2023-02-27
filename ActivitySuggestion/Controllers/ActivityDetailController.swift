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
    
    var emojis = ""

    
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityLabel.text = activity
        dateLabel.text = date
        
        getEmoji()
        
    }
    
    // check price and give correct emoji
    func getPrice(){
        if price == 0.0 {
            emojis = "💯"
        } else {
            emojis = "✅"
        }
    }
    
    
    // get emoji and make subview for animation
    func getEmoji() {
        getPrice()
        let numberOfEmoji = 15
        for _ in 1...numberOfEmoji {
            let emojiLabel = UILabel()
            let randomDelay = CGFloat.random(in: 0..<10) / 5
            let randomXPosition = Int(arc4random_uniform(350) + 1)
            emojiLabel.frame = CGRect(x: randomXPosition, y: -100, width: 200, height: 100)
            emojiLabel.text = emojis
            
            self.view.addSubview(emojiLabel)
                    
            rainAnimation(label: emojiLabel, randomXPosition: randomXPosition, delay: randomDelay)
        }
    }
    
    // animation -- see reference 2
    func rainAnimation(label: UILabel, randomXPosition: Int, delay: CGFloat){
        UILabel.animate(withDuration: 5, delay: delay, options: [.curveLinear, .repeat], animations: {
            label.frame = CGRect(x: randomXPosition, y: -100, width: 200, height: 2000)
        }, completion: nil)
    }
    

}
