//
//  ViewController.m
//  WSImagePicker
//
//  Created by 吴振松 on 16/10/17.
//  Copyright © 2016年 wsjtwzs. All rights reserved.
//

// 常量定义
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "WSImagePickerView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoViewHieghtConstraint;
@property (nonatomic, strong) WSImagePickerView *pickerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
- (void)setupView {
    
    __weak typeof(self) weakSelf = self;
    
    WSImagePickerView *pickerView = [[WSImagePickerView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    pickerView.viewHeightChanged = ^(CGFloat height) {
        weakSelf.photoViewHieghtConstraint.constant = height;
        [weakSelf.view setNeedsLayout];
        [weakSelf.view layoutIfNeeded];
    };
    // 刷新photoView 高度
    [pickerView refreshImagePickerViewWithPhotoArray:nil];
    pickerView.navigationController = self.navigationController;
    [_photoView addSubview:pickerView];
    _pickerView = pickerView;
}

- (IBAction)onClickConfirm:(id)sender {
    NSArray *array = [_pickerView getPhotos];
    NSLog(@"%@",array);
    [[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"共选择了%@张照片",@(array.count)] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
