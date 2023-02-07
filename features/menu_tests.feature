Feature: FieldAware Menu Tests

  Scenario: Menu buttons inside the navigation widget are displayed in the correct order
    Given I load the FieldAware page
    Then the navigation widget is displayed
    And the menu buttons are in the correct order


  Scenario Outline: Buttons corresponding to sub-menus have a dropdown arrow
    Given I load the FieldAware page
    Then the <btn_can> button can expand a sub-menu
    But the <btn_cant> button can't expand a sub-menu
      Examples:
        |  btn_can            |  btn_cant    |
        |Platform Tour        | Get a Demo   |


  Scenario: Sub-menu is shown or hidden when clicking the dropdown button
    Given I load the FieldAware page
    When I click the Platform Tour button, the sub-menu is displayed
    Then I click the Platform Tour button, the sub-menu isn't displayed


  Scenario Outline: Clicking on a the drop-down button displays sub-menu links in the correct order
    Given I load the FieldAware page
    When I click the <submenu> button
    And the following links are displayed in the correct order: <links>

    Examples:
      |  submenu  |   links      |
      |Product    | Why FieldAware, Asset Management, Business Intelligence, Mobile Applications, Scheduling and Dispatch, Work Order Management, Customer Portal, Barcode Scanner, Improved Cash Flow, Customer Satisfaction, Service & Worker Productivity, ERP Integration, CRM Integration, Licensing Options, Implementation Services |
