//
//  GFTextField.swift
//  testapp
//
//  Created by Avaz on 22/09/24.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        // for default config set this one
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label // white on dark mode, black on light mode
        tintColor = .label // white on dark mode, black on light mode
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        // if the text if too long it will small that
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        placeholder = "Enter user name"
        returnKeyType = .go
//        keyboardType = .emailAddress
        
    }
    
}
