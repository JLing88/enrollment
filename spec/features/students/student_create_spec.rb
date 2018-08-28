require 'rails_helper'

describe 'user can create a student' do
  describe 'As a user' do
    describe 'they visit /students/new' do
      describe 'they fill in the name field' do
        describe 'they click submit' do
          it 'takes them to the show page for the newly created student' do

            visit new_student_path

            fill_in "student[name]", with: "Jesse Ling"
            click_on "Create"

            expect(current_path).to eq(student_path(Student.last))
            expect(page).to have_content(Student.last.name)
          end
        end
      end
    end
  end
end
