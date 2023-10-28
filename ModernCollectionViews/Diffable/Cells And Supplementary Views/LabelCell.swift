//
//  LabelCell.swift
//  ModernCollectionViews
//
//  Created by 鈴木楓香 on 2023/10/28.
//

import UIKit
import PinLayout

class LabelCell: UICollectionViewCell {
    
    let label: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.pin.horizontally(5).vertically(2)
    }
}
