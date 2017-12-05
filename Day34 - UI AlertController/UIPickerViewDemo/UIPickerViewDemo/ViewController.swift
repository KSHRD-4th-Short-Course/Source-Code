//
//  ViewController.swift
//  UIPickerViewDemo
//
//  Created by KSHRD on 12/5/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Outlet
    @IBOutlet weak var dateTimePickerView: UIPickerView!
    
    // Data
    //    [[1, 2, 3],
    //    ["January", "February", "March"],
    //    [1990, 1991, 1992]]
    
    
    
    let data = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31],
        ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        [1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate and datasource
        dateTimePickerView.delegate =  self
        dateTimePickerView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        dateTimePickerView.selectRow(5, inComponent: 1, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data[component][row])"
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print("Selected Row: \(row) Component: \(component)")
        print("\(data[component][row])")
       
    
    }
    

    
}









