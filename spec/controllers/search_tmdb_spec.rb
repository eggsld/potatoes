require 'spec_helper'
 
describe MoviesController do
  describe 'searching TMDb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'should call the model method that performs TMDb search' do
      Movie.should_receive(:find_in_tmdb).with('hardware').
        and_return(@fake_results)
      post :search_tmdb, {:search_terms => 'hardware'}
    end

  describe 'searching Tmdb by keyword' do
    it 'should call Tmdb with title keywords given valid API key' do
      TmdbMovie.should_receive(:find).
        with(hash_including :title => 'Inception')
      Movie.find_in_tmdb('Inception')
    end
    it 'should raise an InvalidKeyError with no API key' do
      Movie.stub(:api_key).and_return('')
      lambda { Movie.find_in_tmdb('Inception') }.
        should raise_error(Movie::InvalidKeyError)
    end
    it 'should raise an InvalidKeyError with invalid API key' do
      TmdbMovie.stub(:find).
        and_raise(RuntimeError.new("API returned status code '404'"))
      lambda { Movie.find_in_tmdb('Inception') }.
        should raise_error(Movie::InvalidKeyError)
    end
  end

  describe 'after valid search' do
      before :each do
        Movie.stub(:find_in_tmdb).and_return(@fake_results)
        post :search_tmdb, {:search_terms => 'hardware'}
      end
      it 'should select the Search Results template for rendering' do
        response.should render_template('search_tmdb')
      end
      it 'should make the TMDb search results available to that template' do
        assigns(:movies).should == @fake_results
      end
    end
  end
end
