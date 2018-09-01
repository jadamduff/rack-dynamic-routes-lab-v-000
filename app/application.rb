class application

  @@item = Item.all_instances

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items"
      @@item.each do |x|
        if x.name == req.params["item"]
          resp.write "#{x.price}"
        else
          resp.write "Item not found"
          resp.status 404
  end

end
