class Blug
  attr_reader :size, :price, :id

  def initialize(attrs = {})
    @size = attrs[:size]
    @price = attrs[:price].to_i
  end

  def save
    @id ||= Blug.get_next_id
    @@blugs << self if !@@blugs.include?(self)
    Blug.dump
  end

  def self.find_by_id(id)
    @@blugs.find do |blug|
      blug.id == id
    end
  end


  def self.dump
    File.open("blugi.yml", "w") do |file|
      file.write(YAML.dump(@@blugs))
    end
  end

  def self.load
    if File.exist?("blugi.yml")
      YAML.load_file("blugi.yml")
    else
      []
    end
  end

  def self.all(count = 10)
    @@blugs[0, count]
  end

  def self.get_next_id
    @@blugs.map(&:id).max.to_i + 1
    # === @blugs.map { |b| b.id }.max.to_i
  end

  @@blugs = self.load
end
