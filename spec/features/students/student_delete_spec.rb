require 'rails_helper'

describe 'user can delete a student' do
  describe 'As a user' do
    describe 'they visit /students' do
      describe 'they click "Delete" next to a student name' do
        describe 'they see the index page' do
          it 'does not show the deleted student name' do

            s_1 = Student.create!(name: "Jesse Ling")
            s_2 = Student.create!(name: "Jim Beam")
            s_3 = Student.create!(name: "Jack Daniels")

            visit students_path
            within("#student-#{s_1.id}") do
              click_on "Delete"
            end

            expect(current_path).to eq(students_path)
            expect(page).to_not have_content("#{s_1.name}")
          end
        end
      end
    end
  end
end
