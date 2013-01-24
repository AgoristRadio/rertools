require "spec_helper"

describe  do

end

=begin
describe Bookcoin::Book do
  before(:all) do
    @book = Bookcoin::Book.first

    @test_file_filename = "The Lady in the Tower_ The Fall of Anne  - Alison Weir.mobi"
    @test_file_path = "/home/x/work/bookcoin/web/books/Biographies and Memoirs/Alison Weir/The Lady in the Tower_ The Fall of Anne  (1)"
    @test_file_pathname = @test_file_path + "/" + @test_file_filename

    @test_image_filename_thumb = "The Lady in the Tower_ The Fall of Anne  - Alison Weir.jpg"
    @test_image_filename_full = "The Lady in the Tower_ The Fall of Anne  - Alison Weir_resizedcover.jpg"
    @test_image_path = "/home/x/work/bookcoin/web/books/Biographies and Memoirs/Alison Weir/The Lady in the Tower_ The Fall of Anne  (1)"

    @test_image_pathname_thumb = @test_image_path + "/" + @test_image_filename_thumb
    @test_image_pathname_full  = @test_image_path + "/" + @test_image_filename_full

    # pp_book()     # Debug only
  end

  describe "A specific book file and image names and paths" do
    it "should have an id of 1" do
      @book.id.should == 1
    end

    it "should have a specific file filename" do
      @book.file_filename.should == @test_file_filename
    end

    it "should have a specific file path" do
      @book.file_path.should == @test_file_path
    end

    it "should have a specific file pathname" do
      @book.file_pathname.should == @test_file_pathname
    end

    it "should have a specific image filename full" do
      @book.image_filename_full.should == @test_image_filename_full
    end

    it "should have a specific image filename thumb" do
      @book.image_filename_thumb.should == @test_image_filename_thumb
    end

    it "should have a specific image path" do
      @book.image_path.should == @test_image_path
    end

    it "should have a specific image pathname full" do
      @book.image_pathname_full.should == @test_image_pathname_full
    end
  end


  describe "its properties" do
    it "should have an id" do
      @book.should respond_to(:id)
    end

    it "should have path" do
      @book.should respond_to(:path)
    end

    it "should have an image full url" do
      @book.should respond_to(:image_full_url)
    end

    it "should have an image thumb url" do
      @book.should respond_to(:image_thumb_url)
    end

    it "should have an image filename full" do
      @book.should respond_to(:image_filename_full)
    end

    it "should have an image filename thumb" do
      @book.should respond_to(:image_filename_thumb)
    end

    it "should have an image pathname full" do
      @book.should respond_to(:image_pathname_full)
    end
    it "should have an image pathname thumb" do
      @book.should respond_to(:image_pathname_thumb)
    end

    it "should have a file filename" do
      @book.should respond_to(:file_filename)
    end

    it "should have a file pathname" do
      @book.should respond_to(:file_pathname)
    end

    it "should have a title" do
      @book.should respond_to(:title)
    end

    it "should have a pubdate" do
      @book.should respond_to(:pubdate)
    end

    it "should have an isbn identifier" do
      @book.should respond_to(:isbn)
    end
    it "should have an amazon identifier" do
      @book.should respond_to(:amazon)
    end
    it "should have a barnesnoble identifier" do
      @book.should respond_to(:barnesnoble)
    end
    it "should have a google identifier" do
      @book.should respond_to(:google)
    end

    it "should have a description" do
      @book.should respond_to(:description)
    end

    it "should have a price" do
      @book.should respond_to(:price)
    end

    it "should have a status" do
      @book.should respond_to(:status)
    end

    it "should have a status id" do
      @book.should respond_to(:status_id)
    end

    it "should have an author" do
      @book.should respond_to(:author)
    end

    it "should have a publisher" do
      @book.should respond_to(:publisher)
    end

    it "should have a download url" do
      @book.should respond_to(:download_url)
    end

    it "should have languages" do
      @book.should respond_to(:languages)
    end

    it "should have categories" do
      @book.should respond_to(:categories)
    end
  end
end

def pp_book
  pp "id: " + @book.id.to_s
  pp "title: " + @book.title
  pp "pubdate: "+@book.pubdate.to_s
  pp "isbn: " + @book.isbn.to_s
  pp "desc: "+@book.description[0..100] + "....."
  pp "price: "+@book.price.to_s
  pp "status: "+@book.status.to_s
  pp "status id: "+@book.status_id.to_s
  pp "author: "+@book.author
  pp "download_url: "+@book.download_url
  pp "languages: "+@book.languages.inspect
  pp "categories: "+@book.categories.inspect
end

=end
