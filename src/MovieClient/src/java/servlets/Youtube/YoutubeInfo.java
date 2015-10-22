
package servlets.Youtube;

/**
 *
 * @author Hugh
 */
public class YoutubeInfo {
    
    private String VideoTitle;
    private String VideoID;
    private String ThumbnailURL;
    
    public YoutubeInfo(String videotitle, String videoURL, String thumbnailURL)
    {
        setVideoTitle(videotitle);
        setVideoID(videoURL);
        setThumbnailURL(thumbnailURL);
    }
    
    public YoutubeInfo()
    {
       setVideoTitle(null);
       setVideoID(null);
       setThumbnailURL(null);
    }
    
    public void setVideoTitle(String videotitle)
    {
        this.VideoTitle = videotitle;
    }
    
    public void setVideoID(String videoURL)
    {
        this.VideoID = videoURL;
    }
    
    public void setThumbnailURL(String thumbnailURL)
    {
        this.ThumbnailURL = thumbnailURL;
    }
    
    public String getVideoTitle()
    {
       return this.VideoTitle;
    }
 
    public String getVideoID()
    {
       return this.VideoID;
    }
    
    public String getThumbnailURL()
    {
       return this.ThumbnailURL;
    }
    
    
    public String getTrueVideoURL(){
        String trueVideoURL = null;
        trueVideoURL = "https://www.youtube.com/embed/" + this.getVideoID();
        return  trueVideoURL;
    }

}