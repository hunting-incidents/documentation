Feature: Event Manager Features

    Scenario: Event manager authentication
        Given the user has valid event_manager credentials
        When they log in
        Then they should be authenticated with event_manager rights

    Scenario: User with event_manager rights can create an event
        Given the user is authenticated with event_manager rights
        When the user clicks the user icon
        Then the menu should include an option for event creation

    Scenario: Event manager creates a new event
        Given the user is authenticated with event_manager rights
        When the user creates a new event with all proper fields filled
        Then the new event should be created and visible in the event list
        And an entry should be added to the event history recording the creation

    Scenario: Event manager sees edit button on event details
        Given the user is authenticated with event_manager rights
        And the event details are displayed
        Then the user should see an "Edit" button

    Scenario: Event manager edits an event and history is recorded
        Given the user is authenticated with event_manager rights
        And the event details are displayed
        When the user clicks the "Edit" button
        And updates one or more fields of the event
        And saves the changes
        Then the event should be updated with the new information
        And a new entry should be added to the event history recording the modification

    Scenario: Event manager views event history
        Given the user is authenticated with event_manager rights
        And the event details are displayed
        When the user views the event history
        Then they should see a list of all modifications made to the event
