//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Sheyla Astete on 5/1/18.
//  Copyright © 2018 tech innovator. All rights reserved.
//

import UIKit
enum selection{
    case KMtoMiles
    case MilestoKM
    case CtoF
    case FtoC
}
class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0; //store the first number user input
    var performingMath = false
    var selection:selection = .CtoF
    @IBOutlet weak var label: UITextField!  //show result
    @IBOutlet weak var labelOne: UITextField!//holding number
    @IBOutlet weak var firstUnit: UILabel!
    
    @IBOutlet weak var secondUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.isUserInteractionEnabled = false
        self.labelOne.isUserInteractionEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func numbers(_ sender: UIButton) {//has all the numbers 1-9
        
        if(sender.tag == 15){
            label.text = label.text! + "."
            return
        }
        label.text = label.text! + String(sender.tag-1)
        performCalcultion()
        
    }
    func temperatureInFahrenheit(temperature: Double)  {
        let fahrenheitTemperature = temperature * 9 / 5 + 32
         self.labelOne.text = String(fahrenheitTemperature)
    }
    
    func temperatureInCelcius(temperature: Double)  {
        let temperatureInC = (temperature-32) * 5/9
        self.labelOne.text = String(temperatureInC)
    }
    func distanceInMiles(distance: Double)  {
        let distanceInMiles = distance *  0.62137119
        self.labelOne.text = String(distanceInMiles)
    }
    func distanceInKiloMeters(distance: Double)  {
        let distanceInKM = distance/0.62137119;
        self.labelOne.text = String(distanceInKM)
    }
    
    func performCalcultion(){
        switch selection {
        case .CtoF:
            temperatureInFahrenheit(temperature: Double(label.text!)!)
        case .FtoC:
       temperatureInCelcius(temperature: Double(label.text!)!)
        case .KMtoMiles:
        distanceInMiles(distance: Double(label.text!)!)
        case .MilestoKM:
        distanceInKiloMeters(distance: Double(label.text!)!)

        }
    }
    
    func addActionSheet(){
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Choose Convertor", message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let FtoC = UIAlertAction(title: "Fahrenheit to celcius", style: .default)
        { _ in
            self.firstUnit.text = "F"
            self.secondUnit.text = "C"
            self.selection = .FtoC
            self.initilizeCorrespondingLabels()
        }
        actionSheetControllerIOS8.addAction(FtoC)
        
        let CtoF = UIAlertAction(title: "celcius to Fahrenheit", style: .default)
        { _ in
            self.firstUnit.text = "C"
            self.secondUnit.text = "F"
            self.selection = .CtoF
            self.initilizeCorrespondingLabels()
        }
        actionSheetControllerIOS8.addAction(CtoF)
        let MilestoKM = UIAlertAction(title: "mile to Kilometer", style: .default)
        { _ in
            self.firstUnit.text = "M"
            self.secondUnit.text = "KM"
            self.selection = .MilestoKM
            self.initilizeCorrespondingLabels()
        }
        actionSheetControllerIOS8.addAction(MilestoKM)
        let KMtoMiles = UIAlertAction(title: "Kilometer to miles", style: .default)
        { _ in
            self.firstUnit.text = "KM"
            self.secondUnit.text = "M"
            self.selection = .KMtoMiles
            self.initilizeCorrespondingLabels()
        }
        actionSheetControllerIOS8.addAction(KMtoMiles)
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
        
    
    }
    func initilizeCorrespondingLabels(){
        self.labelOne.text = ""
        self.label.text = ""
    }
    
    @IBAction func Buttons(_ sender: UIButton) {
        //aqui estan converter tag 13 c es 11 y el otro 12
        //check si hay un numero hay
       
            if sender.tag == 11{
                initilizeCorrespondingLabels()
            }
            
            if sender.tag == 12 {
            var str = label.text!
                if str != ""{
                    if str[str.startIndex] == "+" || str[str.startIndex] == "-"
                    {
                        if str[str.startIndex] == "+"{
                            
                            str.remove(at: str.startIndex)
                            str.insert("-", at: str.startIndex)
                        
                        }else if str[str.startIndex] == "-"{
                            str.remove(at: str.startIndex)
                            str.insert("+", at: str.startIndex)
                        }
                        
                    }
                   
                }
                else
                {
                   str.insert("+", at: label.text!.startIndex)
                    
                }
                self.label.text = str
                
        }
            if sender.tag == 13 // converter
            {
                //add action sheet here
                addActionSheet()
               
        }
    }
}

