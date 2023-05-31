//
//  FirstViewController.swift
//  WebView-Test
//
//  Created by 김민 on 2023/05/31.
//

import UIKit

import SnapKit
import Then

final class FirstViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let naverButton = UIButton().then {
        $0.setTitle("네이버로 이동해 보쟈", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setAddTarget()
    }
}

extension FirstViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(naverButton)
        
        naverButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        naverButton.addTarget(self, action: #selector(naverButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - @objc Methods
    
    @objc private func naverButtonDidTap() {
        let vc = UINavigationController(rootViewController: WebViewController())
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
