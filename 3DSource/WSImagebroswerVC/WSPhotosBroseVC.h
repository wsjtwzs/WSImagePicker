//
//  GoodsImageBroseVC.h
//  doucui
//
//  Created by 吴振松 on 16/10/12.
//  Copyright © 2016年 lootai. All rights reserved.
//

#import "WSImageBroswerVC.h"

@interface WSPhotosBroseVC : WSImageBroswerVC
@property (nonatomic, copy) void(^completion)(NSArray <UIImage *> *array);
@end
