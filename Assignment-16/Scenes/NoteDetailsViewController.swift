//
//  NoteDetailsViewController.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit

// MARK: - protocol
protocol updateNoteDelegate: AnyObject {
    func updateNote(with item: Note)
}

final class NoteDetailsViewController: UIViewController {
    // MARK: - Properties
    var note: Note?
    
    private lazy var noteDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noteTileLabel, noteContentTextView, noteDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let noteTileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let noteDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 0.61, green: 0.40, blue: 0.27, alpha: 1.00)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let noteContentTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.textColor = .darkGray
        textView.textAlignment = .left
        return textView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Changes", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    weak var delegate: updateNoteDelegate?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        setupBackground()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Configure
    func configureViews() {
        guard let note else { return }
        noteTileLabel.text = note.title
        noteContentTextView.text = note.content
        noteDateLabel.text = note.date
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.93, alpha: 1.00)
    }
    
    private func setupSubviews() {
        view.addSubview(noteDetailsStackView)
        
        noteDetailsStackView.addArrangedSubview(noteTileLabel)
        noteDetailsStackView.addArrangedSubview(noteDateLabel)
        noteDetailsStackView.addArrangedSubview(noteContentTextView)
        noteDetailsStackView.addArrangedSubview(saveButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            noteDetailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteDetailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            noteDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            noteDetailsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            noteTileLabel.topAnchor.constraint(equalTo: noteDetailsStackView.topAnchor),
            noteTileLabel.leadingAnchor.constraint(equalTo: noteDetailsStackView.leadingAnchor),
            noteTileLabel.trailingAnchor.constraint(equalTo: noteDetailsStackView.trailingAnchor),
            
            noteContentTextView.leadingAnchor.constraint(equalTo: noteDetailsStackView.leadingAnchor),
            noteContentTextView.trailingAnchor.constraint(equalTo: noteDetailsStackView.trailingAnchor)
        ])
    }
}

