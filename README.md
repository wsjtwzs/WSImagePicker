####**WSImagePicker**
**高性能多选图片库，类似于微信发布朋友圈中 ‘获取相册及拍照’模块**

![image](http://ofa0lelax.bkt.clouddn.com/3.png-w320h0) ![image](http://ofa0lelax.bkt.clouddn.com/2.png-w320h0) ![image](http://ofa0lelax.bkt.clouddn.com/1.png-w320h0)

获取相册照片部分可以多选，加载速度快，采用JFImagePickerController https://github.com/johnil/JFImagePickerController并在此基础上增加图片数量选取限制；
点击图片显示大图，并能进行双击放大缩小，双指缩放、删除等操作；

####**How to user**
#####**Import**

    #import "WSImagePickerView.h"
    
#####**parameter settings**
    WSImagePickerConfig *config = [WSImagePickerConfig new];
    config.itemSize = CGSizeMake(70, 70);
    config.photosMaxCount = 9;
#####**create pickerView**    
	WSImagePickerView *pickerView = [[WSImagePickerView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0) config:config];
    //Height changed with photo selection
     __weak typeof(self) weakSelf = self;
    pickerView.viewHeightChanged = ^(CGFloat height) {
        weakSelf.photoViewHieghtConstraint.constant = height;
        [weakSelf.view setNeedsLayout];
        [weakSelf.view layoutIfNeeded];
    };
    
    pickerView.navigationController = self.navigationController;
    [self.photoView addSubview:pickerView];
    self.pickerView = pickerView;
    
    //refresh superview height
    [pickerView refreshImagePickerViewWithPhotoArray:nil];
    


#####**get photos**
	NSArray *array = [self.pickerView getPhotos];

