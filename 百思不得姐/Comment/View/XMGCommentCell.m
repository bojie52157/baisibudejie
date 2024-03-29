//
//  XMGCommentCell.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/17.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGCommentCell.h"
#import "XMGComment.h"
#import "XMGUser.h"
#import <AVFoundation/AVFoundation.h>
@interface XMGCommentCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sexView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
@end

@implementation XMGCommentCell

- (void)awakeFromNib
{
     [super awakeFromNib];
     self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setComment:(XMGComment *)comment
{
    _comment = comment;
    
    self.usernameLabel.text = comment.user.username;
    self.contentLabel.text = comment.content;
    
    self.likeCountLabel.text = [NSString stringWithFormat:@"%zd", comment.like_count];
    [self.profileImageView setHeader:comment.user.profile_image];
    
    NSString *sexImageName = [comment.user.sex isEqualToString:XMGUserSexMale] ? @"Profile_manIcon" : @"Profile_womanIcon";
    self.sexView.image =  [UIImage imageNamed:sexImageName];
    
    if (comment.voiceuri.length) {
        self.voiceButton.hidden = NO;
        [self.voiceButton setTitle:[NSString stringWithFormat:@"%zd''", comment.voicetime] forState:UIControlStateNormal];
        [self.voiceButton addTarget:self action:@selector(startVoice) forControlEvents:UIControlEventTouchUpInside];
    } else {
        self.voiceButton.hidden = YES;
    }
}

//播放音频评论
- (void)startVoice{
    NSURL *url = [NSURL URLWithString:self.comment.voiceuri];
    AVPlayerItem *songItem = [[AVPlayerItem alloc]initWithURL:url];
    AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:songItem];
    [player play];
}
@end
