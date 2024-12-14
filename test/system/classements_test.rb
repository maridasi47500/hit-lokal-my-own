require "application_system_test_case"

class ClassementsTest < ApplicationSystemTestCase
  setup do
    @classement = classements(:one)
  end

  test "visiting the index" do
    visit classements_url
    assert_selector "h1", text: "Classements"
  end

  test "creating a Classement" do
    visit classements_url
    click_on "New Classement"

    click_on "Create Classement"

    assert_text "Classement was successfully created"
    click_on "Back"
  end

  test "updating a Classement" do
    visit classements_url
    click_on "Edit", match: :first

    click_on "Update Classement"

    assert_text "Classement was successfully updated"
    click_on "Back"
  end

  test "destroying a Classement" do
    visit classements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Classement was successfully destroyed"
  end
end
