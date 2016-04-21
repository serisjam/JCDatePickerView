//
//  JCDateHeaderCollectionReusableView.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCDateHeaderCollectionReusableView.h"

@implementation JCDateHeaderCollectionReusableView

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
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:21.0f];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_titleLabel];
    
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[_titleLabel]-10-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_titleLabel)];
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_titleLabel]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_titleLabel)];
    
    [self addConstraints:constraint_H];
    [self addConstraints:constraint_V];
}

@end
