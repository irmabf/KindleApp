//
//  Book.swift
//  KindleApp
//
//  Created by Irma Blanco on 21/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

final class Book {
    let title: String
    let author: String
    let pages: [Page]
    let coverImageUrl: String

    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""

        var bookPages = [Page]()

        if let pagesDictionaries = dictionary["pages"] as? [[String: Any]] {
            for pageDictionary in pagesDictionaries {
                if let pageText = pageDictionary["text"] as? String {
                    let page = Page(number: 1, text: pageText)
                    bookPages.append(page)
                }
            }
        }

        pages = bookPages
    }
}