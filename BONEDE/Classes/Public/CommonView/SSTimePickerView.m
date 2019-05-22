//
//  SSTimePickerView.m
//  BONEDE
//
//  Created by hank on 2019/5/16.
//  Copyright © 2019 BONEDE. All rights reserved.
//

#import "SSTimePickerView.h"

#define SCREENW     [UIScreen mainScreen].bounds.size.width

@interface SSTimePickerView()<UIPickerViewDataSource,UIPickerViewDelegate>{
    UIView *contentView;
    NSMutableArray *dayArray;
    NSMutableArray *hourArray;
    NSMutableArray *minArray;
    kMeDictionaryBlock _selectDay;
}
@property (nonatomic, copy) NSString *selectedHour;
@property (nonatomic, copy) NSString *selectedDay;
@property (nonatomic, copy) NSString *selectedMin;
@end

@implementation SSTimePickerView

- (instancetype)initWithSelectDaye:(kMeDictionaryBlock)block{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        _selectDay = block;
        [self initDataSource];
        [self initAppreaence];
    }

    
    return self;
}

- (void)initDataSource {
    dayArray = [[NSMutableArray alloc]init];
    hourArray = [[NSMutableArray alloc]init];
    minArray = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i<10; i++) {
        [dayArray addObject:@(i).description];
    }
    for (NSInteger i=0; i<24; i++) {
        [hourArray addObject:@(i).description];
    }
    for (NSInteger i=0; i<60; i++) {
        [minArray addObject:@(i).description];
    }
    _selectedDay = dayArray[0];
    _selectedHour = hourArray[0];
    _selectedMin = minArray[0];

}

#pragma mark - initAppreaence
- (void)initAppreaence {
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 300)];
    [self addSubview:contentView];
    //设置背景颜色为黑色，并有0.4的透明度
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    //添加白色view
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:whiteView];
    //添加确定和取消按钮
    for (int i = 0; i < 2; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 60) * i, 0, 60, 40)];
        [button setTitle:i == 0 ? @"取消" : @"确定" forState:UIControlStateNormal];
        [button setTitleColor:kSSblack forState:UIControlStateNormal];

        [whiteView addSubview:button];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10 + i;
    }
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth(self.bounds), 260)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.backgroundColor = [UIColor colorWithRed:240.0/255 green:243.0/255 blue:250.0/255 alpha:1];
    [contentView addSubview:pickerView];
}

#pragma mark - Actions
- (void)buttonTapped:(UIButton *)sender {
    if (sender.tag == 10) {
        [self dismiss];
    } else {
        kMeCallBlock(_selectDay,@{@"day":_selectedDay,@"hour":_selectedHour,@"min":_selectedMin});
        [self dismiss];
    }
}

#pragma mark - pickerView出现
- (void)show {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.4 animations:^{
        contentView.center = CGPointMake(self.frame.size.width/2, contentView.center.y - contentView.frame.size.height);
    }];
}

#pragma mark - pickerView消失
- (void)dismiss{
    [UIView animateWithDuration:0.4 animations:^{
        contentView.center = CGPointMake(self.frame.size.width/2, contentView.center.y + contentView.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIPickerViewDataSource UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return dayArray.count;
    } else if(component == 1){
        return hourArray.count;
    }else {
        return minArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return dayArray[row];
    } else if(component == 1){
        return hourArray[row];
    }else {
        return minArray[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _selectedDay = dayArray[row];
    } else if(component == 1){
        _selectedHour = hourArray[row];
    }else {
        _selectedMin = minArray[row];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}

-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 3, 30)];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    if (component == 0) {
        label.text = [[NSString stringWithFormat:@"%@",dayArray[row]] stringByAppendingString:@"天"];
    }else if (component == 1){
        label.text = [[NSString stringWithFormat:@"%@",hourArray[row]] stringByAppendingString:@"小时"];
    }else if (component == 2){
        label.text = [[NSString stringWithFormat:@"%@",minArray[row]] stringByAppendingString:@"分"];
    }
    return label;
    
}

@end
