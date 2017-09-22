class Volunteer
  attr_reader :name, :id, :project_id, :hours

  def initialize(attr)
    @name = attr[:name]
    @project_id = attr[:project_id]
    @id = attr[:id]
    @hours = attr[:hours]
  end

  def self.all
    queried_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    queried_volunteers.each do |vol|
      volunteers.push(Volunteer.new(:name => vol['name'], :project_id => vol['project_id'].to_i, :id => vol['id'].to_i, :hours => vol['hours'].to_i))
    end
    volunteers.sort_by {|vol| vol.name}
  end

  def self.find(id)
    found_vol = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    Volunteer.new(:name => found_vol['name'], :project_id => found_vol['project_id'].to_i, :id => found_vol['id'].to_i, :hours => found_vol['hours'].to_i)
  end

  def save
    @id = DB.exec("INSERT INTO volunteers (name, project_id, hours) VALUES ('#{@name}', '#{@project_id}', #{@hours}) RETURNING ID;").first['id'].to_i
  end

  def ==(a_volunteer)
    @name.==(a_volunteer.name) and @project_id.==(a_volunteer.project_id) and @id.==(a_volunteer.id) and @hours.==(a_volunteer.hours)
  end

  def update(updated_volunteer)
    @name = updated_volunteer[:name]
    @project_id = updated_volunteer[:project_id]
    @hours = updated_volunteer[:hours].to_i
    DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = '#{@project_id}', hours = #{@hours} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end
end
