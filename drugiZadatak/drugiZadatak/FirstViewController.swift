//
//  FirstViewController.swift
//  drugiZadatak
//
//  Created by Nikola Barbaric on 09.06.2021..
//


import UIKit
import Foundation

class FirstViewController: UIViewController{
    
    private let orangeColor: UIColor =  #colorLiteral(red: 0.8745098039, green: 0.568627451, blue: 0.2862745098, alpha: 1)
    
    
    //LABELS
    
    private let playersLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Broj igrača koji će sudjelovati u igri"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let directionLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Promjena smjera*"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
                
        
        return label
    }()
    
    private let skipLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Preskakanje Qigrača*"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
                
        
        return label
    }()
    
    private let noteLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "* s Qojim brojem trenutni broj igra mora biti djeljiv"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
                
        
        return label
    }()
    
    private let goalNumberLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Broj do kojeg se igra"
        label.textColor = .myOrange
        label.font = UIFont(name: "Quicksand", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
                
        
        return label
    }()
    
    //BUTTONS
    
    private let button: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Rezultat", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .myOrange
        
        return button
    }()
    
    
    //INPUT TEXTFIELDS
    private let playersInput: UITextField = {
        
        
        let textfield = UITextField()
        
        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .myInputColor
        textfield.font?.withSize(15)
        textfield.font = UIFont(name: "quicksand", size: 15)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textfield
        
        
        
    }()
    
    private let directionInput: UITextField = {
        
        
        let textfield = UITextField()
        
        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .myInputColor
        textfield.font?.withSize(15)
        textfield.font = UIFont(name: "quicksand", size: 15)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textfield
        
        
        
    }()
    
    private let skipInput: UITextField = {
        
        
        let textfield = UITextField()
        
        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .myInputColor
        textfield.font?.withSize(15)
        textfield.font = UIFont(name: "quicksand", size: 15)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textfield
        
        
        
    }()
    
    private let goalNumberInput: UITextField = {
        
        
        let textfield = UITextField()
        
        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .myInputColor
        textfield.font?.withSize(15)
        textfield.font = UIFont(name: "quicksand", size: 15)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textfield
        
        
        
    }()
    
    // GROUPS
    private let inputView1: UIView = {
        
        let uiView = UIView()
              
        return uiView
    }()
    
    private let inputView2: UIView = {
        
        let uiView = UIView()
              
        return uiView
    }()
    
    private let inputView3: UIView = {
        
        let uiView = UIView()
              
        return uiView
    }()
    
    private let inputView4: UIView = {
        
        let uiView = UIView()
              
        return uiView
    }()
    
    
    //emptyViews
    
    private let paddingView1: UIView = {
       
        let uiView = UIView()
        
        uiView.backgroundColor = .myInputColor
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    
    private let paddingView2: UIView = {
       
        let uiView = UIView()
        
        uiView.backgroundColor = .myInputColor
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    private let paddingView3: UIView = {
       
        let uiView = UIView()
        
        uiView.backgroundColor = .myInputColor
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    private let paddingView4: UIView = {
       
        let uiView = UIView()
        
        uiView.backgroundColor = .myInputColor
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playersInput.resignFirstResponder()
        directionInput.resignFirstResponder()
        skipInput.resignFirstResponder()
        goalNumberInput.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification){
        
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        print("visina je \(view.heightAnchor)")
        if notification.name == UIResponder.keyboardWillShowNotification
             {
//            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -keyboardRect.height).isActive = true
           
        }
        else{
            //zasto ovo ne radi?
//            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
//
//            print("visina tipkovnice \(keyboardRect.height)")
            
        }
        
        
    }
    
    private func setupUI(){
        
        title = "Igra izgovaranja brojeva"
        view.backgroundColor = .white
        
        inputView1.addSubview(paddingView1)
        inputView1.addSubview(playersLabel)
        inputView1.addSubview(playersInput)
        
        inputView2.addSubview(paddingView2)
        inputView2.addSubview(directionLabel)
        inputView2.addSubview(directionInput)
        
        inputView3.addSubview(paddingView3)
        inputView3.addSubview(skipLabel)
        inputView3.addSubview(skipInput)
        
        inputView4.addSubview(paddingView4)
        inputView4.addSubview(goalNumberLabel)
        inputView4.addSubview(goalNumberInput)
        
        
        view.addSubviews([inputView1, inputView2, inputView3, inputView4, button, noteLabel])
        
        
        
        playersInput.delegate = self
        directionInput.delegate = self
        skipInput.delegate = self
        goalNumberInput.delegate = self
        
        
        
        
        setupConstraints()
        setAction()
        
    }
    
    private func setAction(){

        button.addTarget(self, action: #selector(btnCheck), for: .touchUpInside)

    }
    
    
    @objc private func btnCheck(){
        
        var players: String = ""
        var direction: String = ""
        var skip: String = ""
        var goal: String = ""
        
        if let plyrs = playersInput.text{
            players = plyrs
        }
        
        if let drct = directionInput.text{
            direction = drct
        }
        
        if let skp = skipInput.text{
            skip = skp
        }
        
        if let gl = goalNumberInput.text{
            goal = gl
        }
        
        if validateInputs(input1: players, input2: direction, input3: skip, input4: goal){
            let secondVC = SecondViewController(plyNo: Int(players)!, dirChngNo: Int(direction)!, skipNo: Int(skip)!, goalNo: Int(goal)!)
            
            self.present(secondVC, animated: true, completion: nil)
        }
        else{
            
            let alert = UIAlertController(title: "Pogrešan unos", message: "Svi unosi moraju biti brojevi", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Pokušaj ponovo", style: .destructive))
            present(alert, animated: true)
            
        }
        



    }
    
    func validateInputs(input1: String, input2: String, input3: String, input4: String) -> Bool{
        
        if input1.isNumeric && input2.isNumeric && input3.isNumeric && input4.isNumeric{
            return true
        }
        else {
            return false
        }
        
        
    }
    
   
    
    
    
    private func setupConstraints(){
        
        let safeZone = view.layoutMarginsGuide
        let paddingConstant: CGFloat = 11
        
        
        NSLayoutConstraint.activate([
            
            // first label, input, padding and container
            
            inputView1.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 35),
            inputView1.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 15),
            inputView1.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -15),
            inputView1.heightAnchor.constraint(equalToConstant: 64),
            
            paddingView1.leadingAnchor.constraint(equalTo: inputView1.leadingAnchor),
            paddingView1.bottomAnchor.constraint(equalTo: inputView1.bottomAnchor),
            paddingView1.topAnchor.constraint(equalTo: playersLabel.bottomAnchor),
            paddingView1.widthAnchor.constraint(equalToConstant: paddingConstant),
            
            playersLabel.topAnchor.constraint(equalTo: inputView1.topAnchor),
            playersLabel.leadingAnchor.constraint(equalTo: inputView1.leadingAnchor, constant: 11),
            playersLabel.bottomAnchor.constraint(equalTo: inputView1.bottomAnchor, constant: -45),
            playersLabel.trailingAnchor.constraint(equalTo: inputView1.trailingAnchor, constant: -10),
            
            playersInput.topAnchor.constraint(equalTo: playersLabel.bottomAnchor),
            playersInput.leadingAnchor.constraint(equalTo: paddingView1.trailingAnchor),
            playersInput.trailingAnchor.constraint(equalTo: inputView1.trailingAnchor),
            playersInput.bottomAnchor.constraint(equalTo: inputView1.bottomAnchor),
            
            
            // second label, input, padding and container
            
            inputView2.topAnchor.constraint(equalTo: inputView1.bottomAnchor, constant: 25),
            inputView2.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 15),
            inputView2.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -15),
            inputView2.heightAnchor.constraint(equalToConstant: 64),
            
            paddingView2.leadingAnchor.constraint(equalTo: inputView2.leadingAnchor),
            paddingView2.bottomAnchor.constraint(equalTo: inputView2.bottomAnchor),
            paddingView2.topAnchor.constraint(equalTo: directionLabel.bottomAnchor),
            paddingView2.widthAnchor.constraint(equalToConstant: paddingConstant),
            
            directionLabel.topAnchor.constraint(equalTo: inputView2.topAnchor),
            directionLabel.leadingAnchor.constraint(equalTo: inputView2.leadingAnchor, constant: 11),
            directionLabel.bottomAnchor.constraint(equalTo: inputView2.bottomAnchor, constant: -45),
            directionLabel.trailingAnchor.constraint(equalTo: inputView2.trailingAnchor, constant: -10),
            
            directionInput.topAnchor.constraint(equalTo: directionLabel.bottomAnchor),
            directionInput.leadingAnchor.constraint(equalTo: paddingView2.trailingAnchor),
            directionInput.trailingAnchor.constraint(equalTo: inputView2.trailingAnchor),
            directionInput.bottomAnchor.constraint(equalTo: inputView2.bottomAnchor),
            
            
            
            
            // third label, input, padding and container
            
            inputView3.topAnchor.constraint(equalTo: inputView2.bottomAnchor, constant: 25),
            inputView3.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 15),
            inputView3.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -15),
            inputView3.heightAnchor.constraint(equalToConstant: 64),
            
            paddingView3.leadingAnchor.constraint(equalTo: inputView3.leadingAnchor),
            paddingView3.bottomAnchor.constraint(equalTo: inputView3.bottomAnchor),
            paddingView3.topAnchor.constraint(equalTo: skipLabel.bottomAnchor),
            paddingView3.widthAnchor.constraint(equalToConstant: paddingConstant),
            
            skipLabel.topAnchor.constraint(equalTo: inputView3.topAnchor),
            skipLabel.leadingAnchor.constraint(equalTo: inputView3.leadingAnchor, constant: 11),
            skipLabel.bottomAnchor.constraint(equalTo: inputView3.bottomAnchor, constant: -45),
            skipLabel.trailingAnchor.constraint(equalTo: inputView3.trailingAnchor, constant: -10),
            
            skipInput.topAnchor.constraint(equalTo: skipLabel.bottomAnchor),
            skipInput.leadingAnchor.constraint(equalTo: paddingView3.trailingAnchor),
            skipInput.trailingAnchor.constraint(equalTo: inputView3.trailingAnchor),
            skipInput.bottomAnchor.constraint(equalTo: inputView3.bottomAnchor),
            
            
            //note label
            
            noteLabel.topAnchor.constraint(equalTo: inputView3.bottomAnchor, constant: 15),
            noteLabel.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 26),
            noteLabel.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -25),
            noteLabel.heightAnchor.constraint(equalToConstant: 26),
            
            
            
            // fourth label, input, padding and container
            
            inputView4.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 5),
            inputView4.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 15),
            inputView4.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -15),
            inputView4.heightAnchor.constraint(equalToConstant: 64),
            
            paddingView4.leadingAnchor.constraint(equalTo: inputView4.leadingAnchor),
            paddingView4.bottomAnchor.constraint(equalTo: inputView4.bottomAnchor),
            paddingView4.topAnchor.constraint(equalTo: goalNumberLabel.bottomAnchor),
            paddingView4.widthAnchor.constraint(equalToConstant: paddingConstant),
            
            goalNumberLabel.topAnchor.constraint(equalTo: inputView4.topAnchor),
            goalNumberLabel.leadingAnchor.constraint(equalTo: inputView4.leadingAnchor, constant: 11),
            goalNumberLabel.bottomAnchor.constraint(equalTo: inputView4.bottomAnchor, constant: -45),
            goalNumberLabel.trailingAnchor.constraint(equalTo: inputView4.trailingAnchor, constant: -10),
            
            goalNumberInput.topAnchor.constraint(equalTo: goalNumberLabel.bottomAnchor),
            goalNumberInput.leadingAnchor.constraint(equalTo: paddingView4.trailingAnchor),
            goalNumberInput.trailingAnchor.constraint(equalTo: inputView4.trailingAnchor),
            goalNumberInput.bottomAnchor.constraint(equalTo: inputView4.bottomAnchor),
            
            
            
            
            
            
            
            
            
            
            
            button.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 45)
            
            
            
        ])
        
    }
    
}


//EXTENSIONS

extension UIView {
    
    
    
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension FirstViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
        
    }
    
    
}

extension UIColor {
    static let myOrange = #colorLiteral(red: 0.8745098039, green: 0.568627451, blue: 0.2862745098, alpha: 1)
    static let myInputColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
}


extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}


