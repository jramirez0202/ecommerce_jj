require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "City", with: @address.city
    fill_in "Comuna", with: @address.comuna
    fill_in "Fullname", with: @address.fullname
    fill_in "Number", with: @address.number
    fill_in "Phone", with: @address.phone
    fill_in "Street", with: @address.street
    fill_in "User", with: @address.user_id
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "City", with: @address.city
    fill_in "Comuna", with: @address.comuna
    fill_in "Fullname", with: @address.fullname
    fill_in "Number", with: @address.number
    fill_in "Phone", with: @address.phone
    fill_in "Street", with: @address.street
    fill_in "User", with: @address.user_id
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
