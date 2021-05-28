class Application
  def call(env)
    req = Rack::Request.new(env)

    if req.path.match(/hello/)
      send_hello
    else
      send_not_found
    end
  end

  private

  def send_hello
    return [200, { "Content-Type" => "application/json" }, [{ :message => "hello world!" }.to_json]]
  end

  def send_not_found
    return [404, {}, ["Path not found!!!"]]
  end
end
