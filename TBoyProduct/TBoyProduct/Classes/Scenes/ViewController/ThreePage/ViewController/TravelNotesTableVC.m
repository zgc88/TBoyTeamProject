//
//  TravelNotesTableVC.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "TravelNotesTableVC.h"
#import "ThoughtsVC.h"
// 自定义cell 标识符
static NSString *cellId = @"cellId";
// 自定义cell 标识符
static NSString *anotherCellId = @"anotherCellId";
// 自定义collectionView 标识符
static NSString *collectionCellID = @"collectionCellID";

@interface TravelNotesTableVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZLPhotoPickerBrowserViewControllerDataSource,ZLPhotoPickerBrowserViewControllerDelegate,ZLPhotoPickerViewControllerDelegate>
{
    // 自定义CollectionViewCell
    TravelNotesAnotherCell *anotherCell;
    // 自定义TableViewCell
    TravelNotesCell *cell;
}
// 照片数组 (包含 添加图片Image)
@property (nonatomic,strong) NSMutableArray *imagesArray;
// 照片数组 (不包含 添加图片Image)
@property (nonatomic,strong) NSMutableArray *imagesArrayAnother;
// 添加图片Image
@property (nonatomic,strong) UIImage *addImage;
@end

@implementation TravelNotesTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"写游记";
    // navigation 添加右侧 发布按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnAction:)];
    // navigation 添加左侧 取消按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(chanlBtnAction:)];
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"TravelNotesCell" bundle:nil] forCellReuseIdentifier:cellId];
    [self.tableView registerNib:[UINib nibWithNibName:@"TravelNotesAnotherCell" bundle:nil] forCellReuseIdentifier:anotherCellId];
    
    // 设置区尾视图
    self.tableView.tableFooterView=[[UIView alloc]init];
    
    self.addImage = [UIImage imageNamed:@"album"];
    [self.imagesArray addObject:self.addImage];
}

#pragma mark - 发布游记按钮方法
- (void)doneBtnAction:(id)sender{
    
}

#pragma mark - 取消发布游记按钮方法
- (void)chanlBtnAction:(id)sender{
    // 获取AppDelegate 页面的 按钮
    AppDelegate *myDelegate=[UIApplication sharedApplication].delegate;
    if (myDelegate.button.hidden==YES) {
        // 设置按钮显示
        myDelegate.button.hidden=NO;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source
// TableViewCell 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
// TableViewCell 每行显示内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        anotherCell = [tableView dequeueReusableCellWithIdentifier:anotherCellId forIndexPath:indexPath];
        anotherCell.selectionStyle = UITableViewCellSelectionStyleNone;
        // collectionView 布局类
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        // collectionView item 大小
        flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 60)/3 , 100);
        // collectionView item 上 左 右 下 间隔
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        // 设置代理
        anotherCell.imgCollectionView.delegate  = self;
        anotherCell.imgCollectionView.dataSource = self;
        anotherCell.imgCollectionView.backgroundColor = [UIColor whiteColor];
        anotherCell.imgCollectionView.collectionViewLayout = flowLayout;
        // 去掉竖向滚动条
        anotherCell.imgCollectionView.showsVerticalScrollIndicator = NO;
        //注册cell
        [anotherCell.imgCollectionView registerClass:[TravelNotesImgCell class] forCellWithReuseIdentifier:collectionCellID];
        anotherCell.thoughtsLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureTel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myButtonEvent:)];
        [anotherCell.thoughtsLabel addGestureRecognizer:tapGestureTel];
        
        return anotherCell;
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
            if (indexPath.row == 1) {
                cell.titleLabel.text = @"旅游日期";
                cell.imgView.image= [UIImage imageNamed:@"date"];
            }else{
                cell.titleLabel.text = @"目的地";
                cell.imgView.image= [UIImage imageNamed:@"locate"];
            }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}


- (void)myButtonEvent:(id)sender{
    ThoughtsVC *thoughtVC = [ThoughtsVC new];
//    thoughtVC.view.backgroundColor = [UIColor whiteColor];
    thoughtVC.theArticle =  anotherCell.thoughtsLabel.text;
    NSLog(@"==============%@",thoughtVC.theArticle);
    thoughtVC.textRtn = ^(NSString *toughtText){
        anotherCell.thoughtsLabel.text = toughtText;
        [self refreshThePage];
    };
    [self.navigationController pushViewController:thoughtVC animated:YES];
}

// TableViewCell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        return 450;
        CGFloat heightFloat;
        CGSize labelSize = [anotherCell.thoughtsLabel sizeThatFits:CGSizeMake(anotherCell.thoughtsLabel.frame.size.width, MAXFLOAT)];
//        anotherCell.thoughtsLabel.frame = CGRectMake(10, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        NSInteger countNum = self.imagesArray.count;
        if(countNum %3 == 0){
            heightFloat = (countNum / 3) *100 + 100;
        }else{
            heightFloat = ((countNum / 3)+ 1) *100 + 100;
        }
        return heightFloat + labelSize.height;
    }else{
        return 50;
    }
}

#pragma mark - UICollectionViewDelegate 
// CollectionViewCell 个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imagesArray.count;
}
// CollectionViewCell 显示内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TravelNotesImgCell *collectioncell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    ZLPhotoAssets *asset = self.imagesArray[indexPath.row];
    if ([asset isKindOfClass:[ZLPhotoAssets class]]) {
        collectioncell.imgView.image = asset.originImage;
    }
    else{
        collectioncell.imgView.image = self.addImage;
    }
    return collectioncell;
}
// CollectionViewCell 点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        // 执行 获取手机相册
        [self selectPhotos];
    }else{
        [self showPhotos:indexPath];
    }
}

// 获取手机相册方法
- (void)selectPhotos {
    // 创建控制器
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // 默认显示相册里面的内容SavePhotos
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.selectPickers = self.imagesArrayAnother;
    // 最多能选9张图片
    pickerVc.maxCount = 9;
    pickerVc.delegate = self;
    [pickerVc showPickerVc:self];

}
// 展示照片
- (void)showPhotos:(NSIndexPath *)indexPath{
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 数据源/delegate
    pickerBrowser.delegate = self;
    pickerBrowser.dataSource = self;
    // 是否可以删除照片
    pickerBrowser.editing = YES;
    // 当前选中的值
    pickerBrowser.currentIndexPath = [NSIndexPath indexPathForItem:indexPath.row - 1 inSection:0];
    // 展示控制器
    [pickerBrowser showPickerVc:self];
}
// 添加照片 完成 方法
- (void)pickerViewControllerDoneAsstes:(NSArray *)assets{
    self.imagesArray = [NSMutableArray arrayWithArray:assets];
    self.imagesArrayAnother = [NSMutableArray arrayWithArray:assets];
    [self.imagesArray insertObject:self.addImage atIndex:0];
    [self refreshThePage];
}


#pragma mark - <ZLPhotoPickerBrowserViewControllerDataSource>
// 代理方法 有多少展示的分组
- (NSInteger)numberOfSectionInPhotosInPickerBrowser:(ZLPhotoPickerBrowserViewController *)pickerBrowse{
    return 1;
}
// 代理方法 有多少展示的照片
- (NSInteger)photoBrowser:(ZLPhotoPickerBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section{
    return self.imagesArrayAnother.count;
}

#pragma mark - 每个组展示什么图片,需要包装下ZLPhotoPickerBrowserPhoto
- (ZLPhotoPickerBrowserPhoto *) photoBrowser:(ZLPhotoPickerBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath{

    ZLPhotoAssets *imageObj = [self.imagesArrayAnother objectAtIndex:indexPath.row];
    // 包装下imageObj 成 ZLPhotoPickerBrowserPhoto 传给数据源
    ZLPhotoPickerBrowserPhoto *photo = [ZLPhotoPickerBrowserPhoto photoAnyImageObjWith:imageObj];
    
   
    photo.toView = anotherCell.imageView;
    // 缩略图
    photo.thumbImage = anotherCell.imageView.image;
    return photo;
}



#pragma mark - <ZLPhotoPickerBrowserViewControllerDelegate>
#pragma mark 删除照片调用
- (void)photoBrowser:(ZLPhotoPickerBrowserViewController *)photoBrowser removePhotoAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > [self.imagesArray count]) return;
    [self.imagesArrayAnother removeObjectAtIndex:indexPath.row];
    [self.imagesArray removeObjectAtIndex:indexPath.row + 1];
    [self refreshThePage];
}

#pragma mark - TableView CollectionView 页面刷新
- (void)refreshThePage{
    [anotherCell.imgCollectionView reloadData];
    [anotherCell.imgCollectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    [self.tableView reloadData];
}


#pragma mark - imagesArray懒加载
- (NSMutableArray *)imagesArray{
    if (!_imagesArray) {
        self.imagesArray = [NSMutableArray new];
    }
    return _imagesArray;
}
@end
