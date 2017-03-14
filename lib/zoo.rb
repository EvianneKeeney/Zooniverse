class ZooAtCapacity < StandardError
end


class Zoo
  attr_reader :cages, :employees, :season_opening_date, :season_closing_date

  def initialize(name, season_opening_date, season_closing_date)
    @cages = []
    10.times do
    @cages << Cage.new
    end
    @employees = []
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    (season_opening_date..season_closing_date).include?(date)
  end

  def add_animal(animal)
    index = 0
    while index < 10
      if @cages[index].empty?
        @cages[index].animal = animal
        break
      end
      index += 1
    end
    if index == 10
      raise ZooAtCapacity
    end
  end

  def visit
    greet = ""
    @employees.each do |employee|
      greet += employee.greet + "\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        greet += cage.animal.speak  + "\n"
      end
    end
    greet

  end

end
