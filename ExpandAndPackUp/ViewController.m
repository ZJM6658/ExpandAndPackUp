//
//  ViewController.m
//  ExpandAndPackUp
//
//  Created by zhujiamin on 2016/11/22.
//  Copyright © 2016年 zhujiamin. All rights reserved.
//

#import "ViewController.h"
#import <MLLabel/MLLinkLabel.h>

@interface ViewController ()

@property (nonatomic, strong) MLLinkLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];

    //初始短文字
    NSMutableString *shortStr = [[NSMutableString alloc] initWithString:@"中国共产党在社会主义初级阶段的基本路线是：领导和团结全国各族人民，以经济建设为中心，坚持四项基本..."];
    //这里可以根据实际需求选择是否需要添加展开按钮(全部文字的长度)
    [shortStr appendString:@"展开😷"];
    NSMutableAttributedString *shortAttrStr = [[NSMutableAttributedString alloc]initWithString:shortStr];
    [shortAttrStr addAttribute:NSLinkAttributeName value:@"展开" range:NSMakeRange(shortAttrStr.length - 4, 4)];
    
    //展开后的全部文字
    NSMutableString *wholeStr = [[NSMutableString alloc] initWithString:@"中国共产党在社会主义初级阶段的基本路线是：领导和团结全国各族人民，以经济建设为中心，坚持四项基本原则，坚持改革开放，自力更生，艰苦创业，为把我国建设成为富强民主文明和谐的社会主义现代化国家而奋斗。下面是YJBYS小编分享的2016最新党章全文"];
    [wholeStr appendString:@"收起😳"];
    NSMutableAttributedString *wholeAttrStr = [[NSMutableAttributedString alloc]initWithString:wholeStr];
    [wholeAttrStr addAttribute:NSLinkAttributeName value:@"收起" range:NSMakeRange(wholeAttrStr.length - 4, 4)];
    
    //默认显示初始短文字
    self.label.attributedText = shortAttrStr;

    //点击事件(label需要根据内容计算宽高，有待完善)
    [self.label setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
        if ([link.linkValue isEqualToString:@"展开"]) {
            label.attributedText = wholeAttrStr;
        } else {
            label.attributedText = shortAttrStr;
        }
    }];
    
    //展开／收起后面放置自定义图标稍候完成，目前随意放了一个字符表情(占2位)，若不需要放图标可以直接使用:@"展开[...]"/@"收起^"这样类似的字符
}

#pragma mark - getter
- (MLLinkLabel *)label {
    if (!_label) {
        _label = [[MLLinkLabel alloc] initWithFrame:CGRectMake(50, 100, 300, 200)];
        _label.textColor = [UIColor redColor];
        _label.font = [UIFont systemFontOfSize:14.0f];
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentLeft;
        _label.textInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        _label.allowLineBreakInsideLinks = NO;
        _label.linkTextAttributes = nil;
        _label.activeLinkTextAttributes = nil;
    }
    return _label;
}

@end
