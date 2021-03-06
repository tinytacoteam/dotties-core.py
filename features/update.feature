Feature: Update

  Scenario: Update re-clone deleted repos
    Given I have "blainesch/dotties" installed
    When I remove "blainesch/dotties" from the file system
    And I type "dotties update"
    Then I see my dotfiles installed

  Scenario: Update re-creates deleted dotfiles
    Given I have "blainesch/dotties" installed
    When I remove all the dotties in "~/"
    And I type "dotties update"
    Then I see my dotfiles installed

  Scenario: Update pulls the latest changes of all dotties
    Given an old version of "blainesch/dotties" installed
    And an old version of "amjith/dotties" installed
    When I type "dotties update"
    Then I see the new version of "blainesch/dotties"
    And I see the new version of "amjith/dotties"

  Scenario: Updating when a package has modifications
    Given an old version of "blainesch/dotties" installed
    And an old version of "amjith/dotties" installed
    And I make a modification to "amjith/dotties"
    When I type "dotties update"
    Then I see a prompt to telling us "amjith/dotties" is dirty
    And I see the old version of "amjith/dotties"
    And I see the old version of "blainesch/dotties"

  Scenario: Updating a specific dotfile doesn't upate all dotties
    Given an old version of "blainesch/dotties" installed
    And an old version of "amjith/dotties" installed
    When I type "dotties update blainesch/dotties"
    Then I see the new version of "blainesch/dotties"
    And I see the old version of "amjith/dotties"

  Scenario: Dry update
    Given an old version of "blainesch/dotties" installed
    When I type "dotties update --dry blainesch/dotties"
    Then I see a list of files that would be installed
