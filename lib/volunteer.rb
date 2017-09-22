class Volunteer
  attr_reader :name, :id, :project_id

  def initialize(attr)
    @name = attr[:name]
    @project_id = attr[:project_id]
    @id = attr[:id]
  end

  def self.all
    queried_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    queried_volunteers.each do |vol|
      volunteers.push(Volunteer.new(:name => vol['name'], :project_id => vol['project_id'].to_i, :id => vol['id'].to_i))
    end
    volunteers.sort_by {|vol| vol.name}
  end

  def self.find(id)
    found_vol = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    Volunteer.new(:name => found_vol['name'], :project_id => found_vol['project_id'].to_i, :id => found_vol['id'].to_i)
  end

  def save
    @id = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING ID;").first['id'].to_i
  end

  def ==(a_volunteer)
    @name.==(a_volunteer.name) and @project_id.==(a_volunteer.project_id) and @id.==(a_volunteer.id)
  end
end
