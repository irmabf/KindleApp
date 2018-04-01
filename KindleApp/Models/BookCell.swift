//
//  BookCell.swift
//  KindleApp
//
//  Created by Irma Blanco on 21/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

final class BookCell: UITableViewCell {
    
    var book: Book? {
        didSet {
            titleLabel.text = book?.title
            authorLabel.text = book?.author
            //print(book?.coverImageUrl)

            guard let coverImageUrl = book?.coverImageUrl else { return }
            guard let url = URL(string: coverImageUrl) else  { return }

            coverImageView.image = nil

            URLSession.shared.dataTask(with: url) { (data,response,error)
                in

                if let err = error {
                    print("Failed to retrieve our book cover image: ", err)
                    return
                }
                guard let imageData = data else { return }
                let image = UIImage(data: imageData)
                //Remember we have to go back to the maginQueue before we load the json content

                DispatchQueue.main.async{
                    self.coverImageView.image = image
                }


            }.resume()
        }
    }
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of our cell"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "This is some author for the book that we have in this row"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        addSubview(coverImageView)
        
    
        coverImageView.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        coverImageView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    
        
        addSubview(titleLabel)
        
        titleLabel.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: coverImageView.safeAreaLayoutGuide.rightAnchor, constant: 8).isActive = true
        titleLabel.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
     
        
        addSubview(authorLabel)
        authorLabel.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 4).isActive = true
        authorLabel.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: coverImageView.safeAreaLayoutGuide.rightAnchor, constant: 8).isActive = true
        authorLabel.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
