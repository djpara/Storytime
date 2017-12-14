//
//  CustomNavigationBar.swift
//  Storytime
//
//  Created by David Para on 12/12/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {
    
    // Storyboard initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureAppearance()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: TITLE_FONT, NSAttributedStringKey.foregroundColor: WHITE]
    }
}
