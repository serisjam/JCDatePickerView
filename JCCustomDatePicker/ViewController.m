//
//  ViewController.m
//  JCCustomDatePicker
//
//  Created by Jam on 16/4/21.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "ViewController.h"
#import "JCDatePicker.h"

@interface ViewController () <JCDatePickerDataSource>

@property (weak, nonatomic) IBOutlet JCDatePicker *datePickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //自定义一个DayModel转换，目前还没想好怎么适配数据端，占时这么用吧
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.year = 2016;
    c.month = 7;
    c.day = 12;
    NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:c];
    c.month = 10;
    NSDate *date2 = [[NSCalendar currentCalendar] dateFromComponents:c];
    c.month = 12;
    NSDate *date3 = [[NSCalendar currentCalendar] dateFromComponents:c];
    
    NSTimeInterval timeInterval1 = [date1 timeIntervalSince1970];
    NSTimeInterval timeInterval2 = [date2 timeIntervalSince1970];
    NSTimeInterval timeInterval3 = [date3 timeIntervalSince1970];
    
    JCDayModel *dayModel1 = [JCDayModel dayModelWith:timeInterval1];
    JCDayModel *dayModel2 = [JCDayModel dayModelWith:timeInterval2];
    JCDayModel *dayModel3 = [JCDayModel dayModelWith:timeInterval3];
    
    //dataSource及delegate配置
    [self.datePickerView setDataSource:self];
    [self.datePickerView setConfigureCellBlock:^(JCDateCollectionViewCell *collectionViewCell, NSIndexPath *indexPath){
        [collectionViewCell.titleLabel setText:[NSString stringWithFormat:@"%ld", indexPath.row]];
    }];
    
    [self.datePickerView setReusableViewBlcok:^(JCDateHeaderCollectionReusableView *reusableView, NSString *elementKind, NSIndexPath *indexPath){
        
        switch (indexPath.segment) {
            case 0:
                [reusableView.titleLabel setText:[NSString stringWithFormat:@"%ld年%ld月", dayModel1.year, dayModel1.month]];
                break;
            case 1:
                [reusableView.titleLabel setText:[NSString stringWithFormat:@"%ld年%ld月", dayModel2.year, dayModel2.month]];
                break;
            case 2:
                [reusableView.titleLabel setText:[NSString stringWithFormat:@"%ld年%ld月", dayModel3.year, dayModel3.month]];
                break;
            default:
                break;
        }
        
    }];
    
    [self.datePickerView setDidSelectBlock:^(NSIndexPath *indexPath){
        NSLog(@"segment:%ld row:%ld", indexPath.segment, indexPath.row);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSegmentsInDatePickerView:(JCDatePicker *)datePicker {
    return 3;
}

- (NSInteger)jcDatePicker:(JCDatePicker *)datePicker numberOfItemsInSegment:(NSInteger)segment {
    return 30;
}

@end
