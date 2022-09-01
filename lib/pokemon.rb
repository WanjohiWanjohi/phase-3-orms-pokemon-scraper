class Pokemon
    attr_accessor :name, :type, :id, :db
    def initialize(id:,name:, type:, db:)
       @id = id
       @name = name
       @type = type
       @db = db
    end
    
   def self.find(id, db)
    sql = db.execute("SELECT * FROM pokemon WHERE id=?", id).first
    self.new(id:sql[0], name:sql[1], type:sql[2], db:db)
   end

    def self.save(name, type, db)
     sql = "INSERT INTO Pokemon (name,type) VALUES(?,?)"
     db.execute(sql, name, type)
    end
end
