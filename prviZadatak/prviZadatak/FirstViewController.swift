//
//  FirstViewController.swift
//  prviZadatak
//
//  Created by Nikola Barbaric on 07.06.2021..
//

import UIKit


class FirstViewController: UIViewController{
    
    
    private let button: UIButton = {
        
        
        let button = UIButton()
        
        button.setTitle("Provjeri", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.4, blue: 0.5098039216, alpha: 1)
        
        return button
    }()
    
    
    
    private let inputText: UITextField = {
        
        
        let textfield = UITextField()
        
        textfield.placeholder  = "Upiši palindrom"
        textfield.backgroundColor = .white
        
        return textfield
        
        
        
    }()
    
    private let lineView: UIView = {
        
        let lineView = UIView()
        
        lineView.backgroundColor = .black
        
        return lineView
        
        
        
    }()
    
    private let inputView1: UIView = {
        
        let uiView = UIView()
        
        return uiView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputText.resignFirstResponder()
    }
    
    private func setupUI(){
        
        title = "Palindrom"
        view.backgroundColor = .white
        
        inputView1.addSubview(inputText)
        inputView1.addSubview(lineView)
        
        view.addSubviews([inputView1, button])
        
        inputView1.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        inputText.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        inputText.delegate = self
        
        setupConstraints()
        setAction()
        
    }
    
    private func setAction(){
        
        button.addTarget(self, action: #selector(btnCheck), for: .touchUpInside)
        
    }
    
    
    @objc private func btnCheck(){
        
        if let text = inputText.text {
            
            var title: String = ""
            var message1: String = ""
            var message2: String = ""
            var btnText: String = ""
            var appendColor = UIColor()
            var appendStyle = UIFont.systemFont(ofSize: 15)
            let charset = CharacterSet(charactersIn: "abcčćdžđefghijklmnoprsštuvzžxy ")
            
            
            if text.lowercased().rangeOfCharacter(from: charset.inverted) == nil && !text.isEmpty{
                
                
                if checkPalindrome(test: text) {
                    
                    title = "Točno"
                    message1 = "Unesena riječ je palindrom"
                    message2 = "\nZnate li još koji palindrom?"
                    btnText = "Upiši drugi palindrom"
                    appendColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                    
                }
                else{
                    
                    title = "Netočno"
                    message1 = "Riječ koju ste upisali nije palindrom!"
                    message2 = "\nPokušajte s drugom riječi."
                    btnText = "Pokušaj ponovo"
                    appendColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                }
            }
            else{
                
                title = "Netočno"
                message1 = "Unos nije riječ! Pokušajte unijeti pravu "
                message2 = "riječ koja je ujedno i palindrom."
                btnText = "Pokušaj ponovo"
                appendColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                appendStyle = UIFont.boldSystemFont(ofSize: 15)
                
            }
            
            
            
            let attributedString = NSMutableAttributedString(string:message1)
            let colorAttribute = [NSAttributedString.Key.foregroundColor: appendColor, NSAttributedString.Key.font : appendStyle]
            let secondtextString = NSMutableAttributedString(string: message2, attributes: colorAttribute)
            
            attributedString.append(secondtextString)
            
            
            
            
            
            let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
            
            alert.setValue(attributedString, forKey: "attributedMessage")
            
            alert.addAction(UIAlertAction(title: btnText, style: .cancel, handler: {action in
                
            }))
            
            present(alert, animated: true)
            
            
            
            
            
            
            
        } else {
            print("NIL")
        }
        
        
        
    }
    
    
    
    private func checkPalindrome(test: String) -> Bool{
        
        let input = test.lowercased().replacingOccurrences(of: " ", with: "")
        let middle = input.count / 2
        
        for i in 0..<middle {
            
            let left = input.index(input.startIndex, offsetBy: i)
            let right = input.index(input.index(before: input.endIndex), offsetBy: -i)
            
            if input[left] != input[right]{
                print("Nije palindrom")
                return false
            }
            
        }
        
        print("Palindrom je")
        return true
        
        
    }
    
    private func setupConstraints(){
        
        let safeZone = view.layoutMarginsGuide
        
        
        
        NSLayoutConstraint.activate([
            
            inputView1.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 143),
            inputView1.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 8),
            inputView1.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -8),
            inputView1.heightAnchor.constraint(equalToConstant: 44),
            
            inputText.topAnchor.constraint(equalTo: inputView1.topAnchor, constant: 12),
            inputText.leadingAnchor.constraint(equalTo: inputView1.leadingAnchor, constant: 12),
            inputText.bottomAnchor.constraint(equalTo: inputView1.bottomAnchor, constant: -11),
            inputText.trailingAnchor.constraint(equalTo: inputView1.trailingAnchor),
            
            lineView.leadingAnchor.constraint(equalTo: inputView1.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: inputView1.trailingAnchor, constant: 0),
            lineView.bottomAnchor.constraint(equalTo: inputView1.bottomAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            
            button.topAnchor.constraint(equalTo: inputView1.bottomAnchor, constant: 54.5),
            button.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor, constant: 55),
            button.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor, constant: -55),
            button.heightAnchor.constraint(equalToConstant: 45)
            
            
            
        ])
        
    }
    
}


extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
}

extension FirstViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
        
    }
    
    
}
