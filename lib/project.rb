class Project
  attr_reader :id, :name

  def initialize(attr)
    @title = attr[:title]
    @id = attr[:id]
  end

  def self.all
    queried_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    queried_projects.each do |proj|
      projects.push(Project.new(:title => proj['title'], :id => proj['id'].to_i))
    end
    projects.sort_by {|proj| proj.title}
  end

  def self.find(id)
    found_proj = DB.exec("SELECT * FROM projects WHERE id = #{id};")[0]
    Project.new(:title => found_proj['title'], :id => found_proj['id'].to_i))
  end

  def save
    DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING ID;")[0].to_i
  end

  def .==(a_project)
    @title.==(a_project.title) and @id.==(a_project.id)
  end

  def volunteers
    DB.exec("SELECT * FROM volunteers WHERE project_id = #{@id};")
  end

  def update(updated_project)
    @title = updated_project[:title]
    DB.exec("UPDATE projects SET name = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end
end
