//
//  SecondViewController.swift
//  test
//
//  Created by Anisha Mittal on 12/7/16.
//  Copyright © 2016 Anisha Mittal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // initialize buttons, labels, and variables
    @IBOutlet weak var amino_acid_name: UILabel!
    @IBOutlet weak var submit_button: UIButton!
    @IBOutlet weak var chain1: UIButton!
    @IBOutlet weak var chain2: UIButton!
    @IBOutlet weak var chain3: UIButton!
    @IBOutlet weak var chain4: UIButton!
    @IBOutlet weak var chain5: UIButton!
    @IBOutlet weak var chain6: UIButton!
    @IBOutlet weak var chain7: UIButton!
    @IBOutlet weak var score: UILabel!
    var last_button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function methodOfReceivedNotification when the notification from popup is received
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("molecule1"), object: nil)
        
         // Do any additional setup after loading the view.
    }
   
    // Function that changes one of the 7 side chain button's background image
    @objc func methodOfReceivedNotification(notification: Notification){

        // Passes in name of the image clicked in popup to variable 'chain'
        let chain = notification.object as? String
        last_button.frame.size = CGSize(width: 100, height: 60)

//        last_button.frame = CGRect( CGSize(width: 130, height: 80))
        
        // If the 'clear' button was clicked in the popup, remove the side chain button's background image
        if(chain == "clear"){
            last_button.setBackgroundImage(nil, for: .normal)
        }
            
        // Change the side chain button's background image to the image with the name stored in 'chain'
        else{
            let image = UIImage(named: chain!)
            last_button.setBackgroundImage(image, for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Initialize an array of amino acid names
    var amino_acids: [String] =
        ["Alanine", "Valine", "Leucine", "Isoleucine", "Proline","Phenylalanine", "Tyrosine", "Tryptophan", "Serine", "Threonine", "Cysteine", "Methionine", "Asparagine", "Glutamine", "Lysine", "Arginine", "Histidine", "Aspartate", "Glutamate"]
    
    // Execute when the submit button is pressed
    @IBAction func submitButtonPressed(_ sender: UIButton) {

        // Check if user entered the correct side chain
        if(check(name: amino_acid_name.text!)){
            
            // Calls the function display() to flash green on the screen
            display(correct: 1)
            
            // Store a number picked randomly between 0 and the length of the amino acids array
            var rand_index = arc4random_uniform(UInt32(amino_acids.count))
            
            // Check if there are still amino acids left in the array to be quizzed
            if (amino_acids.count > 0) {
                
                // Change the amino acid name label to the name of the amino acid at the randomly generated number index
                amino_acid_name.text = amino_acids[Int(rand_index)]
                
                // Remove the name of the amino acid just tested from the array
                amino_acids.remove(at: Int(rand_index))
            }
            
            // Execute when all amino acids have been tested
            else {
                // Call the function keep_quizzing() that resets the score number to 0
                keep_quizzing()
                
                // Reset the amino acids array
                amino_acids =
                    ["Glycine", "Alanine", "Valine", "Leucine", "Isoleucine", "Proline","Phenylalanine", "Tyrosine", "Tryptophan", "Serine", "Threonine", "Cysteine", "Methionine", "Asparagine", "Glutamine", "Lysine", "Arginine", "Histidine", "Aspartate", "Glutamate"]
            }
            
            // Increment the score counter
            update_correct()
        }
            
        // Execute if the user got the answer wrong
        else{
            
            // Call the function display() to flash red on the screen
            display(correct: 0)
        }
    }

    // Execute when the Skip button is pressed
    @IBAction func skip(_ sender: UIButton) {
        
        // Call the function display() to flash yellow on the screen
        display(correct: 2)
        
        // Store a number picked randomly between 0 and the length of the amino acids array
        var rand_index = arc4random_uniform(UInt32(amino_acids.count))
        
        // Check if there are still amino acids left in the array to be quizzed
        if (amino_acids.count > 0) {
            
            // Change the amino acid name label to the name of the amino acid at the randomly generated number index
            amino_acid_name.text = amino_acids[Int(rand_index)]
            
            // Remove the name of the amino acid just tested from the array
            amino_acids.remove(at: Int(rand_index))
        }
        
        // Execute when all amino acids have been tested
        else {
            // Call the function keep_quizzing() that resets the score number to 0
            keep_quizzing()
            
            // Reset the amino acids array
            amino_acids =
                ["Glycine", "Alanine", "Valine", "Leucine", "Isoleucine", "Proline","Phenylalanine", "Tyrosine", "Tryptophan", "Serine", "Threonine", "Cysteine", "Methionine", "Asparagine", "Glutamine", "Lysine", "Arginine", "Histidine", "Aspartate", "Glutamate"]
        }
        
        // Increment the score counter
        update_correct()
    }
    
    // Opens the popup window
    func openPopup(){
        
        // Initialize a new View Controller
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopupID") as! PopupViewController
        
        // Make the new view controller a child
        self.addChildViewController(popOverVC)
        
        popOverVC.view.frame = self.view.frame
        
        // Add the new view as a subview
        self.view.addSubview(popOverVC.view)
        
        // Make the popup window the parent
        popOverVC.didMove(toParentViewController: self)
    }
    
    // Resets the score counter label to 0
    func keep_quizzing(){
        score.text = "0"
    }
    
    // Changes the background color of the amino acid name label to green
    func green(){
        amino_acid_name.backgroundColor = UIColor.green
    }
    
    // Changes the background color of the amino acid name label to gray
    func gray(){
        amino_acid_name.backgroundColor = UIColor.groupTableViewBackground
    }
    
    // Changes the background color of the amino acid name label to red
    func red(){
        amino_acid_name.backgroundColor = UIColor.red
    }
    
    // Changes the background color of the amino acid name label to yellow
    func yellow(){
        amino_acid_name.backgroundColor = UIColor.yellow
    }
    
    // Changes the background color of the amino acid label to teal
    func teal(){
        amino_acid_name.backgroundColor = UIColor(red: 0, green: 1, blue: 128/255, alpha: 1.0)
    }
    
    // Increments the score counter label
    func update_correct(){
        score.text = String((Int(score.text!)! + 1))
    }
    
    // Removes each of the side chain button's background images
    func clear(){
        chain1.setBackgroundImage(nil, for: .normal)
        chain2.setBackgroundImage(nil, for: .normal)
        chain3.setBackgroundImage(nil, for: .normal)
        chain4.setBackgroundImage(nil, for: .normal)
        chain5.setBackgroundImage(nil, for: .normal)
        chain6.setBackgroundImage(nil, for: .normal)
        chain7.setBackgroundImage(nil, for: .normal)
    }
    
    // Changes display of the amino acid name label
    func display(correct: Int){
        
        // Execute if the user got the answer right
        if(correct == 1){
            
            // Change the amino acid name label background color to green
            amino_acid_name.backgroundColor = UIColor.green
            
            // Use delay timers to flash between gray and green background colors on the amino acid name label
            var timer1 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("gray"), userInfo: nil, repeats: false)
            var timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("green"), userInfo: nil, repeats: false)
            var timer3 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("gray"), userInfo: nil, repeats: false)
            
            // Resets the side chain buttons to blank
            clear()
        }
            
        // Execute if the user pressed the skip button
        else if(correct == 2){
            
            // Change the amino acid name label background color to yellow
            amino_acid_name.backgroundColor = UIColor.yellow
            
            // Use delay timers to flash between gray and yellow background colors on the amino acid name label
            var timer4 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("gray"), userInfo: nil, repeats: false)
            var timer5 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("yellow"), userInfo: nil, repeats: false)
            var timer6 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("gray"), userInfo: nil, repeats: false)
        }
            
        // Execute if the user got the answer wrong
        else{
            
            // Change the amino acid name label background color to red
            amino_acid_name.backgroundColor = UIColor.red
            
            // Use delay timers to flash between gray and red background colors on the amino acid name label
            var timer4 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("gray"), userInfo: nil, repeats: false)
            var timer5 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("red"), userInfo: nil, repeats: false)
            var timer6 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: Selector("gray"), userInfo: nil, repeats: false)
        }
    }
    
    // Check if the user's inputted answers are correct
    func check(name: String) -> Bool{
        
        // Checks the name of the current amino acid being tested
        // Goes through each of the 7 side chain buttons and check whether their background image is NOT the correct answer
        // If any of the side chain buttons' images are incorrect, return false
        // return true when correct
        
        
        if (name == "Glycine"){
            if (chain1.currentBackgroundImage != UIImage(named: "hydrogen") || chain2.currentBackgroundImage != nil
                || chain3.currentBackgroundImage != nil
                || chain4.currentBackgroundImage != nil
                || chain5.currentBackgroundImage != nil
                || chain6.currentBackgroundImage != nil
                || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Alanine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH3")
            || chain2.currentBackgroundImage != nil
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Valine"){
            if (chain1.currentBackgroundImage != UIImage(named: "valine")
            || chain2.currentBackgroundImage != nil
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Leucine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "valine")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Methionine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "CH2")
            || chain3.currentBackgroundImage != UIImage(named: "sulfur")
            || chain4.currentBackgroundImage != UIImage(named: "CH3")
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Isoleucine"){
            if (chain1.currentBackgroundImage != UIImage(named: "isoleucine")
            || chain2.currentBackgroundImage != UIImage(named: "CH2")
            || chain3.currentBackgroundImage != UIImage(named: "CH3")
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Phenylalanine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "ring")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Tyrosine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "ring")
            || chain3.currentBackgroundImage != UIImage(named: "OH")
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Tryptophan"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "tryptophan")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Lysine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "CH2")
            || chain3.currentBackgroundImage != UIImage(named: "CH2")
            || chain4.currentBackgroundImage != UIImage(named: "CH2")
            || chain5.currentBackgroundImage != UIImage(named: "NH3")
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Arginine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "CH2")
            || chain3.currentBackgroundImage != UIImage(named: "CH2")
            || chain4.currentBackgroundImage != UIImage(named: "NH")
            || chain5.currentBackgroundImage != UIImage(named: "arginine")
            || chain6.currentBackgroundImage != UIImage(named: "NH2")
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Histidine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "histidine")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Aspartate"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "COO")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Glutamate"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "CH2")
            || chain3.currentBackgroundImage != UIImage(named: "COO")
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Serine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "OH")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Threonine"){
            if (chain1.currentBackgroundImage != UIImage(named: "threonine")
            || chain2.currentBackgroundImage != UIImage(named: "CH3")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Cysteine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "SH")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Asparagine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "asparagine")
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        if (name == "Glutamine"){
            if (chain1.currentBackgroundImage != UIImage(named: "CH2")
            || chain2.currentBackgroundImage != UIImage(named: "CH2")
            || chain3.currentBackgroundImage != UIImage(named: "asparagine")
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }

        if (name == "Proline"){
            if (chain1.currentBackgroundImage != UIImage(named: "proline")
            || chain2.currentBackgroundImage != nil
            || chain3.currentBackgroundImage != nil
            || chain4.currentBackgroundImage != nil
            || chain5.currentBackgroundImage != nil
            || chain6.currentBackgroundImage != nil
            || chain7.currentBackgroundImage != nil){
                return false
            }
            return true
        }
        
        // Return false if error
        return false
    }
    
    
    // Execute when first side chain button is pressed
    @IBAction func chain1Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to first side chain button
        last_button = chain1
        
        // Open the popup window
        self.openPopup()
    }
    
    // Execute when second side chain button is pressed
    @IBAction func chain2Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to second side chain button
        last_button = chain2
        
        // Open the popup window
        self.openPopup()
    }
    
    // Execute when third side chain button is pressed
    @IBAction func chain3Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to third side chain button
        last_button = chain3
        
        // Open the popup window
        self.openPopup()
    }
    
    // Execute when fourth side chain button is pressed
    @IBAction func chain4Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to fourth side chain button
        last_button = chain4
        
        // Open the popup window
        self.openPopup()
    }
    
    // Execute when fifth side chain button is pressed
    @IBAction func chain5Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to fifth side chain button
        last_button = chain5
        
        // Open the popup window
        self.openPopup()
    }
    
    // Execute when sixth side chain button is pressed
    @IBAction func chain6Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to sixth side chain button
        last_button = chain6
        
        // Open the popup window
        self.openPopup()
    }
    
    // Execute when seventh side chain button is pressed
    @IBAction func chain7Pressed(_ sender: UIButton) {
        
        // Set the last_button variable to seventh side chain button
        last_button = chain7
        
        // Open the popup window
        self.openPopup()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
