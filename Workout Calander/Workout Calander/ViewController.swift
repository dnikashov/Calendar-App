//
//  ViewController.swift
//  Workout Calander
//
//  Created by Natalia Nikashova on 2024-03-06.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
     
    var selectedDate = Date()
    var totalSquares = [String]()
    var selectedindexPath = String()
    var dayNumber = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    
    func setCellsView () {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 7
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView(){
        totalSquares.removeAll()
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpace = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while (count <= 42){
            if (count <= startingSpace || count - startingSpace > daysInMonth){
                totalSquares.append("")
            }
            else{
                totalSquares.append(String(count - startingSpace))
            }
            count += 1
        }
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
        + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        cell.dayOfMonth.setTitle(String(totalSquares[indexPath.item]), for: .normal)
        return cell
    }
    

    @IBAction func prevMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    
    
    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    
    override open var shouldAutorotate: Bool{
        return false
    }
        
    @IBAction func buttonPressed(_ sender: UIButton) {
        dayNumber = sender.title(for: .normal) ?? "No Number"
        if !dayNumber.isEmpty {
                performSegue(withIdentifier: "secondVC", sender: self)
            } else {
                // Handle the case where no selection was made
                print("No day selected")
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {
            destination.caldate = selectedDate
            destination.dateNum = dayNumber
        }
    }
}

