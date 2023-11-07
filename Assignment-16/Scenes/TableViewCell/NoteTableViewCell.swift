//
//  NoteTableViewCell.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {
    
    static let identifier = "NoteTableViewCell"
    
    // MARK: - Properties
    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 12
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor(red: 0.93, green: 0.77, blue: 0.70, alpha: 0.5)
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    private let noteContentPreviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let noteDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 0.47, green: 0.29, blue: 0.21, alpha: 1.00)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupBackground()
        setupCellStackView()
        setupCellStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CleanUp Content & PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        noteTitleLabel.text = nil
        noteContentPreviewLabel.text = nil
        noteDateLabel.text = nil
    }
    
    //MARK: - Configure
    func configure(with model: Note) {
        noteTitleLabel.text = model.title
        noteContentPreviewLabel.text = model.content
        noteDateLabel.text = model.date
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        self.backgroundColor = .clear
    }
    
    private func setupCellStackView() {
        addSubview(cellStackView)
        cellStackView.addArrangedSubview(noteTitleLabel)
        cellStackView.addArrangedSubview(noteContentPreviewLabel)
        cellStackView.addArrangedSubview(noteDateLabel)
    }
    
    private func setupCellStackViewConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cellStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
