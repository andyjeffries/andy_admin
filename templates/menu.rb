module AndyAdmin
  class Menu
    include Singleton    
    
    def self.build(&block)
      instance.instance_eval(&block)
      instance
    end
    
    def initialize
      @main_items = []
      @sub_items = []      
    end
    
    def main(id, name, link=nil)
      @main_items << {:name => name, :link => link, :id => id}
    end
    
    def sub(id, name, link=nil)
      @sub_items << {:name => name, :link => link, :id => id}
    end
    
    def main_items_each(current)
      @main_items.each do |item|
        css_class = (item[:id] == current ? "active" : "")
        yield(item[:name], item[:link], item[:id], css_class)
      end
    end    
    
    def sub_items_each(current)
      @sub_items.each do |item|
        css_class = (item[:id] == current ? "active" : "")
        yield(item[:name], item[:link], item[:id], css_class)
      end
    end
    
  end
end
