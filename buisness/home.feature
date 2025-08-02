Feature: Home Page Map Display

    Scenario: Display map with incidents from last year
        When the user lands on the home page
        Then they should see the map with incidents from last year

    Scenario: Interact with the map
        Given the user is on the home page
        When they zoom in or out on the map
        Then the map should update to show the relevant area
        When they move around (pan) the map
        Then the map should update to show the new area
        When they click on an incident marker
        Then they should see the event details for that incident

    Scenario: Use the search bar to filter incidents by text
        Given the user is on the home page
        When they enter text in the search bar
        Then only incidents with matching titles or descriptions should be shown on the map

    Scenario: Use filters to refine incidents
        Given the user is on the home page
        When they open the filter options
        Then they should see filters for:
            | Filter          | Example Choices                                                                                      |
            | type            | "Menace", "Blessure", "Mort", "Destruction", "Autre"                                                 |
            | target          | "Chasseur", "Humain", "Animal de compagnie", "Animal d’élevage", "Faune sauvage protégée", "Bâtiment", "Véhicule" |
            | cause           | "Inconnue", "Alcool", "Drogue", "Vieillesse", "Inexpérience", "Non-respect des règles de sécurité", "Mauvaise manipulation", "Autre" |
            | date            | "Last 7 days", "Last month", "Last year", "Custom Range"                                             |
            | status          | "Pending", "Verified", "Not verifiable", "Rejected"                                                  |
            | geolocalisation | "Within 10km", "Within 50km"                                                                         |
        When they select a value for any filter
        Then only incidents matching the selected filters should be shown on the map
        And the incident count should be updated

    Scenario Outline: Filter incidents by specific criteria
        Given the user is on the home page
        When they apply a "<filter_type>" filter with value "<filter_value>"
        Then only incidents matching the filter should be displayed
        And the map should update to show only relevant markers

        Examples:
            | filter_type | filter_value |
            | type        | Mort         |
            | target      | Chasseur     |
            | status      | Verified     |

    Scenario: Combine multiple filters
        Given the user is on the home page
        When they select "Mort" for the type filter
        And they select "Chasseur" for the target filter
        And they select "Last month" for the date filter
        Then only incidents matching all three filters should be shown
        And the incident count should reflect the combined filtering

    Scenario: Reset all filters
        Given the user has applied multiple filters
        When they click the "Reset filters" button
        Then all filters should be cleared
        And all incidents from the last year should be displayed again

    Scenario: Responsive design on mobile devices
        Given the user is on a mobile device
        When they access the home page
        Then the map should be touch-friendly
        And filter options should be accessible via mobile-friendly interface
        And incident details should display properly on small screens

    Scenario: Handle empty search results
        Given the user is on the home page
        When they search for text that matches no incidents
        Then they should see a "No incidents found" message
        And the map should show no markers
        When they clear the search
        Then all incidents should be displayed again

    Scenario: Map clustering behavior
        Given the user is on the home page
        When they zoom out to view a large area
        Then incident markers should be clustered together
        And cluster numbers should show the count of incidents
        When they click on a cluster
        Then the map should zoom in to show individual markers
        When they zoom in sufficiently
        Then individual incident markers should be visible
