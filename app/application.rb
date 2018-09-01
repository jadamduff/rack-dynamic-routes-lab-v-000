class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/item/").last
      if @@items.find {|x| x.name == item_title}
        resp.write @@items.find {|x| x.name == item_title}.price
      else
        resp.write "Item not found"
        resp.status 400
      end
    else
      resp.status 404
    end
    resp.finish
  end

end
