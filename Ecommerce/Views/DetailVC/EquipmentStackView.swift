//
//  EquipmentStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class EquipmentStackView: UIStackView {
    
    var buttonsStackView = ButtonsStackView()
    var capacitySegmentedControl = HBSegmentedControl()
    
    private var equipmentStackView = UIStackView()
    
    var viewModel: DetailViewModel!
    
    init(viewModel: DetailViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - @IBActions
extension EquipmentStackView {
    @objc private func handleColorTap(sender: UIButton) {
        let colorButtonsArray = [buttonsStackView.firstColorButton, buttonsStackView.secondColorButton]
        viewModel.handleColorTap(sender: sender, buttons: colorButtonsArray)
    }
}

// MARK: - Setup Views
extension EquipmentStackView {
    private func setupViews() {
        buttonsStackView.firstColorButton.addTarget(self, action: #selector(handleColorTap), for: .touchUpInside)
        buttonsStackView.secondColorButton.addTarget(self, action: #selector(handleColorTap), for: .touchUpInside)
        
        equipmentStackView = UIStackView(arrangedSubviews: [buttonsStackView,
                                                            capacitySegmentedControl],
                                         axis: .horizontal,
                                         spacing: 58,
                                         distribution: .equalSpacing,
                                         alignment: .center)
        
        addArrangedSubview(equipmentStackView)
    }
}

// MARK: - Setup Constraints
extension EquipmentStackView {
    private func setupConstraints() {
        capacitySegmentedControl.snp.makeConstraints { make in
            make.width.equalTo(142)
            make.height.equalTo(30)
        }
    }
}
