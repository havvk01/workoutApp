//
//  SecondaryButton.swift
//  WorkOutApp
//
//  Created by Slava Havvk on 02.10.2022.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    private var type: WAButtonType = .primary
//    private var title: String?
    
    private let lable: UILabel = {
        let lable = UILabel()
        
        lable.textAlignment = .center
        
        return lable
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type =  type
//        self.title = title
        
        setupViews()
        constaintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constaintViews()
        configureApperance()
    }
    
    func setTitle(_ title: String?) {
        lable.text = title
    }
    
}

private extension WAButton {
    func setupViews() {
        setupView(lable)
        setupView(iconView)
    }
    
    func constaintViews() {
        var horisontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            lable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
            
        ])
        
    }
    func configureApperance() {
        switch type {
        case . primary:
            lable.textColor = R.Colors.inActive
            iconView.tintColor = R.Colors.inActive
            lable.font = R.Fonts.helveticaRegular(witch: 13)
            
        case . secondary:
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            lable.textColor = R.Colors.active
            iconView.tintColor = R.Colors.active
            lable.font = R.Fonts.helveticaRegular(witch: 15)
        }
        
//        lable.text = title
        
        makeSystem(self)
    }
}