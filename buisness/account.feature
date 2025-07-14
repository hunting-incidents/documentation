Feature: Account Management

    Scenario: User clicks user icon when not logged in
        Given the user is not authenticated
        When the user clicks the user icon
        Then a modal should appear allowing the user to log in

    Scenario: User clicks user icon when logged in
        Given the user is authenticated
        When the user clicks the user icon
        Then a menu should appear with options:
            | Settings       |
            | Log out        |

    Scenario: User logs out from menu
        Given the user is authenticated
        When the user clicks the user icon
        And selects "Log out"
        Then the user should be logged out and returned to the home page

    Scenario: User changes username
        Given the user is authenticated
        When the user updates their username
        Then the new username should be saved
        And the change should be recorded in the user history

    Scenario: User changes email
        Given the user is authenticated
        When the user updates their email address
        Then the new email should be saved
        And the change should be recorded in the user history

    Scenario: User changes password
        Given the user is authenticated
        When the user updates their password
        Then the new password should be saved securely
        And the change should be recorded in the user history

    Scenario: User deletes their account (soft delete)
        Given the user is authenticated
        When the user requests account deletion
        Then the account should be marked as deleted (soft delete)
        And personal data should be anonymized or removed as required by RGPD
        And the user history should be retained for audit purposes
