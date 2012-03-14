//
//  MainViewController.m
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionCell.h"
#import "Inspection.h"
#import "Question.h"

@interface MainViewController ()

@end

@implementation MainViewController {
    Inspection* model;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    model = [Inspection new];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)updateCell:(QuestionCell*) cell withValue:(BOOL) value {
    cell.question.hasNotes = value;
    cell.question = cell.question;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)bigButtonTouch:(id)sender {
    QuestionCell* cell = (QuestionCell*)[[sender superview] superview];
    [self updateCell:cell withValue:YES];
}

- (void)smallButtonTouch:(id)sender {
    QuestionCell* cell = (QuestionCell*)[[sender superview] superview];
    [self updateCell:cell withValue:NO];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return model.questions.count / 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat: @"Section %d", section + 1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    QuestionCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];   
    cell.question = [model.questions objectAtIndex:indexPath.section * 5 + indexPath.row];    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {    
    Question* question = [model.questions objectAtIndex:indexPath.section * 5 + indexPath.row];
    return [QuestionCell heightRequiredBy:question];
}

@end
