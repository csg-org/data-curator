@backlog

Feature: Close all tabs
  As a Data Packager  
  I want to close all data tabs and be warned if there are unsaved changes  
  So that I can finish my work quickly and safely  

  RULES
  =====

  - The "Close All tabs" command can be invoked by a menu item
  - The "Close All tabs" command can be cancelled
  
  LATER
  =====
  
  - checking for unsaved data changes

  Scenario: Close all tabs and all work is saved
    Given Data Curator is open
    And all data changes have been saved
    When "Close All Tabs" is invoked
    Then all tabs should be closed

  Scenario: Close all tabs and some work is unsaved
    Given Data Curator is open
    And some data changes have not been saved
    When "Close All Tabs" is invoked
    Then a warning to save unsaved work should be shown
