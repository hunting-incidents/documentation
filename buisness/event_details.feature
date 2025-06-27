Feature: Event Details Display

    Scenario: Show event details when a marker is clicked
        Given the user is on the home page
        And the map with incidents is displayed
        When the user clicks on an incident marker
        Then the event details should appear on the screen
        And the details should include:
            | Field             |
            | Title             |
            | Description       |
            | Type              |
            | Target            |
            | Cause             |
            | Date              |
            | Status            |
            | Geolocalisation   |
        And if sources are provided
        Then a list of sources should be shown with the event details
