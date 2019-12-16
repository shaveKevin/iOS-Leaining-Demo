//
//  SKDiscoveryVC.m
//  SKNewsProject
//
//  Created by shavekevin on 2016/11/22.
//  Copyright © 2016年 shavekevin. All rights reserved.
//

#import "SKDiscoveryVC.h"
#import "SKDispatcher+TestVCActions.h"
#import <StoreKit/StoreKit.h>
#import "SKBeautyENWordRequest.h"
#import "SKBeautyENWordResult.h"
#import "SKBeautyENWordTableViewHandle.h"
#import "SKBeautyENWordModel.h"
static NSString *const cellIdentifier = @"cellIdentifier";

@interface SKDiscoveryVC ()
<
UITableViewDataSource,
UITableViewDelegate
>
@property (nonatomic, strong) NSMutableArray *titles;

@property (nonatomic, strong) NSMutableArray *classNames;
/**
 *  @brief <#Description#>
 */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SKDiscoveryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"      生活广场       ";
    [self initData];
}

- (void)initData {
    
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    [self addCellText:@"英文语录" class:@"SKBeautyENWordVC"];
    [self addCellText:@"今日运势" class:@"SKZodiacChartVC"];
    [self addCellText:@"英文语录" class:@"SKBeautyENWordVC"];
    [self addCellText:@"英文语录" class:@"SKBeautyENWordVC"];
    [self addCellText:@"英文语录" class:@"SKBeautyENWordVC"];
    [self addCellText:@"英文语录" class:@"SKBeautyENWordVC"];
    [self addCellText:@"英文语录" class:@"SKBeautyENWordVC"];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)addCellText:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
    }
    return _tableView;
}


@end
