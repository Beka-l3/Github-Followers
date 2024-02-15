//
//  FollowerView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 15.02.2024.
//

import SwiftUI

struct FollowerView: View {
    
    var follower: Follower
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(.avatarPlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .clipShape(.circle)
            
            Text(follower.login)
                .bold()
                .lineLimit(Constants.textLineLimit)
                .minimumScaleFactor(Constants.scaleFactor)
            
        }
    }
}


extension FollowerView {
    
    enum Constants {
        static let textLineLimit:               Int         = 1
        static let scaleFactor:                 CGFloat     = 0.6
    }
}


//#Preview { FollowerView() }
