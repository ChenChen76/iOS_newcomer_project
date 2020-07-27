//
//  DetailViewController.m
//  task1
//
//  Created by bytedance on 2020/7/23.
//  Copyright © 2020 bytedance. All rights reserved.
//

#import "DetailViewController.h"
#import "CollectionViewCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *rootDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.itemTitles = [rootDictionary objectForKey:@"avatars"];
    //NSLog(@"%@", [self.itemTitles objectAtIndex:1]);
    
    self.navigationItem.title = @"通讯录";
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    //创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置每个item的大小为界面宽度*200
    layout.itemSize = CGSizeMake(self.view.frame.size.width, 200);
    layout.minimumLineSpacing = 1;
    
    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    
    //代理设置
    collect.delegate = self;
    collect.dataSource = self;
    
    //注册item类型 这里使用系统的类型
    [collect registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    
    collect.backgroundColor = [UIColor blackColor];
    
    collect.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    // 注意这里设置headerView的头视图的y坐标一定是从"负值"开始,因为headerView是添加在collectionView上的.
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, -50, self.view.frame.size.width, 49)];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    [label setTextColor:[UIColor blackColor]];
    //label setBackgroundColor:[UIColor clearColor]];
    //[label setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    label.text = @"联系人列表";
    [headerView addSubview:label];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 100,50,100,100)];
    //btn.backgroundColor = [UIColor orangeColor];
    [btn setBackgroundImage:[UIImage imageNamed:@"portrait"] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 25;
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [btn addGestureRecognizer:panGestureRecognizer];
    
    [collect addSubview:btn];
    [collect addSubview:headerView];
    [self.view addSubview:collect];
}

//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //NSLog(@"%lu", [self.itemTitles count]);
    return [self.itemTitles count];
}
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.backgroundColor = [UIColor whiteColor];
    cell.personImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@",  @(indexPath.row + 1)]];
    cell.personName.text = [self.itemTitles objectAtIndex:indexPath.row];
    cell.personName.textColor = [UIColor blackColor];
    //[cell.contentView addSubview:cell.personImage];
    //NSLog(@"%@", cell.personName.text);
    //[cell.contentView addSubview:cell.personName];
    return cell;
}

/*- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                            withReuseIdentifier:@"UICollectionViewHeader"
                                                                                   forIndexPath:indexPath];
    headView.backgroundColor = [UIColor redColor];
    
    return headView;
}*/

-(void) handlePan:(UIPanGestureRecognizer*) recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    //CGFloat centerX = recognizer.view.center.x + translation.x;
    //CGFloat centerX = translation.x;
    CGFloat thecenterY = 0;

    recognizer.view.center = CGPointMake(self.view.frame.size.width - 50, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self.view];

    if(recognizer.state == UIGestureRecognizerStateEnded ||  recognizer.state == UIGestureRecognizerStateCancelled) {
        NSUInteger cellNumber = (recognizer.view.center.y + translation.y) / 200 + 1;
        thecenterY = cellNumber * 200 - 100;
        [UIView animateWithDuration:0.1 animations:^{
        recognizer.view.center = CGPointMake(self.view.frame.size.width - 50,
        thecenterY);}];
    }
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
