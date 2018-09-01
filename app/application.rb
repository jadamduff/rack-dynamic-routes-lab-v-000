class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_title = req.path.split("/item/").last
      @@items.each do |x|
        if x.name == item_title
          resp.write "#{x.price}"
        end
      end
      resp.write "Item not found"
      resp.status 400
    else
      resp.status 404
    end
  end

end
