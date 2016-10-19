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

@property (nonatomic, assign) CGSize itemSize; //默认CGSizeMake(70, 70);
@property (nonatomic, assign) UIEdgeInsets sectionInset; //默认UIEdgeInsetsMake(10, 10, 10, 10);
@property (nonatomic, assign) CGFloat minimumLineSpacing; //默认10.0f;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing; //默认10.0f;
@property (nonatomic, assign) NSInteger photosMaxCount; //最多选择照片张数 默认9张

@end
