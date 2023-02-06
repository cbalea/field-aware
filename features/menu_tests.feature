Feature: FieldAware Menu Tests

  Scenario: Menu buttons inside the navigation widget are displayed in the correct order
    Given I load the FieldAware page
    Then the navigation widget is displayed
    And the menu buttons are displayed
    And the menu buttons are in the correct order


  Scenario Outline: Buttons corresponding to sub-menus have a dropdown arrow
    Given I load the FieldAware page
    Then the <btn> button has a dropdown arrow

    Examples:
      |  btn    |
      |Product    |
      |Industry   |
      |Solutions  |
      |Resources  |
      |Company    |


  Scenario Outline: Buttons not corresponding to sub-menus don't have a dropdown arrow
    Given I load the FieldAware page
    Then the <btn> button doesn't have a dropdown arrow

    Examples:
      |  btn  |
      |Clients      |


  Scenario: Sub-menu is shown or hidden when clicking the dropdown button
    Given I load the FieldAware page
    When I click the Product button, the sub-menu is displayed
    Then I click the Product button, the sub-menu isn't displayed


  Scenario: Sub-menu not displayed when clicking non-dropdown button
    Given I load the FieldAware page
    When I click the Clients button, the sub-menu isn't displayed


  Scenario Outline: Clicking on a the drop-down button displays sub-menu links in the correct order
    Given I load the FieldAware page
    When I click the <submenu> button
    And the following links are displayed in the correct order: <links>

    Examples:
      |  submenu  |   links      |
      |Product    | Why FieldAware, Asset Management, Business Intelligence, Mobile Applications, Scheduling and Dispatch, Work Order Management, Customer Portal, Barcode Scanner, Improved Cash Flow, Customer Satisfaction, Service & Worker Productivity, ERP Integration, CRM Integration, Licensing Options, Implementation Services |
      |Industry   | Agricultural Equipment, Commercial HVAC, Construction Equipment, Food Processing Equipment, Food Service Equipment, Heavy Equipment, Medical Equipment, Telecom and Tower Erectors, Waste Management, Water Treatment |
      |Solutions  | Small Business, Mid Market, Enterprise, Business to Consumer, Business Executive, IT Executive, Operations, Field Engineer, NetSuite, QuickBooks, Salesforce.com, Fieldaware's Open API |
      |Resources  | Product Videos, Webinars, ROI Calculator, White Papers & eBooks, Events |
      |Company    | About FieldAware, Company News, Investors, Press Room, Contact Us, Leadership, Careers, Diversity & Inclusion |
