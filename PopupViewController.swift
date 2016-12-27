//
//  PopupViewController.swift
//  test
//
//  Created by Anisha Mittal on 12/7/16.
//  Copyright © 2016 Anisha Mittal. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    // Initialize dictionary of string names of the images of the different side chain molecule groups
    var chain_dict: [Int: String] = [1 : "CH3",
                                       2 : "CH2",
                                       3 : "COO",
                                       4 : "OH",
                                       5 : "SH",
                                       6 : "NH",
                                       7 : "arginine",
                                       8 : "NH2",
                                       9 : "NH3",
                                       10 : "hydrogen",
                                       11 : "asparagine",
                                       12 : "histidine",
                                       13 : "isoleucine",
                                       14 : "ring",
                                       15 : "sulfur",
                                       16 : "tryptophan",
                                       17 : "valine",
                                       18 : "threonine",
                                       19 : "proline",
                                       20 : "clear"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show animation of the popup window
        self.showAnimate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions executed when any of the images in the popup window is clicked
    // Send a notification with the name "molecule1" passing the name of the image clicked in the popup window
    // Remove the animation of the popup window
    
    @IBAction func closePopup(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[1])
        self.removeAnimate()
    }
    @IBAction func closePopup2(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[2])
        self.removeAnimate()
    }
    @IBAction func closePopup3(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[3])
        self.removeAnimate()
    }

    @IBAction func closePopup4(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[4])
        self.removeAnimate()
    }
    
    @IBAction func closePopup5(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[5])
        self.removeAnimate()
    }
    
    @IBAction func closePopup6(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[6])
        self.removeAnimate()
    }
    
    @IBAction func closePopup7(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[7])
        self.removeAnimate()
    }
    
    @IBAction func closePopup8(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[8])
        self.removeAnimate()
    }
    
    @IBAction func closePopup9(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[9])
        self.removeAnimate()
    }
    
    @IBAction func closePopup10(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[10])
        self.removeAnimate()
    }
    
    @IBAction func closePopup11(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[11])
        self.removeAnimate()
    }
    
    @IBAction func closePopup12(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[12])
        self.removeAnimate()
    }
    
    @IBAction func closePopup13(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[13])
        self.removeAnimate()
    }
    
    @IBAction func closePopup14(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[14])
        self.removeAnimate()
    }
    
    @IBAction func closePopup15(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[15])
        self.removeAnimate()
    }
    
    @IBAction func closePopup16(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[16])
        self.removeAnimate()
    }
    
    @IBAction func closePopup17(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[17])
        self.removeAnimate()
    }
    
    @IBAction func closePopup18(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[18])
        self.removeAnimate()
    }
    
    @IBAction func closePopup19(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[19])
        self.removeAnimate()
    }
    
    @IBAction func closePopup20(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("molecule1"), object: chain_dict[20])
        self.removeAnimate()
    }
    
    
    // Show animation of popup window when opened
    func showAnimate(){
        
        // Transform the view to animate from a larger scaled view to smaller scaled view
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: { self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)});
    }
    
    // Remove animation of popup window when closed
    func removeAnimate(){
        
        // Transform the view to animate from a smaller scaled view to larger scaled view
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool) in
                if (finished){
                    self.view.removeFromSuperview()
                }
        });
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
