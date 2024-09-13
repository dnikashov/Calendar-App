//
//  CalendarCell.swift
//  Workout Calander
//
//  Created by Natalia Nikashova on 2024-03-07.
//

import UIKit

class CalendarCell: UICollectionViewCell{
    
    @IBOutlet weak var dayOfMonth: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let dayNumber = sender.title(for: .normal) ?? "No Number"
    }
}
