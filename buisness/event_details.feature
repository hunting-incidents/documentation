Feature: Event Details Display

    Background:
        Given the user is on the home page
        And the map with incidents is displayed

    Scenario: Show event details when a marker is clicked
        Given the user is on the home page
        And the map with incidents is displayed
        When the user clicks on an incident marker
        Then the event details should appear on the screen
        And the details should include:
            | Field             | Description                                    |
            | Title             | Brief incident description                     |
            | Description       | Detailed incident information                  |
            | Type              | Category of incident (threat, injury, etc.)   |
            | Target            | Who/what was affected                          |
            | Cause             | Identified cause of the incident               |
            | Date              | When the incident occurred                     |
            | Status            | Verification status of the incident            |
            | Geolocalisation   | Location information (town, postal code)      |
        And if sources are provided
        Then a list of sources should be shown with the event details

    Scenario: Display sources with proper attribution
        Given an incident has multiple news sources
        When the user views the event details
        Then each source should display:
            | Source Information |
            | Source URL         |
            | Description        |
            | Publication date   |
        And sources should be clickable links opening in new tabs

    Scenario: Handle incidents without sources
        Given an incident has no associated sources
        When the user views the event details
        Then the sources section should show "No sources available"
        And the incident should still display all other available information

    Scenario: Close event details dialog
        Given the event details dialog is open
        When the user clicks the close button
        Then the dialog should close
        And the map should return to the previous state
        When the user clicks outside the dialog
        Then the dialog should also close

    Scenario: Navigate between incidents
        Given multiple incident markers are visible on the map
        And the user has opened details for one incident
        When the user clicks on a different incident marker
        Then the details should update to show the new incident
        And the previous incident marker should return to normal state
        And the new incident marker should be highlighted

    Scenario: Display status with appropriate styling
        Given an incident has a specific verification status
        When the user views the event details
        Then the status should be displayed with appropriate visual styling:
            | Status         | Visual Style        |
            | Pending        | Yellow indicator    |
            | Verified       | Green indicator     |
            | Not verifiable | Orange indicator    |
            | Rejected       | Red indicator       |

    Scenario: Mobile responsive event details
        Given the user is on a mobile device
        When they click on an incident marker
        Then the event details should display in a mobile-friendly format
        And all information should be readable on small screens
        And sources should be easily accessible
        And the close button should be easily tappable

    Scenario: Handle long descriptions gracefully
        Given an incident has a very long description
        When the user views the event details
        Then the description should be displayed with proper text wrapping
        And if necessary, a "Read more" / "Read less" toggle should be available
        And the dialog should not exceed reasonable screen dimensions
