require 'pp'
class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  def loadStories
    Dir.glob("#{Rails.root}/stories/*.yml") do |storyData|
      y=YAML.load_file(storyData)
      y=y[File.basename(storyData,'.*')]
      story=Story.find_by_name(File.basename(storyData,'.*'))
      if story.nil?
        story=Story.new
      end
      authors=[]

      fauthors=y["author"]
      fauthors.each do |fauthor|

        authorDb=Author.find_by_name(fauthor)
        if authorDb.nil?
          authorDb=Author.new({name: fauthor, details: ""})
          authorDb.save!
        end
        authors+=[authorDb]
      end
      fcategorys=y["category"]
      categories=[]
      fcategorys.each do |fcategory|
        categoryDb=Category.find_by_name(fcategory)
        if categoryDb.nil?
          categoryDb=Category.new({name: fcategory,details: ""})
          categoryDb.save!
        end
        categories+=[categoryDb]
      end
      ftags=y["tags"]
      tags=[]
      ftags.each do |ftag|
        tagDb=Tag.find_by_name(ftag)
        if tagDb.nil?
          tagDb=Tag.new({name: ftag})
          tagDb.save!
        end
        tags+=[tagDb]
      end
      story.tags=tags
      story.categories=categories
      story.authors=authors
      story.title=y["title"]
      story.name=File.basename(storyData,'.*')
      story.description=y["description"]
      #Sort out chapters now
      chapters=[]
      fchapters=y["chapters"]
      fchapters.each do |number,name|
          pp "Chapter: #{number} Name: #{name}"
          chapter=Chapter.new({name: name,number: number})
          chapter.save!
          chapters+=[chapter]
      end
      story.chapters=chapters
      story.save!
      pp story
    end
    

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:name, :description)
    end
end
