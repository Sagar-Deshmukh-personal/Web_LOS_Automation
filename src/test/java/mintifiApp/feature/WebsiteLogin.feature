@test
Feature: To demonstarte login feature 

Background:
    Declarations and file read of headers/ cookies
    * configure driver = { type: 'chrome', webSocket: true, headless: false, addOptions: ['--remote-allow-origins=*'], port:1234, waitForUrl: 30000 }
    * configure ssl = true
@test
Scenario: [TC-LO-01] To verify the login feature
    Given driver 'https://sme.mintifi.com/admin'
    When waitFor('#social-google').exists
    And click('#social-google')
    Then print 'Button clicked successfully!'

# For email input
    When waitFor("input[type='email']").exists
    And input("input[type='email']", 'sagar.deshmukh@mintifi.com')
    Then print 'Email entered successfully!'
    When waitFor("//button[.//span[text()='Next']]").exists
    And scroll("//button[.//span[text()='Next']]")
    And click("//button[.//span[text()='Next']]")
    Then print 'Email Next button clicked successfully using XPath and scroll!'

# Wait for the password input field using a different selector
    When waitFor("input[name='Passwd']").exists
    Then print 'Password field is displayed successfully!'

# Focus and input the password
    When focus("input[name='Passwd']")
    And input("input[name='Passwd']", 'Ziffi1106sagar')
    Then print 'Password entered successfully using alternate selector!'

# Wait for the "Next" button
    When waitFor("//button[.//span[text()='Next']]").exists
    And scroll("//button[.//span[text()='Next']]")
    And click("//button[.//span[text()='Next']]")
    Then print 'Password Next button clicked successfully using XPath and scroll!'

# Handle Google 2-Step Verification screen
# Wait for the "Verify it's you" screen indicating the 2-step verification prompt
    When waitFor("//*[text()='Verify it’s you']").exists(timeout=2500000)
    Then print 'Waiting for user to approve 2-step verification on mobile...'

# Optionally, check for any loading or transition screens after this
    When waitFor("//*[contains(text(), 'Loading')]").exists or waitFor("//*[contains(text(), 'Checking')]").exists
    Then print 'Still waiting for verification...'

# Wait for either approval message or Done button indicating the verification completion
    When waitFor("//*[text()='Approved']").exists or waitFor("//button[contains(text(), 'Done')]").exists
    Then print '2-step verification approved on mobile!'