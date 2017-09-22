require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      expect(test_volunteer.name).to eq 'Jane'
    end
  end

  describe '#project_id' do
    it 'returns the project_id of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      expect(test_volunteer.project_id).to eq 1
    end
  end

  describe '#hours' do
    it 'returns the number of hours a volunteer has put in' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 53, :id => nil})
      expect(test_volunteer.hours).to eq 53
    end
  end

  describe '#==' do
    it 'checks for equality based on the name of a volunteer' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      volunteer2 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      expect(volunteer1 == volunteer2).to eq true
    end
  end

  context '.all' do
    it 'is empty to start' do
      expect(Volunteer.all).to eq []
    end

    it 'returns all volunteers' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})
      volunteer2.save
      expect(Volunteer.all).to eq [volunteer1, volunteer2]
    end
  end

  describe '#save' do
    it 'adds a volunteer to the database' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      expect(Volunteer.all).to eq [volunteer1]
    end
  end

  describe '.find' do
    it 'returns a volunteer by id' do
      volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})
      volunteer2.save
      expect(Volunteer.find(volunteer1.id)).to eq volunteer1
    end
  end

  describe '#update' do
    it 'allows a user to update a volunteer' do
      volunteer = Volunteer.new({:name => 'Leo', :project_id => 1, :hours => 0, :id => nil})
      volunteer.save
      volunteer.update({:name => 'Leo the Lion', :project_id => 1, :hours => 0, :id => nil})
      expect(volunteer.name).to eq 'Leo the Lion'
    end
  end

  context '#delete' do
    it 'allows a user to delete a volunteer' do
      volunteer = Volunteer.new({:name => 'Bobert',:project_id => 1, :hours => 0, :id => nil})
      volunteer.save
      volunteer.delete
      expect(Volunteer.all).to eq []
    end
  end

  describe '.sort_by_name_descending' do
    it 'allows a user to sort the volunteers by name descending' do
      volunteer1 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Zoe', :project_id => 1, :hours => 0, :id => nil})
      volunteer2.save
      volunteer3 = Volunteer.new({:name => 'Leo', :project_id => 1, :hours => 0, :id => nil})
      volunteer3.save
      expect(Volunteer.sort_by_name_descending).to eq [volunteer2, volunteer3, volunteer1]
    end
  end

  describe '.sort_by_name_ascending' do
    it 'allows a user to sort the volunteers by name ascending' do
      volunteer1 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Zoe', :project_id => 1, :hours => 0, :id => nil})
      volunteer2.save
      volunteer3 = Volunteer.new({:name => 'Leo', :project_id => 1, :hours => 0, :id => nil})
      volunteer3.save
      expect(Volunteer.sort_by_name_ascending).to eq [volunteer1, volunteer3, volunteer2]
    end
  end

  describe '.sort_by_hours_descending' do
    it 'allows a user to sort the volunteers by hours descending' do
      volunteer1 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Zoe', :project_id => 1, :hours => 56, :id => nil})
      volunteer2.save
      volunteer3 = Volunteer.new({:name => 'Leo', :project_id => 1, :hours => 23, :id => nil})
      volunteer3.save
      expect(Volunteer.sort_by_hours_descending).to eq [volunteer2, volunteer3, volunteer1]
    end
  end

  describe '.sort_by_hours_ascending' do
    it 'allows a user to sort the volunteers by name ascending' do
      volunteer1 = Volunteer.new({:name => 'Joe', :project_id => 1, :hours => 0, :id => nil})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => 'Zoe', :project_id => 1, :hours => 56, :id => nil})
      volunteer2.save
      volunteer3 = Volunteer.new({:name => 'Leo', :project_id => 1, :hours => 23, :id => nil})
      volunteer3.save
      expect(Volunteer.sort_by_hours_ascending).to eq [volunteer1, volunteer3, volunteer2]
    end
  end
end
