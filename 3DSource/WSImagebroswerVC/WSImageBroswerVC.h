//
//  WSImageBroswerVC.h
//  doucui
//
//  Created by 吴振松 on 16/10/12.
//  Copyright © 2016年 lootai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSImageModel.h"

@interface WSImageBroswerVC : UIViewController
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<WSImageModel *>* imageArray;
@property (nonatomic, assign) NSInteger showIndex;

- (void)initializeView;
- (void)initializeData;
- (void)refreshTitle;

@end

