require 'rails_helper'

describe 'user can create a new address' do
  describe 'As a user' do
    describe 'they visit /student/:id/addresses/new' do
      describe 'they fill in the form' do
        describe 'they click submit' do
          describe 'it takes the to the student show page' do
            it 'shows the new address on the student show page' do
              s = Student.create(name: "Jesse Ling")

              visit new_student_address_path(s)

              expect(current_path).to eq new_student_address_path(s)
              desc = "dlsjfa;dfja;ldkfja;d"
              street = "123 Main St."
              city = "Denver"
              state = "CO"
              zip = "88888"
              fill_in "address[description]", with: desc
              fill_in "address[street]", with: street
              fill_in "address[city]", with: city
              fill_in "address[state]", with: state
              fill_in "address[zip]", with: zip
              click_on "Submit"

              expect(current_path).to eq(student_path(s))
              expect(page).to have_content(desc)
              expect(page).to have_content(street)
              expect(page).to have_content(city)
              expect(page).to have_content(state)
              expect(page).to have_content(zip)
            end
          end
        end
      end
    end
  end
end
