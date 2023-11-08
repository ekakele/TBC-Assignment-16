//
//  LoginViewController.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit

final class LoginViewController: UIViewController {
    //     MARK: - Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginBackground")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 55, bottom: 35, right: 55)
        return stackView
    }()
    
    private let avatarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.layer.cornerRadius = 70
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "userAvatar")
        return imageView
    }()
    
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "You've got notes?"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private let userInputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.50, green: 0.33, blue: 0.22, alpha: 0.7)]
        )
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 2
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 290).isActive = true
        textField.layer.borderColor = UIColor(red: 0.89, green: 0.39, blue: 0.08, alpha: 0.8).cgColor
        textField.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.41, alpha: 0.5)
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.50, green: 0.33, blue: 0.22, alpha: 0.7)]
        )
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 2
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 290).isActive = true
        textField.layer.borderColor = UIColor(red: 0.89, green: 0.39, blue: 0.08, alpha: 0.8).cgColor
        textField.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.41, alpha: 0.5)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 0.61, green: 0.40, blue: 0.27, alpha: 1.00)
        return button
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupSubviews()
        setupConstraints()
        setupLoginButtonAction()
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.94, blue: 0.88, alpha: 1.00)
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(avatarStackView)
        mainStackView.addArrangedSubview(userInputStackView)
        
        userInputStackView.addArrangedSubview(loginTextField)
        userInputStackView.addArrangedSubview(passwordTextField)
        userInputStackView.addArrangedSubview(logInButton)
        
        avatarStackView.addArrangedSubview(avatarImageView)
        avatarStackView.addArrangedSubview(logInLabel)
    }
    
    private func setupConstraints() {
        setupBackgroundImageConstraints()
        setupMainStackViewConstraints()
        customizeStackViewSpacing()
    }
    
    private func setupBackgroundImageConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 190),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            logInButton.leadingAnchor.constraint(equalTo: userInputStackView.leadingAnchor, constant: 60),
            logInButton.trailingAnchor.constraint(equalTo: userInputStackView.trailingAnchor, constant: -60)
        ])
    }
    
    private func customizeStackViewSpacing() {
        userInputStackView.setCustomSpacing(50, after: passwordTextField)
    }
    
    private func setupLoginButtonAction() {
        logInButton.addTarget(self, action: #selector(navigateToNoteListVC), for: .touchUpInside)
    }
    
    @objc private func navigateToNoteListVC() {
        let userName = loginTextField.text!
        let password = passwordTextField.text!
        let navigateToNoteListVC = NoteListViewController()
        
        if userName.isEmpty || password.isEmpty {
            validateUserInput()
        } else if !UserDefaultsHandler.isLoggedIn() {
            KeyChainHandler.save(service: "MyNotes", account: userName, data: password)
            UserDefaultsHandler.setLoggedIn(true)
            navigationController?.pushViewController(navigateToNoteListVC, animated: true)
            resetUserInputValidation()
            
            
            
            let alert = UIAlertController(title: "Alert", message: "Welcome to your noting journey, \(userName)!", preferredStyle: .alert)
            let dismissButton = UIAlertAction(title: "Dismiss", style: .default)
            alert.addAction(dismissButton)
            self.present(alert, animated: true)
        } else {
            if let savedPassword = KeyChainHandler.get(service: "MyNotes", account: userName), savedPassword == password {
                navigationController?.pushViewController(navigateToNoteListVC, animated: true)
                resetUserInputValidation()
            } else {
                validateUserInput()
            }
        }
    }
    
    private func validateUserInput() {
        loginTextField.layer.borderColor = UIColor(red: 0.94, green: 0.14, blue: 0.24, alpha: 1.00).cgColor
        loginTextField.backgroundColor = UIColor(red: 0.94, green: 0.14, blue: 0.24, alpha: 0.2)
        
        passwordTextField.layer.borderColor = UIColor(red: 0.94, green: 0.14, blue: 0.24, alpha: 1.00).cgColor
        passwordTextField.backgroundColor = UIColor(red: 0.94, green: 0.14, blue: 0.24, alpha: 0.2)
    }
    
    private func resetUserInputValidation() {
        loginTextField.layer.borderColor = UIColor(red: 0.89, green: 0.39, blue: 0.08, alpha: 0.8).cgColor
        loginTextField.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.41, alpha: 0.5)
        
        passwordTextField.layer.borderColor = UIColor(red: 0.89, green: 0.39, blue: 0.08, alpha: 0.8).cgColor
        passwordTextField.backgroundColor = UIColor(red: 1.00, green: 0.75, blue: 0.41, alpha: 0.5)
    }
}





