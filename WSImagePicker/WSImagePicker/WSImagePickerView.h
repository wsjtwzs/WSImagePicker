//
//  WSImagePickerView.h
//  WSImagePicker
//
//  Created by 吴振松 on 16/10/17.
//  Copyright © 2016年 wsjtwzs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSImagePickerConfig;
@interface WSImagePickerView : UIView

@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, copy) void(^viewHeightChanged)(CGFloat height);

- (instancetype)initWithFrame:(CGRect)frame config:(WSImagePickerConfig *)config;
- (void)refreshImagePickerViewWithPhotoArray:(NSArray<UIImage *> *)array;
- (NSArray<UIImage *> *)getPhotos;
@end

@interface WSImagePickerConfig : NSObject

@property (nonatomic, assign) CGSize itemSize; //每张图片的缩略图尺寸 默认CGSizeMake(60, 60);
@property (nonatomic, assign) UIEdgeInsets sectionInset; //距离上下左右的边距 默认UIEdgeInsetsMake(10, 10, 10, 10);
@property (nonatomic, assign) CGFloat minimumLineSpacing; //最小行高 默认10.0f;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing; //最小列宽 默认10.0f;
@property (nonatomic, assign) NSInteger photosMaxCount; //最多选择照片张数 默认9张

@end
