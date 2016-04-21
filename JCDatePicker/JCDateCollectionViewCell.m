//
//  JCDateCollectionViewCell.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCDateCollectionViewCell.h"

@implementation JCDateCollectionViewCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGFloat lineWidth = scale > 0.0 ? 1.0 / scale : 1.0;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_titleLabel];
    
    _titleLabel.layer.masksToBounds = YES;
    _titleLabel.layer.borderWidth = lineWidth;
    _titleLabel.layer.borderColor = [UIColor clearColor].CGColor;
    _titleLabel.layer.cornerRadius = 17.5f;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:35.0f];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:35.0f];

    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.contentView addConstraint:width];
    [self.contentView addConstraint:height];
    [self.contentView addConstraint:centerX];
    [self.contentView addConstraint:centerY];
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    
    self.titleLabel.text = @"";
}

- (void)setSelected:(BOOL)selected {
    
    if (selected) {
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setBackgroundColor:[UIColor colorWithRed:21/255.0 green:169/255.0 blue:188/255.0 alpha:1]];
    } else {
        [self.titleLabel setTextColor:[UIColor blackColor]];
        [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    }
}

@end
