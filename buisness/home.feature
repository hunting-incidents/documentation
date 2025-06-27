Feature: Home Page Map Display

    Scenario: Display map with incidents from last year
        When user land on the home page
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
        Then only incidents with matching title or description should be shown on the map

    Scenario: Use filters to refine incidents
        Given the user is on the home page
        When they open the filter options
        Then they should see filters for:
            | Filter         | Example Choices                                                                 |
            | type           | "Menace", "Blessure", "Mort", "Destruction", "Autre"                           |
            | target         | "Chasseur", "Humain", "Animal de companie", "Animal d'élevage", "Faune sauvage protégée", "Batiment", "Véhicule" |
            | cause          | "Inconnue", "Alcool", "Drogue", "Viellese", "Inexpérience", "Non respect des règles de sécurité", "Mauvaise manipulation", "Autre" |
            | date           | "Last 7 days", "Last month", "Last year", "Custom Range"                       |
            | status         | "Pending", "Verified", "Not_verifiable", "Rejected"                             |
            | geolocalisation| "Within 10km", "Within 50km"                                                   |
        When they select a value for any filter
        Then only incidents matching the selected filters should be shown on the map


