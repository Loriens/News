//
//  PostViewController.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostViewInput: ViperViewInput {
    func updateForTextInfo(_ text: String)
}

protocol PostViewOutput: ViperViewOutput { }

class PostViewController: ViperViewController, PostViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var textLabel: UILabel!
    
    // MARK: - Props
    fileprivate var output: PostViewOutput? {
        guard let output = self._output as? PostViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.Post.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.textLabel.text = ""
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.textLabel.apply(.bigTitleStyle())
    }
    
    // MARK: - PostViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    override func beginLoading() {
        super.beginLoading()
        
        self.updateForTextInfo(AppLocalization.General.loading.localized)
    }
    
    override func finishLoading(with error: Error?) {
        super.finishLoading(with: error)
        
        self.updateForTextInfo("")
    }
    
    func updateForTextInfo(_ text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            controller.textLabel.text = text
            controller.textLabel.sizeToFit()
        }
    }
    
}

// MARK: - Actions
extension PostViewController { }

// MARK: - Module functions
extension PostViewController { }
