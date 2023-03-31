//
//  Display.swift
//  CalculatorApp
//
//  Created by Kübra Demirkaya on 30.03.2023.
//

import UIKit

class Display: UIView {

    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        
        //Display ekranı için imageView oluşturulup, assets klasöründeki display ekranı görüntüsü imageView'a atanıyor
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "display")
        //imageView constraintleri belirleniyor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        self.addConstraints([
            NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
            ])
        self.layoutIfNeeded()
    }
    
    

}
