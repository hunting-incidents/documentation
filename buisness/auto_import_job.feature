Feature: Automatic Import of Hunting Incident News

    Scenario: Daily job processes news websites for hunting incidents
        Given a list of online news websites is configured
        When the daily import job runs
        Then it should fetch and process all new articles published since the last run
        And identify articles related to hunting incidents

    Scenario: Create new event from news article
        Given the import job finds a news article about a hunting incident
        When the event does not already exist in the event or import tables
        Then a new event should be created in the import table with all available data from the article
        And the article should be added as a source for the event

    Scenario: Update existing event with new source
        Given the import job finds a news article about a hunting incident
        And the event already exists in the event or import tables
        When the article is not already listed as a source
        Then the article should be added to the list of sources for the event
        And an edit entry should be created to record the update

    Scenario: Ignore duplicate sources
        Given the import job finds a news article about a hunting incident
        And the article is already listed as a source for the event
        Then no duplicate source should be added
        And no unnecessary edit entry should be created
