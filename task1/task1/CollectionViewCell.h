//
//  CollectionViewCell.h
//  task1
//
//  Created by bytedance on 2020/7/23.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

@property(strong,nonatomic)UIImageView *personImage;
@property(strong,nonatomic)UILabel *personName;

@end

NS_ASSUME_NONNULL_END
