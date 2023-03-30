//
//  MainViewController.swift
//  CalculatorApp
//
//  Created by Kübra Demirkaya on 30.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //Main bundle'daki Storyboarda ulaşmak için (info.plist:Main);
    let storyBoard = UIStoryboard(name: "Main", bundle: .main)
    
    //CalculatorViewController MainViewController'a child olarak eklenecek, o yüzden MainViewController içerisinde bu şekilde CalculatorViewController'a erişiliyor
    var calculatorViewController : CalculatorViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCalculatorViewControllerAsChildViewController()
    }
    
    //Tasarımın iPad landscape orientation'da düzgün gözükmesi için, iPad üzerinde çalıştırıldığında burada belirlenen sizeClass'ı kullanması sağlanıyor.
    override var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if UIDevice.current.orientation.isLandscape {
                return UITraitCollection(traitsFrom: [
                    UITraitCollection.init(horizontalSizeClass: .regular),
                    UITraitCollection.init(verticalSizeClass: .compact)
                ])
            }
        }
        return super.traitCollection
    }
    
    
    
    func addCalculatorViewControllerAsChildViewController() {
        
        //Storyboard içersindeki "calculatorViewController" identifierlı view controllera ulaşılıyor.
        self.calculatorViewController = self.storyBoard.instantiateViewController(withIdentifier: "calculatorViewController") as! CalculatorViewController
        
        //MainViewController'a CalculatorViewController child olarak tanımlanıyor (Burada controller'ın kendisi child olarak ekleniyor, view'ı daha sonra eklenecek.)
        self.addChild(self.calculatorViewController)
        
        //Daha önce ayarlanılan constraintler, viewlar child olarak bağlandığında otomatik eklenecek (hizalama ve boyut constraint)
        self.calculatorViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        //Viewlar bağlanıyor, 1: ilk eklenen view
        self.view.insertSubview(self.calculatorViewController.view, at: 1)
        
        //Constraintler ekleniyor. NSLayoutConstraint, storyboard üzerinden eklerkenki özelliklerin aynısının burada tanımlanmasını sağlıyor.
        //CalculatorViewController.view MainViewController.view'ın içine tam sığdırılması için gerekli constraintler
        self.view.addConstraints([
            NSLayoutConstraint(item: self.calculatorViewController.view, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.calculatorViewController.view, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.calculatorViewController.view, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.calculatorViewController.view, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        self.view.layoutIfNeeded()
        
    }
   
}
