//
//  RatingControl.swift
//  FoodTracker
//
//  Created by sebastian vasquez on 10/19/18.
//  Copyright © 2018 sebastian vasquez. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: Properties
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int   = 5 {
        didSet {
            setupButtons()
        }
    }
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    // MARK: Button action
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button \(button) is not in the array")
        }
        
        let selectedRating  = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Private methods
    private func setupButtons(){
    
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "higlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.selected, .highlighted])
            button.backgroundColor = UIColor.red
            button.translatesAutoresizingMaskIntoConstraints = true
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive  = true
            button.addTarget(self,
                             action: #selector(RatingControl.ratingButtonTapped(button:)),
                             for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
}
