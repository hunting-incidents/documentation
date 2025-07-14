Feature: Admin Features

    Scenario: Admin authentication
        Given the user has valid admin credentials
        When they log in
        Then they should be authenticated with admin rights

    Scenario: User with admin rights sees admin settings
        Given the user is authenticated with admin rights
        When the user clicks the user icon
        Then the menu should include an option for admin settings

    Scenario: Admin has all event manager rights
        Given the user is authenticated with admin rights
        Then the user can perform all actions available to event_manager

    Scenario: Admin creates a new user account
        Given the user is authenticated with admin rights
        When the user creates a new account with username, email, and role
        Then the new account should be created and visible in the user list

    Scenario: Admin edits a user account
        Given the user is authenticated with admin rights
        And a user account exists
        When the user edits the account information
        Then the changes should be saved and reflected in the user list

    Scenario: Admin blocks a user account
        Given the user is authenticated with admin rights
        And a user account exists
        When the user blocks the account
        Then the account should be marked as blocked and cannot log in

    Scenario: Admin deletes a user account
        Given the user is authenticated with admin rights
        And a user account exists
        When the user deletes the account
        Then the account should be removed from the user list, but still be kept in database (soft delete)
