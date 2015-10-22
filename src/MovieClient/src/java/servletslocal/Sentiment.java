package servletslocal;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.net.URLEncoder;
import java.util.Properties;
import net.sf.json.JSONObject;
/**
 *
 * @author Hugh
 */
public class Sentiment {
     private static String apiKey;
     private static final String PROP_FILE = Sentiment.class.getSimpleName().toLowerCase() + ".properties";
     private static String text = "";
     static {
        try {
            Properties props = new Properties();
            props.load(Sentiment.class.getResourceAsStream(PROP_FILE));
            apiKey = props.getProperty("api_key");
        } catch (IOException ex) {
           Logger.getLogger(Flickr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    public static double getPositiveProbability(String keyword) throws Exception
    {
        String prob = "0.0";
        String moviekeyword = keyword+" movie";
        String newKeyword = URLEncoder.encode(keyword, "utf-8");
        System.out.println("the searched keyword is: " + newKeyword);
         try{
             URL url = new URL(
                    "https://app.viralheat.com/social/api/sentiment?api_key=" + apiKey + "&text=" + newKeyword);

            HttpURLConnection connToVirakheat = (HttpURLConnection) url.openConnection();
            connToVirakheat.setRequestMethod("GET");
            connToVirakheat.setRequestProperty("Accept", "application/json");
            
            InputStream in = connToVirakheat.getInputStream();
                InputStreamReader inReader = new InputStreamReader(in, "utf-8");
                BufferedReader readerFromViralheat = new BufferedReader(inReader);
                StringBuffer stringBufferFromViralheat = new  StringBuffer();
                String lineFromGoogle = "";
                while ((lineFromGoogle = readerFromViralheat.readLine()) != null) {
                    stringBufferFromViralheat.append(lineFromGoogle);
                }
                String jsonStringFromViralheat = stringBufferFromViralheat.toString();
                System.out.println(jsonStringFromViralheat);
                JSONObject jo = JSONObject.fromObject(jsonStringFromViralheat);                
                prob = jo.getString("prob");
                }catch (Exception ex) {
                Logger.getLogger(Sentiment.class.getName()).log(Level.SEVERE, null, ex);
                System.err.println("There was an IO error: " + ex.getCause() + " : " + ex.getMessage());
                }
                double probability = Double.parseDouble(prob);
                return probability;
    }  
}
