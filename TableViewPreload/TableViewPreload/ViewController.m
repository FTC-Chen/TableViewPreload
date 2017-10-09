//
//  ViewController.m
//  TableViewPreload
//
//  Created by anyongxue on 2017/9/25.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "NewTableViewCell.h"
#import "MJRefresh.h"

static NSString *const RESIDNEW = @"RESIDNEW";
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign)NSInteger pageIndex;
@property (nonatomic,copy)NSString *typeID;//分类ID
@property (nonatomic,strong)UITableView *resTableView;
@property (nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageIndex = 1;
    [self.view addSubview:self.resTableView];
    [self getServerData];
}

- (void)getServerData{
    
    NSString *url = @"";//接口使用内部资源接口,其它使用带有分页接口即可,主要内容为111行分页代码
    
    NSDictionary *dict = @{
                           @"pageIndex" : @(self.pageIndex),
                           @"seachWord" : @""
                           };
    NSLog(@"dict-%@",dict);
    
    __weak typeof(self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //3.发送请求
    [manager GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if ([[responseObject valueForKey:@"message"] integerValue] == 1) {
            
            NSArray *tmpArr = [responseObject valueForKey:@"messagemodel"];
            
            for (NSDictionary *dict in tmpArr) {
                ResourceModel *model = [[ResourceModel alloc] initWithDictionary:dict];
                [weakSelf.dataArr addObject:model];
            }
            
            NSLog(@"count-%ld",self.dataArr.count);
            [self.resTableView setHidden:NO];
            [self.resTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


- (UITableView *)resTableView{
    
    if (!_resTableView) {
        
        _resTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight - 64) style:UITableViewStylePlain];
        [_resTableView setDelegate:self];
        [_resTableView setDataSource:self];
        [_resTableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewTableViewCell class]) bundle:nil] forCellReuseIdentifier:RESIDNEW];
        [_resTableView setTableFooterView:[UIView new]];
        [_resTableView setHidden:YES];
    }
    return _resTableView;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewTableViewCell *cell = (NewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:RESIDNEW];
    
    if (self.dataArr.count > indexPath.row) {
        
        [cell bindDataWithResourceModel:self.dataArr[indexPath.row] withIndex:indexPath.row];
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;//边缘距离
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
     NSLog(@"offset: %f", offset.y);
     NSLog(@"content.height: %f", size.height);
     NSLog(@"bounds.height: %f", bounds.size.height);//603,界面高度6s-667-64,
     NSLog(@"inset.top: %f", inset.top);
     NSLog(@"inset.bottom: %f", inset.bottom);
     NSLog(@"pos: %f of %f", y, h);
    
    float reload_distance = 80;
    if(y > h - reload_distance) {
        NSLog(@"load more rows");
        self.pageIndex ++;
        [self getServerData];
    }
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
