//
//  GameView.swift
//  DoisBingo
//
//  Created by Gabriel Ferreira de Carvalho on 25/01/23.
//

import UIKit
import SnapKit

class GameView: UIView {
    
    let button: UIButton = {
        let b: UIButton = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Press me!", for: .normal)
        b.setTitleColor(.systemBlue, for: .normal)
        b.setTitleColor(.systemCyan, for: .highlighted)
        return b
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
