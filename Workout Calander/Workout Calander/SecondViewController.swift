//
//  SecondViewController.swift
//  Workout Calander
//
//  Created by Natalia Nikashova on 2024-09-10.
//

import UIKit

class SecondViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDate()
    }
    
    var caldate = Date()
    var dateNum = String()
    
    @IBOutlet weak var dateLabel: UILabel!
    
    func setDate (){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM " + dateNum + ", yyyy"
        dateLabel.text = dateFormatter.string(from:caldate)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
