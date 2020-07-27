//
//  CollectionViewCell.m
//  task1
//
//  Created by bytedance on 2020/7/23.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.personImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.bounds.origin.x, self.contentView.bounds.origin.y + self.contentView.frame.size.height / 2 - 50, 100, 100)];
    self.personName = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.bounds.origin.x + 150, self.contentView.bounds.origin.y + self.contentView.frame.size.height / 2 - 25, 50, 50)];
    [self.contentView addSubview:self.personImage];
    [self.contentView addSubview:self.personName];
}

@end
