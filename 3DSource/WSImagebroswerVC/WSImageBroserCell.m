//
//  WSImageBroserCell.m
//  doucui
//
//  Created by 吴振松 on 16/10/12.
//  Copyright © 2016年 lootai. All rights reserved.
//

#import "WSImageBroserCell.h"
#import "UIImageView+WebCache.h"

@interface WSImageBroserCell()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation WSImageBroserCell

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 1;//设置最小放大比例
    _scrollView.maximumZoomScale = 2.5;//设置最大放大比例
    [self addSubview:_scrollView];
    
    _imageView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    if(_scrollView.zoomScale != 1) {
        [_scrollView setZoomScale:1 animated:YES];
    }
    else {
        [_scrollView setZoomScale:2.5 animated:YES];
    }
}

- (void)setModel:(WSImageModel *)model {
    _scrollView.zoomScale = 1.0;
    _model = model;
    if(model.image) {
        _imageView.image = model.image;
    }
    else {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    }
    
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{//两手指触摸放大时调用，返回需要改变的view
    return _imageView;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{//结束放大时调用
    if (scale < 1.0) {//如果放大比例小于1.0则停止放大后返回原大小
        [scrollView setZoomScale:1.0 animated:YES];
    }
}


@end
