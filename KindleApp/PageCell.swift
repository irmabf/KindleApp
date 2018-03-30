//
//  PageCell.swift
//  KindleApp
//
//  Created by Irma Blanco on 29/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

final class PageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE SOME TEXT FOR OUR LABE"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        //textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textLabel.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        textLabel.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textLabel.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
