require 'rails_helper'

describe 'user sees one student name spec' do
  describe 'As a user' do
    describe 'they visit a show page for a student' do
      it 'displays the student name' do
        name = "Jesse Ling"

        s = Student.create!(name: name)

        visit student_path(s)

        expect(page).to have_content("#{s.name}")
      end
    end
  end
end
