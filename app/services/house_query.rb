class HouseQuery
  def self.call(opts)
    new(opts).results
  end

  def initialize(opts={})
    @opts = opts
    @houses = House.all
  end

  def results
    if !@opts[:min_price].blank?
      @houses = @houses.where('price >= ?', @opts[:min_price])
    end

    if !@opts[:max_price].blank?
      @houses = @houses.where('price <= ?', @opts[:max_price])
    end

    if !@opts[:min_square_footage].blank?
      @houses = @houses.where('area >= ?', @opts[:min_square_footage])
    end

    if !@opts[:max_square_footage].blank?
      @houses = @houses.where('area <= ?', @opts[:max_square_footage])
    end

    if !@opts[:floors].blank?
      @houses = @houses.where('floors = ?', @opts[:floors])
    end

    @houses
  end
end