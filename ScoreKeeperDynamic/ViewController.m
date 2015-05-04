//
//  ViewController.m
//  ScoreKeeperDynamic
//
//  Created by Ethan Hess on 5/2/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "SectionHeaderView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *scoreLabels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Score Keeper";
    
    [self setUpTableView];
    [self setUpNavigationBar];
    
}

- (void)setUpTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self registerTableView:self.tableView];
    
    [self.view addSubview:self.tableView];
    
}

- (void)setUpNavigationBar {
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addPlayer:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIBarButtonItem *subtractButton = [[UIBarButtonItem alloc] initWithTitle:@"-" style:UIBarButtonItemStylePlain target:self action:@selector(subtractPlayer:)];
    self.navigationItem.leftBarButtonItem = subtractButton;
    
}

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return [SectionHeaderView headerHeight];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, [SectionHeaderView headerHeight]);
    
    SectionHeaderView *sectionHeaderView = [[SectionHeaderView alloc]initWithFrame:frame];
    [sectionHeaderView updateWithTitle:section];
    
    return sectionHeaderView;
}


- (void)addPlayer:(id)sender {
    
    
    
}

- (void)subtractPlayer:(id)sender {
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
