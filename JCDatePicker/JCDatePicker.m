//
//  JCDatePicker.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCDatePicker.h"

#import "JCDatePickerCollectionViewFlowLayout.h"

@interface JCDatePicker () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

static NSString * const reuseIdentifier = @"dateCollectionViewCell";
static NSString * const headerReuseIdentifier = @"dateHeaderCollectionReuseView";

@implementation JCDatePicker

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
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:[[JCDatePickerCollectionViewFlowLayout alloc] init]];
    [_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_collectionView registerClass:[JCDateCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [_collectionView registerClass:[JCDateHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:_collectionView];
    
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_collectionView)];
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_collectionView)];
    
    [self addConstraints:constraint_H];
    [self addConstraints:constraint_V];
    
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataSource numberOfSegmentsInDatePickerView:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource jcDatePicker:self numberOfItemsInSegment:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JCDateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, indexPath);
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    JCDateHeaderCollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier forIndexPath:indexPath];
    
    if (self.reusableViewBlcok) {
        self.reusableViewBlcok(reusableview, kind, indexPath);
    }
    
    return reusableview;
}

#pragma mark UICollectionDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectBlock) {
        self.didSelectBlock(indexPath);
    }
}

@end
