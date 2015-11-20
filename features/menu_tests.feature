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

  Scenario Outline: Clicking on a the drop-down button displays correct links in the sub-menu
    Given I load the FieldAware page
    When I click the <btn> button
    And the following links are displayed: <links>

    Examples:
      |  btn     |   links      |
      |Product    | Why FieldAware, Asset Management, Business Intelligence, Mobile Applications, Scheduling and Dispatch, Improved Cash Flow, Customer Satisfaction, Service & Worker Productivity, ERP Integration, CRM Integration, Licensing Options, Implementation Services |
      |Industry   | Agricultural Equipment, Commercial HVAC, Construction Equipment, Food Processing Equipment, Food Service Equipment, Heavy Equipment, Waste Management, Water Treatment |
      |Solutions  | Small Business, Mid Market, Enterprise, Business to Consumer, Business Executive, IT Executive, Operations, Field Engineer, NetSuite, QuickBooks, Salesforce.com, Fieldaware's Open API |
      |Resources  | Product Videos, Webinars, ROI Calculator, White Papers & eBooks, Events |
      |Company    | About FieldAware, Company News, Investors, Press Room, Contact Us, Leadership, Careers, Diversity & Inclusion |

#  TODO: verify category headings in sub-menus; ie: Product - Features
#  TODO: clicking again on the button hides sub-menu