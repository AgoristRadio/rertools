class Wordpress

  require 'xmlrpc/client'
  require 'xmlrpc/client'

  module XMLRPCWorkAround
    def do_rpc(request, async=false)
      data = super
      #puts data.encoding.name
      data.force_encoding("UTF-8")
      #puts data.encoding.name
      data
    end
  end

  def initialize(host, user, pass)
    @host = host
    @user = user
    @pass = pass

    @server = XMLRPC::Client.new2(@host)
    @server.extend(XMLRPCWorkAround)
    Encoding.default_external = "UTF-8"
  end

  def upload_file(post_data)
    @server.call('wp.uploadFile', 1, @user, @pass, post_data)
  end

  def get_recent_post_titles(count=100)
    puts count
    @server.call('mt.getRecentPostTitles', 1, @user, @pass, count)
  end

  def get_post(post_id)
    @server.call('metaWeblog.getPost', post_id, @user, @pass)
  end

  def get_random_text_post
    posts = get_recent_post_titles

    p = posts[rand(posts.count)]

=begin
      {"dateCreated"=>#<XMLRPC::DateTime:0x94b33a0 @year=2011, @month=5, @day=19, @hour=14, @min=30, @sec=17>,
        "userid"=>"1",
        "postid"=>29,
        "description"=>"http://www.darkreading.com/advanced-threats/167901091/security/attacks-breaches/229500805/stuxnet-how-it-happened-and-how-your-enterprise-can-avoid-similar-attacks.html",
        "title"=>"Stuxnet: How It Happened And How Your Enterprise Can Avoid Similar Attacks",
        "link"=>"http://jog_loc/?p=29",
        "permaLink"=>"http://jog_loc/?p=29",
        "categories"=>["link"],
        "mt_excerpt"=>"",
        "mt_text_more"=>"",
        "mt_allow_comments"=>1,
        "mt_allow_pings"=>1,
        "mt_keywords"=>"hacking",
        "wp_slug"=>"stuxnet-how-it-happened-and-how-your-enterprise-can-avoid-similar-attacks-darkreading",
        "wp_password"=>"",
        "wp_author_id"=>"1",
        "wp_author_display_name"=>"admin",
        "date_created_gmt"=>#<XMLRPC::DateTime:0x947562c @year=2011, @month=5, @day=19, @hour=14, @min=30, @sec=17>,
        "post_status"=>"publish",
        "custom_fields"=>[{"id"=>"39",
                            "key"=>"_edit_last",
                            "value"=>"1"}, {"id"=>"41",
                            "key"=>"_edit_lock",
                            "value"=>"1305815435:1"}, {"id"=>"43",
                            "key"=>"_oembed_d528f9af5a8a0d5b90f4777ea54ff82a",
                            "value"=>"{{unknown}}"}],
        "wp_post_format"=>"standard", "sticky"=>false}
=end

    get_post(p["postid"])
  end

  def new_post(post)
    #begin
    publish = false
      @server.call('metaWeblog.newPost', 1, @user, @pass, post, publish)
     # true
    #rescue
     # false
    #end
  end

  def delete(post_id)
    @server.call('blogger.deletePost', '', post_id, @user, @pass)
  end

  def get_recent_post_titles(count=100)
    begin
      @server.call('mt.getRecentPostTitles', 1, @user, @pass, count)

    rescue XMLRPC::FaultException => e
      #puts "Error:"
      #puts e.faultCode
      #puts e.faultString
      if e.faultString == "Either there are no posts, or something went wrong."
        return []
      end
    end
  end
end