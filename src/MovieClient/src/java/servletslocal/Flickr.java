package servletslocal;

import java.awt.Image;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


/**
* Return an Icon for the first Flickr photo that matches a query string.
* Typical usage:
* <pre>
* Icon image = Flickr.getInstance().search("face");
* myLabel.setIcon(image);
* </pre>
*
*/

public class Flickr {
   private static Flickr theInstance = null;
   private final Logger logger;
   private final DocumentBuilder xmlParser;
   private static String apiKey;
   private static final String PROP_FILE = Flickr.class.getSimpleName().toLowerCase() + ".properties";
   
   static {
        try {
            Properties props = new Properties();
            props.load(Flickr.class.getResourceAsStream(PROP_FILE));
            apiKey = props.getProperty("api_key");
        } catch (IOException ex) {
            Logger.getLogger(Flickr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   /* URL format string that specifies a single "medium" sized photo on
    * the Flickr server.  Based on the URL syntax documented here:
    * http://www.flickr.com/services/api/misc.urls.html, i.e.
    * http://farm{farm-id}.static.flickr.com/{server-id}/{id}_{secret}_[mstb].jpg"
    */
   private final String photoURLFormat =
       "http://farm%s.static.flickr.com/%s/%s_%s.jpg";

   /* An HTTP get format string for looking up a single "Photo" that matches
    * a query string.  This request is documented on the Yahoo/Flickr
    * site here: http://www.flickr.com/services/api/flickr.photos.search.html
    */
   private final String searchMethodFormat =
       "https://api.flickr.com/services/rest/?method=flickr.photos.search" +
       "&format=rest" +
       "&api_key=" +apiKey+
       "&per_page=12" +        // Send back 12 images.
       "&sort=interestingness-desc" +
       "&text=%s";

   Flickr() throws ParserConfigurationException {
       logger = Logger.getLogger(Flickr.class.getName());
       DocumentBuilderFactory dcb = DocumentBuilderFactory.newInstance();
       this.xmlParser = dcb.newDocumentBuilder();
   }

   public static Flickr getInstance() {
       if (theInstance == null) {
           try {
               theInstance = new Flickr();
           }
           catch (ParserConfigurationException e) {
               throw new Error("fatal error", e);
           }
       }
       return theInstance;
   }

   private URL newURL(String s) {
       try {
           return new URL(s);
       }catch (MalformedURLException e) {
           logger.log(Level.WARNING, String.format("bad URL \"%s\"", s), e);
           return null;
       }
   }

   private Document getPage(URL url) {
       Document doc = null;
       try {
           doc = xmlParser.parse(url.toString());
       }catch (SAXException e) {
           logger.log(Level.WARNING, String.format("can't parse value of  URL \"%s\"", url), e);
       }catch (IOException e) {
           logger.log(Level.WARNING, String.format("can't load value of  URL \"%s\"", url), e);
       }
       return doc;
   }

   private List<Element> elementsWithTag(Document doc, String tag) {
       NodeList nodes = doc.getElementsByTagName(tag);
       if ((nodes != null) && (nodes.getLength() > 0)) {
           List<Element> elements = new ArrayList<Element>(nodes.getLength());
           for(int i = 0; i < nodes.getLength(); i++) {
               elements.add((Element)(nodes.item(i)));
           }
           return elements;
       }
       else {
           logger.warning(String.format("no elements with tag \"%s\" at \"%s\"", tag, doc.getDocumentURI()));
           return null;
       }
   }

   private String elementAttribute(Element elt, String attribute) {
       String s = elt.getAttribute(attribute);
       return (s.length() == 0) ? null : s;
   }


   public URL[] search(String keyword) {
       
       URL[] FlickrResult = new URL[0];
       ArrayList<URL> urlList = new ArrayList<URL>();
       String newKeyword = keyword;
       URL searchURL = newURL(String.format(searchMethodFormat, newKeyword));
       URL imageURL = null;
       if (searchURL == null) {
           return FlickrResult;
       }
       Document doc = getPage(searchURL);
       if (doc == null) {
           return FlickrResult;
       }
       List<Element> elts = elementsWithTag(doc, "photo");
       if (elts == null) {
           return FlickrResult;
       }
       
       for (int i = 0; i < elts.size(); i++) {
           
            Element elt = elts.get(i);
            String farm = elementAttribute(elt, "farm");
            String server = elementAttribute(elt, "server");
            String id = elementAttribute(elt, "id");
            String secret = elementAttribute(elt, "secret");
            
            Image image = null;
            if ((farm != null) && (server != null) && (id != null) && (secret != null)) {
            imageURL = newURL(String.format(photoURLFormat, farm, server, id, secret));
            if (imageURL != null) {
                urlList.add(imageURL);
               try {
                   image = ImageIO.read(imageURL);
               }catch (IOException e) {
                   logger.log(Level.WARNING, String.format("couldn't load \"%s\"", imageURL), e);
               }
           }
          }  
        }     
       FlickrResult = new URL[urlList.size()];
       urlList.toArray(FlickrResult);
       return FlickrResult;
   } 
}
