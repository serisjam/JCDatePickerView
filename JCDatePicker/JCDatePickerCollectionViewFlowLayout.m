//
//  JCDatePickerCollectionViewFlowLayout.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCDatePickerCollectionViewFlowLayout.h"

@implementation JCDatePickerCollectionViewFlowLayout

- (id)init {
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.headerReferenceSize = CGSizeMake(size.width, 25.0f);
    self.minimumLineSpacing = 10.0;
    self.minimumInteritemSpacing = 0.0;
    self.itemSize = CGSizeMake(size.width/7.0f, 35.0f);
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.sectionInset = UIEdgeInsetsMake(10.0f, 0.0, 10.0f, 0.0);
}

@end
