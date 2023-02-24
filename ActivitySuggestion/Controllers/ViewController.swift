//
//  ViewController.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 24/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var activities: Activities!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchActivity(URL: Cons.apiUrl) { result in
            self.activities = result
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: Cons.activityCell, bundle: nil), forCellReuseIdentifier: Cons.activityCell)
        
    }
    
    
    @IBAction func newActivityPressed(_ sender: UIButton) {
        
    }
    
    
    
    // get activity from API
    func fetchActivity(URL url:String, completion: @escaping (Activities) -> Void) {
        
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) {data, response, error in
            if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode(Activities.self, from: data!)
                    completion(parsingData)
                    print(self.activities.activity)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch {
                    print (error)
                }
            }
        }
        dataTask.resume()
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activities = activities
        let cell = tableView.dequeueReusableCell(withIdentifier: Cons.activityCell, for: indexPath)
        as! ActivityCell
        cell.activityLabel.text = activities?.activity
        return cell
        }
        
    }
    

