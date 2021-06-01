//
//  ViewController.swift
//  evaluation 1 ios
//
//  Created by Student07 on 01/06/2021.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var image_background: UIImageView!
    @IBOutlet weak var image_avatar: UIImageView!
    @IBOutlet weak var button_login: UIButton!
    @IBOutlet weak var button_show_mdp: UIButton!
    @IBOutlet weak var text_login: UITextField!
    @IBOutlet weak var text_mdp: UITextField!
    @IBOutlet weak var switch_new: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image_background.image = UIImage(named: "background_image.jpeg")
        image_background.contentMode = .scaleToFill
        image_avatar.image = UIImage(named: "user_icon")
        let vertFonce = UIColor(red: 30/255.0, green: 72/255.0, blue: 27/255.0, alpha: 1.0)
        image_avatar.backgroundColor = vertFonce
        image_avatar.layer.cornerRadius = image_avatar.frame.size.width / 2
        image_avatar.clipsToBounds = true
        button_login.layer.cornerRadius = 20
        button_show_mdp.setImage(UIImage(named: "eye_on_icon"), for: .normal)
        button_show_mdp.tintColor = .black
        text_mdp.isSecureTextEntry = true
        let tapOnView = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
       view.addGestureRecognizer(tapOnView)
        text_login.keyboardType = .emailAddress
        text_login.delegate = self
        text_mdp.delegate = self
        
        
    }
    
    @objc func closeKeyboard(){
        view.endEditing(false)
    }
 
    @IBAction func button_show_action(_ sender: Any) {
        if text_mdp.isSecureTextEntry == true {
            text_mdp.isSecureTextEntry = false
            button_show_mdp.setImage(UIImage(named: "eye_off_icon"), for: .normal)
        }
        else{
            text_mdp.isSecureTextEntry = true
            button_show_mdp.setImage(UIImage(named: "eye_on_icon"), for: .normal)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        closeKeyboard()
        return true
    }
 
    @IBAction func login_action(_ sender: Any) {
        if let text_log:String = text_login.text,let text_mdp_confirm:String = text_mdp.text {
            if text_log.isEmpty && text_mdp_confirm.isEmpty{
                let alert = UIAlertController(title:  "Error", message: "aucun champs rempli", preferredStyle:.alert)
                  alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
                      print("alert")
                }))

                present(alert, animated: true, completion: nil)
            }
            if text_log.isEmpty ||  text_mdp_confirm.isEmpty || !text_log.contains("@"){
                let alert = UIAlertController(title:  "Error", message: "un des deux champs est vide ou mal rempli", preferredStyle:.alert)
                  alert.addAction(UIAlertAction(title: "merci", style: .default, handler: { action in
                      print("alert")
                }))

                present(alert, animated: true, completion: nil)
            }
            else{
                if switch_new.isOn {
                    let alert = UIAlertController(title:  "bienvenue " + text_log, message:"la newsletter est activé" , preferredStyle:.alert)
                    alert.addAction(UIAlertAction(title: "merci", style: .default, handler: { action in
                        print("alert")
                  }))

                  present(alert, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title:  "bienvenue " + text_log, message:"la newsletter n'est pas active" , preferredStyle:.alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
                        print("alert")
                  }))
                    present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
}

