Feature: Event Manager Features

    Background:
        Given the user has valid event_manager credentials
        And they are authenticated with event_manager rights

    Scenario: Event manager authentication
        Given the user has valid event_manager credentials
        When they log in
        Then they should be authenticated with event_manager rights
        And they should see event management options in the interface

    Scenario: User with event_manager rights can create an event
        Given the user is authenticated with event_manager rights
        When the user clicks the user icon
        Then the menu should include an option for event creation
        And the menu should show "Create Event" as available

    Scenario: Event manager creates a new event with validation
        Given the user is authenticated with event_manager rights
        When the user creates a new event with the following information:
            | Field       | Value                              |
            | Title       | Hunter injured in forest accident |
            | Description | Detailed description of incident   |
            | Type        | Blessure                          |
            | Target      | Chasseur                          |
            | Cause       | Mauvaise manipulation             |
            | Date        | 2025-01-15                        |
            | Town        | Lyon (69000)                      |
        Then the new event should be created successfully
        And the event should have status "Pending" by default
        And the event should be visible in the event list
        And an entry should be added to the event history recording the creation
        And the event should appear on the public map

    Scenario: Event manager sees edit button on event details
        Given the user is authenticated with event_manager rights
        And an incident exists in the system
        When the event details are displayed
        Then the user should see an "Edit" button
        And the button should be clearly visible and accessible

    Scenario: Event manager edits an event and history is recorded
        Given the user is authenticated with event_manager rights
        And an incident exists with title "Original Title"
        When the user clicks the "Edit" button
        And updates the title to "Updated Title"
        And updates the description to "Updated description with more details"
        And saves the changes
        Then the event should be updated with the new information
        And a new entry should be added to the event history
        And the history entry should record the changed fields
        And the history entry should include the user who made the change
        And the history entry should include the timestamp

    Scenario: Event manager views event history
        Given the user is authenticated with event_manager rights
        And an incident exists with modification history
        When the user views the event history
        Then they should see a chronological list of all modifications
        And each history entry should show:
            | Information     |
            | User who made change |
            | Timestamp       |
            | Fields changed  |
            | Previous values |
            | New values      |

    Scenario: Event manager validates imported events
        Given the user is authenticated with event_manager rights
        And there are pending imported events from news sources
        When the user reviews an imported event
        Then they should be able to:
            | Action    | Description                           |
            | Verify    | Mark event as verified and accurate   |
            | Reject    | Mark event as invalid or duplicate    |
            | Edit      | Modify details before verification    |
            | Merge     | Combine with existing similar event   |

    Scenario: Form validation for event creation
        Given the user is authenticated with event_manager rights
        When the user attempts to create an event with missing required fields
        Then the form should display validation errors
        And the user should not be able to submit until all required fields are filled
        When the user enters invalid data formats
        Then appropriate error messages should be displayed

    Scenario: Event manager manages event sources
        Given the user is authenticated with event_manager rights
        And they are editing an event
        When they add a new source URL and description
        Then the source should be saved with the event
        When they remove an existing source
        Then the source should be deleted from the event
        And the change should be recorded in the event history
