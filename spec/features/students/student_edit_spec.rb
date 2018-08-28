require 'rails_helper'

describe 'user can edit a student' do
  describe 'As a user' do
    describe 'they visit the student edit page' do
      describe 'they fill in the name field' do
        describe 'they click submit' do
          describe 'they are now on the show page for that student' do
            it 'should show the updated student name' do

              s = Student.create!(name: "Jesse Ling")

              visit student_path(s)
              expect(current_path).to eq(student_path(s))

              click_on "Edit"
              expect(current_path).to eq(edit_student_path(s))

              name = "John Kennedy"
              fill_in "student[name]", with: name
              click_on "Submit"

              expect(current_path).to eq(student_path(s))
              expect(page).to have_content(name)

            end
          end
        end
      end
    end
  end
end
