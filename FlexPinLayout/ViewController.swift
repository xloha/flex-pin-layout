//
//  ViewController.swift
//  FlexPinLayout
//
//  Created by  EUNYEONG on 2022/02/02.
//

import UIKit
import FlexLayout
import PinLayout

class ViewController: UIViewController {
    
    private let rootContainer: UIView = UIView()
    
    private let accountContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "23,018,300원"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let accountButtonContainer: UIView = UIView()
    
    private let leftAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("조회", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemGray4
        return button
    }()
    
    private let rightAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("이체", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemGray4
        return button
    }()
    
    private let yellowCard: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenCard: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let brownCard: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.rootContainer.pin.all(self.view.pin.safeArea)
        self.rootContainer.flex.layout(mode: .adjustHeight)
    }
    
    func setupViews() {
        self.view.addSubview(rootContainer)
            
        rootContainer.flex.padding(20).define { flex in
            flex.addItem(accountContainer)
        }
        
        accountContainer.flex.define { flex in
            flex.addItem(balanceLabel).height(200)
            flex.addItem(accountButtonContainer).height(50)
        }
        
        accountButtonContainer.flex
            .direction(.row)
            .define { flex in
                flex.addItem(leftAccountButton).width(50%).marginRight(1)
                flex.addItem(rightAccountButton).width(50%).marginLeft(1)
        }
        
        
        self.view.addSubview(yellowCard)
        self.view.addSubview(greenCard)
        self.view.addSubview(brownCard)
        
        yellowCard.pin.below(of: rootContainer).size(100)
        greenCard.pin.after(of: yellowCard).size(100)
        brownCard.pin.below(of: yellowCard, aligned: .end).size(100)
        
    }
}


