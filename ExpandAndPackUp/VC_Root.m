//
//  VC_Root.m
//  ExpandAndPackUp
//
//  Created by zhujiamin on 2016/11/23.
//  Copyright © 2016年 zhujiamin. All rights reserved.
//

#import "VC_Root.h"
#import "VC_TextOnly.h"
#import "VC_AddIcon.h"

@interface VC_Root ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *listData;
@property (nonatomic, strong) NSArray<UIViewController *> *vcData;

@end

@implementation VC_Root

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"几种展开/收起功能的实现";
    self.listData = @[@"文字展开", @"带图标"];
    self.vcData = @[[[VC_TextOnly alloc] init], [[VC_AddIcon alloc] init]];
    [self.view addSubview:self.tableView];
}

#pragma mark - getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *IDF_STR = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDF_STR];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDF_STR];
    }
    cell.textLabel.text = self.listData[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = self.vcData[indexPath.row];
    vc.title = self.listData[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
