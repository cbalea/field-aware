Feature: FieldAware Menu Tests

#  Scenario: Menu buttons are displayed
#    Given I load the FieldAware page
#    Then the navigation widget is displayed
#    And the menu buttons are displayed
#
#
#  Scenario Outline: Buttons corresponding to sub-menus have a dropdown arrow
#    Given I load the FieldAware page
#    Then the <btn> button has a dropdown arrow
#
#    Examples:
#      |  btn    |
#      |Product    |
#      |Industry   |
#      |Solutions  |
#      |Resources  |
#      |Company    |
#
#
#  Scenario Outline: Buttons not corresponding to sub-menus don't have a dropdown arrow
#    Given I load the FieldAware page
#    Then the <btn> button doesn't have a dropdown arrow
#
#    Examples:
#      |  btn  |
#      |Clients      |
#
#
#  Scenario: Sub-menu displayed when clicking dropdown button
#    Given I load the FieldAware page
#    When I click the Product button, the sub-menu is displayed
#
#
#  Scenario: Sub-menu not displayed when clicking non-dropdown button
#    Given I load the FieldAware page
#    When I click the Clients button, the sub-menu isn't displayed
#
#
  Scenario Outline: Clicking on a the drop-down button displays correct links in the sub-menu
    Given I load the FieldAware page
    When I click the <btn> button
    Then the sub-menu is opened
    And the following links are displayed: <links>

    Examples:
      |  btn     |   links      |
      |Product    |from right side  |
      |Industry   |from right side  |
      |Solutions  |from right side  |
      |Resources  |from right side  |
      |Company    |from right side  |