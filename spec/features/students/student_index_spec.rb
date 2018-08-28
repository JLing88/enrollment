require 'rails_helper'

describe 'user sees all students spec' do
  describe 'As a user' do
    describe 'they visit the index page' do
      it 'should show the name of all students' do

        s_1 = Student.create!(name: "Jesse Ling")
        s_2 = Student.create!(name: "Willie Nelson")
        s_3 = Student.create!(name: "Rick James")

        visit students_path

        expect(page).to have_content("#{s_1.name}")
        expect(page).to have_content("#{s_2.name}")
        expect(page).to have_content("#{s_3.name}")
      end

      it 'should have a link on each students name that takes them to show page' do
        s_1 = Student.create!(name: "Jesse Ling")
        s_2 = Student.create!(name: "Willie Nelson")
        s_3 = Student.create!(name: "Rick James")

        visit students_path

        within("#student-#{s_2.id}") do
          click_on "#{s_2.name}"
        end

        expect(current_path).to eq(student_path(s_2))
      end
    end
  end
end
