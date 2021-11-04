//
//  ViewController2.swift
//  MaramFaqih_Project02_JizanFantasy
//
//  Created by meme f on 27/03/1443 AH.
//

import UIKit
protocol rollGameHero{
    var name:String {get}
    var points:Int {get set}
    var lP:Int? {get set}
    var dF:Int? {get set}
    var pD:Int? {get set}
    var wD:Int? {get set}
    var sC:Int {get set}
    
  // func playaCtion()-> Int
    
    func checkdF()-> Int
    func checkpD()-> Int
    func checkwD()-> Int
    
}
class Hero:rollGameHero {
  
    var name: String
    
    var points: Int
    var lP: Int?
    var dF: Int?
    var pD: Int?
    var wD: Int?
    var sC: Int

    var dFMax:Int
    var pDMax:Int
    var wDMax:Int
    
    init(name: String,points:Int,lP:Int?,dF:Int?,pD:Int?,wD:Int?,sC:Int,dFMax:Int,pDMax:Int,wDMax:Int){
        self.name=name
        self.points=points
        self.lP=lP
        self.dF=dF
        self.pD=pD
        self.wD=wD
        self.sC=sC
       
       self.dFMax=dFMax
       self.pDMax=pDMax
       self.wDMax=wDMax
    }


func checkdF() -> Int {
    if dF! <= dFMax {
        return dF!
    }else{
        return 0
    }
}
    func checkpD() -> Int {
        if pD! <= pDMax{
            return pD!
        }else{
            return 0
        }
    }

func checkwD() -> Int {
    if wD! <= wDMax{
        return wD!
    }else{
        return 0
    }
}
}
    class Knight:Hero{
       
 
        
        
    }
class Wizard:Hero{
   

 
    
    
}


class Thief:Hero{
   

    
    
}

class ViewController2: UIViewController {

    
    @IBOutlet weak var lPLabel: UITextField!
    
    @IBOutlet weak var sCLabel: UILabel!
    @IBOutlet weak var wDLabel: UITextField!
    @IBOutlet weak var pDLabel: UITextField!
    @IBOutlet weak var dFLabel: UITextField!
    @IBOutlet weak var namePlayer2: UILabel!
    
    @IBOutlet weak var namePlayer: UITextField!
    @IBOutlet var textFieldSet: [UITextField]!
    
    @IBOutlet weak var pointPlayer2Label: UILabel!
    
    var knight = Knight(name:"Knight", points: 250, lP: nil, dF:nil, pD:nil, wD:nil, sC:100,dFMax:20, pDMax:30, wDMax:40)
    var wizard = Wizard(name:"Wizard", points: 245, lP: nil, dF:nil, pD:nil, wD:nil, sC:50, dFMax:15, pDMax:70, wDMax:20)
    var thief = Thief(name:"Thief", points: 210,  lP: nil, dF:nil, pD:nil, wD:nil, sC:75,dFMax:25, pDMax:15, wDMax:30)
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
   // Do any additional setup after loading the view.
        for i in textFieldSet{
            i.delegate = self
            //print("\(i)")
    }
        namePlayer.delegate = self
        let player2 = namePlayer.text
        //var lPVar:S? = nil
        switch player2{
        case "knight":
            
            lPLabel.text = String(knight.lP ?? 60)
            dFLabel.text = String(knight.dF ?? 20)
            
         /*   if knight.dF != nil{
                if(Int(dFLabel.text) > knight.dFMax){
                    lPVar = Int(dFLabel.text)
                }else{
                    
                }
                
            }*/
            pDLabel.text = String(knight.pD ?? 30)
           wDLabel.text = String(knight.wD ?? 40)
            
        case "wizard":
            lPLabel.text = String(wizard.lP ?? 90)
            dFLabel.text = String(wizard.dF ?? 15)
            //dFLabel.text = String(wizard.checkdF())
           //wizard.checkdF()=
            pDLabel.text = String(wizard.pD ?? 70)
           wDLabel.text = String(wizard.wD ?? 20)
        case "thief" :
            lPLabel.text = String(thief.lP ?? 65)
            dFLabel.text = String(thief.dF ?? 25)
            pDLabel.text = String(thief.pD ?? 15)
           wDLabel.text = String(thief.wD ?? 30)
        default :
            print("Please enter the name of player 2 ")
        }
        
      
    }
    
 
      
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let rootVC = segue.destination as! ViewController
                
                rootVC.player2LabelName.text = namePlayer.text
                rootVC.player2LabelLP.text = lPLabel.text
                rootVC.player2LabelDF.text = dFLabel.text
                rootVC.player2LabelPD.text = pDLabel.text
                rootVC.player2LabelWD.text = wDLabel.text
                rootVC.player2LabelSC.text = sCLabel.text
                
        
            }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

extension ViewController2:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //let nameDelegate = namePlayer.text
        //pointPlayer2Label.text = nameDelegate.points
        //sCLabel.text = nameDelegate.sC
       if namePlayer.text == "knight" {
            pointPlayer2Label.text = String(knight.points)
            sCLabel.text = String(knight.sC)
        }
        else if namePlayer.text == "wizard" {
            pointPlayer2Label.text = String(wizard.points)
            sCLabel.text = String(wizard.sC)
        }
        else if namePlayer.text == "thief" {
            pointPlayer2Label.text = String(thief.points)
            sCLabel.text = String(thief.sC)
        }
      
        
        //namePlayer2.text=
        textField.resignFirstResponder()
        return true
        
    }
    
}