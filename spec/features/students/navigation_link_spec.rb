require 'rails_helper'

describe 'user can link to /students and /students/new from all pages' do
  describe 'As a user' do
    describe 'they see the links on the index page'
      it 'shows links on the index page' do
        visit students_path

        expect(page).to have_content("Create Student")
        within("#nav") do
          click_on "Create Student"
        end
        expect(current_path).to eq(new_student_path)

        visit students_path

        expect(page).to have_content("All Students")
      end
    describe 'they see the links on the show page' do
      it 'shows links on the show page' do
        s = Student.create(name: "Jesse")

        visit student_path(s)

        expect(page).to have_content("Create Student")

        within("#nav") do
          click_on "Create Student"
        end
        expect(current_path).to eq(new_student_path)

        visit students_path
        expect(page).to have_content("All Students")
        within("#nav") do
          click_on "All Students"
        end

        expect(current_path).to eq(students_path)
      end
    end
    describe 'they see the links on the new page' do
      it 'shows links on the new page' do
        visit new_student_path

        expect(page).to have_content("Create Student")

        within("#nav") do
          click_on "Create Student"
        end
        expect(current_path).to eq(new_student_path)

        visit new_student_path

        expect(page).to have_content("All Students")
        
        within("#nav") do
          click_on "All Students"
        end

        expect(current_path).to eq(students_path)
      end
    end
  end
end
