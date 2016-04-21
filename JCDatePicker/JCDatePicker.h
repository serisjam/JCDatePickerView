//
//  JCDatePicker.h
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JCDateHeaderCollectionReusableView.h"
#import "JCDateCollectionViewCell.h"

#import "JCDayModel.h"
#import "NSIndexPath+JCDatePicker.h"

@class JCDatePicker;

@protocol JCDatePickerDataSource <NSObject>

@required
- (NSInteger)numberOfSegmentsInDatePickerView:(JCDatePicker *)datePicker;
- (NSInteger)jcDatePicker:(JCDatePicker *)datePicker numberOfItemsInSegment:(NSInteger)segment;

@end

typedef void (^JCDatePickerCellConfigureBlock)(JCDateCollectionViewCell *collectionViewCell, NSIndexPath *indexPath);
typedef void (^JCDatePickerReusableViewBlock)(JCDateHeaderCollectionReusableView *reusableView, NSString *elementKind, NSIndexPath *indexPath);
typedef void (^JCDatePickerDidSelectBlock)(NSIndexPath *selectIndexPath);

@interface JCDatePicker : UIView

@property (nonatomic, assign) id<JCDatePickerDataSource> dataSource;
@property (nonatomic, readonly) UICollectionView *collectionView;

@property (nonatomic, strong) JCDatePickerReusableViewBlock reusableViewBlcok;
@property (nonatomic, strong) JCDatePickerCellConfigureBlock configureCellBlock;
@property (nonatomic, strong) JCDatePickerDidSelectBlock didSelectBlock;

@end
