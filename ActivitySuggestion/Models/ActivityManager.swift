

import Foundation


class ActivityManager {
    
    //MARK: - fetch api
    func fetchActivity(url:String, completion: @escaping (Error?, Activities) -> Void) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) {data, response, error in
                if data != nil && error == nil {
                    do {
                        let parsingData = try JSONDecoder().decode(Activities.self, from: data!)
                        completion(nil, parsingData)
                    }catch {
                        print(error)
                    }
                }
            }
            .resume()
        }
    }
}
