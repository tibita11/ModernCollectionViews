//
//  TextCell.swift
//  ModernCollectionViews
//
//  Created by 鈴木楓香 on 2023/10/21.
//

import UIKit
import PinLayout

class TextCell: UICollectionViewCell {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TextCell {
    func configure() {
        contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.pin.all(10)
    }
}
