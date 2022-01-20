//
//  ViewController.swift
//  Bsocial Project
//
//["RubikRoman-Regular", "Rubik-Light", "RubikRoman-Medium", "RubikRoman-SemiBold", "RubikRoman-Bold", "RubikRoman-ExtraBold", "RubikRoman-Black"]
//  Created by Rachit Prajapati on 20/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var postViewModel = PostViewModel()
    
    private let backgroundMediaView: LazyImageView = {
        let backgroundMediaView = LazyImageView()
        return backgroundMediaView
    }()
    
    private let profilePictureView: LazyImageView = {
        let profilePictureView = LazyImageView()
        profilePictureView.clipsToBounds = true
        profilePictureView.contentMode = .scaleAspectFill
        profilePictureView.layer.borderColor = UIColor.white.cgColor
        profilePictureView.backgroundColor = .lightGray
        profilePictureView.layer.borderWidth = 2
        profilePictureView.setDimensions(width: 45, height: 45)
        profilePictureView.layer.cornerRadius = 45 / 2
        profilePictureView.layer.opacity = 0.0
        return profilePictureView
    }()
    
    private let circleIcon: UIImageView = {
        let circleIcon = UIImageView()
        circleIcon.layer.opacity = 0.0
        circleIcon.image = UIImage(named: "CircleIcon")
        circleIcon.setDimensions(width: 16.4, height: 16.4)
        return circleIcon
    }()
    
    private let creditLabel: UILabel = {
        let creditLabel = UILabel()
        creditLabel.font = UIFont(name: "Rubik-Regular", size: 13)
        creditLabel.textColor = .white
        return creditLabel
    }()

    private let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = ""
        usernameLabel.font = UIFont(name: "RubikRoman-SemiBold", size: 14)
        usernameLabel.textColor = .white
        return usernameLabel
    }()

    private lazy var usernameContainerView: UIStackView = {
        
        let backgroundView  = UIView.createContainerView(height: 27, width: 107, cornerRadius: 12)
        
        let containerView = UIStackView(arrangedSubviews: [backgroundView, usernameLabel])
        containerView.axis = .vertical
        containerView.alignment = .center
        containerView.spacing = -22
        containerView.layer.opacity = 0
        return containerView
    }()
    
    private let challengeLabel: UILabel = {
        let challengeLabel = UILabel()
        challengeLabel.font = UIFont(name: "RubikRoman-Bold", size: 12)
        challengeLabel.textColor = .white
        return challengeLabel
    }()
    
    private lazy var hashtagContainerView: UIStackView = {
        
        let backgroundView = UIView.createContainerView(height: 34, width: 169, cornerRadius: 17)

        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "icon")!
        iconImageView.setDimensions(width: 24.9, height: 24.9)
    
        
        let galleryImageView = UIImageView()
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.image = UIImage(named: "gallery")!
        galleryImageView.setDimensions(width: 21.9, height: 18.9)
    
      
        
        let hashtagContainerStackView = UIStackView(arrangedSubviews: [challengeLabel, iconImageView, galleryImageView])
        hashtagContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        hashtagContainerStackView.spacing = 5
        hashtagContainerStackView.axis = .horizontal
        hashtagContainerStackView.alignment = .center
        
        let containerView = UIStackView(arrangedSubviews: [backgroundView, hashtagContainerStackView])
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.axis = .vertical
        containerView.alignment = .center
        containerView.spacing = -30
        containerView.layer.opacity = 0
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchPostData()
    }

    func fetchPostData() {
        postViewModel.fetch { postResponse in
            guard let postData = postResponse else {
                return
            }
            
            DispatchQueue.main.async { [self] in
                if let username = postData.username {
                    debugPrint(username)
                    creditLabel.text = "Original Gif by @\(username)"
                    circleIcon.layer.opacity = 1.0
                    let mentionString = NSMutableAttributedString(string: "@", attributes: [.foregroundColor: UIColor(red: 255/255, green: 206/255, blue: 0/255, alpha: 1.0), .font: UIFont(name: "RubikRoman-SemiBold", size: 11)!])
                    mentionString.append(NSAttributedString(string: username, attributes: [.foregroundColor: UIColor.white, .font: UIFont(name: "RubikRoman-SemiBold", size: 11)!]))
                    print("DBG: \(mentionString)")
                    usernameLabel.attributedText = mentionString
                    usernameContainerView.layer.opacity = 1.0
                }
                
                
                if let challenge = postData.hashtagChallenge {
                    challengeLabel.text = "#\(challenge)"
                    hashtagContainerView.layer.opacity = 1.0
                }
                
                if let media = postData.mediaImageURL {
                    backgroundMediaView.loadImage(str: media, placeholderImage: UIImage(named: "placeholder")!)
                }
                
                if let profilePicture = postData.profilePictureURLString {
                    profilePictureView.loadImage(str: profilePicture, placeholderImage: UIImage(named: "placeholder")!)
                    profilePictureView.layer.opacity = 1.0
                }
            }
            
        }
    }
    
    
    private func setupUI() {
        
        view.addSubview(backgroundMediaView)
        backgroundMediaView.frame = view.frame
        backgroundMediaView.backgroundColor = .lightGray
      
        let creatorDetailsStackView = UIStackView(arrangedSubviews: [circleIcon, creditLabel])
        creatorDetailsStackView.axis = .horizontal
        creatorDetailsStackView.alignment = .center
        creatorDetailsStackView.spacing = 5.6
        view.addSubview(creatorDetailsStackView)
        creatorDetailsStackView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 13, paddingBottom: 50.7)
       
        view.addSubview(usernameContainerView)
        usernameContainerView.anchor(left: view.leftAnchor, bottom: creatorDetailsStackView.topAnchor, paddingLeft: 13, paddingBottom:12.7)
       
        view.addSubview(hashtagContainerView)
        hashtagContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hashtagContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 51).isActive = true
        
        view.addSubview(profilePictureView)
        profilePictureView.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 52.3, paddingRight: 13)
        
        
    }

}

