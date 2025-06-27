Feature: Account Management

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
