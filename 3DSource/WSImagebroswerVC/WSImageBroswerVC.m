//
//  WSImageBroswerVC.m
//  doucui
//
//  Created by 吴振松 on 16/10/12.
//  Copyright © 2016年 lootai. All rights reserved.
//

#import "WSImageBroswerVC.h"
#import "WSImageBroserCell.h"
@interface WSImageBroswerVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation WSImageBroswerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeView];
    [self initializeData];
}

- (void)initializeView {
    self.view.backgroundColor = [UIColor blackColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    layout.minimumLineSpacing = 0.0f;
    layout.minimumInteritemSpacing = 0.0f;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[WSImageBroserCell class] forCellWithReuseIdentifier:NSStringFromClass([WSImageBroserCell class])];
}

- (void)initializeData {
    [self.collectionView reloadData];
    if(_showIndex > 0 && _showIndex < _imageArray.count) {
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.collectionView setContentOffset:CGPointMake(_showIndex*self.collectionView.frame.size.width, 0) animated:NO];
        });
    }
    else {
        [self refreshTitle];
    }
}

- (void)refreshTitle {
    NSInteger index = self.collectionView.contentOffset.x/self.collectionView.frame.size.width;
    _showIndex = index;
    index += 1;
    if(index >= 0 && index <= _imageArray.count) {
        self.title = [NSString stringWithFormat:@"%@/%@",@(index),@(_imageArray.count)];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WSImageBroserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WSImageBroserCell class]) forIndexPath:indexPath];
    if(indexPath.row < _imageArray.count) {
        cell.model = _imageArray[indexPath.row];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self refreshTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
