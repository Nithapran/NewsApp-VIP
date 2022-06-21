//
//  SelectedFiltersView.swift
//  NetworkLayer
//
//  Created by Nithaparan Francis on 2022-06-12.
//

import Foundation
import UIKit

class SelectedFiltersView: UIView {
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var countryLabelContainerView: UIView!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    let nibName = "SelectedFiltersView"
    
    var didClickClearButton: (() -> Void)?
    
    var selectedCountry: Countries? {
        didSet {
            self.countryLabel.text = selectedCountry?.rawValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpView()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func didClickClearButton(_ sender: Any) {
        self.didClickClearButton?()
    }
    
    func setUpView() {
        clearButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
            
        self.countryLabelContainerView.layer.cornerRadius = 15
    }
}
