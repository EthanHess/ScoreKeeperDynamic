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
#import "GameController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, GameDelegate>

@property (nonatomic, strong) NSMutableArray *scoreLabels;
@property (nonatomic, strong) SectionHeaderView *sectionHeaderView;

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
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addGame)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save Scores" style:UIBarButtonItemStylePlain target:self action:@selector(saveScores)];
    self.navigationItem.leftBarButtonItem = saveButton; 
}

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Game *game = [[GameController sharedInstance].games objectAtIndex:indexPath.section];
    Player *player = [game.players objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = player.name;
    
    
//    cell.label.text = ((Player *)[GameController sharedInstance].players[indexPath.row]).score;
    
//    cell.nameLabel.text = self.sectionHeaderView.addField.text;
    
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    Game *game = [[GameController sharedInstance].games objectAtIndex:section];
    
    return game.players.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return [SectionHeaderView headerHeight];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CGRect frame = CGRectMake(0, 0, tableView.frame.size.width, [SectionHeaderView headerHeight]);
    
    self.sectionHeaderView = [[SectionHeaderView alloc]initWithFrame:frame];
    [self.sectionHeaderView updateWithTitle:section];
    self.sectionHeaderView.delegate = self;
    
    Game *currentGame = [GameController sharedInstance].games[section];
    
    [self.sectionHeaderView updateWithGame:currentGame];
    
    return self.sectionHeaderView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [GameController sharedInstance].games.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Game *game = [GameController sharedInstance].games[indexPath.section];
        
        [[GameController sharedInstance]removePlayer:game.players[indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.tableView reloadData];
        
    }
}


- (void)addGame {
    
    UIAlertController *addAlert = [UIAlertController alertControllerWithTitle:@"Game Name" message:@"Add Game" preferredStyle:UIAlertControllerStyleAlert];
    
    [addAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Game name";
    }];
    
    [addAlert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [[GameController sharedInstance] addGameWithName:((UITextField *)addAlert.textFields[0]).text];
        
        [self.tableView reloadData];
        
    }]];
    
    [addAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    
    
    [self presentViewController:addAlert animated:YES completion:nil];
    
    [self.tableView reloadData];
    
}

- (void)saveScores {
    
    
}

- (void)removePlayer:(Player *)player {
    
    
    
}

- (void)addPlayerToGame:(Game *)game {
    
    
    [[GameController sharedInstance] addPlayerWithName:self.sectionHeaderView.addField.text toGame:game];
    
    [self.tableView reloadData];
}

- (void)deleteButtonPressed:(Game *)game
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Delete Game?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    [[GameController sharedInstance] removeGame:game];
    
    [self.tableView reloadData];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


@end
