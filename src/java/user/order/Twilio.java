
package user.order;
import java.util.*; 
import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*; 
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class Twilio {
   public static String mobile;
   public static String name;
   public static int ordno;
    
 public static final String ACCOUNT_SID = "AC0619e5640e981b48a720140ac4380282"; 
 public static final String AUTH_TOKEN = "1563abdfbb3bf96084f6845e4364781d"; 

    public Twilio(String mobile, String  name, int ordno) {
        this.mobile = mobile;
        this.name = name;
        this.ordno = ordno;
    }
   
    public void sendMessage() throws TwilioRestException {
     TwilioRestClient client = new TwilioRestClient("AC0619e5640e981b48a720140ac4380282","1563abdfbb3bf96084f6845e4364781d"); 
     List<NameValuePair> params = new ArrayList<NameValuePair>(); 
     params.add(new BasicNameValuePair("To", "+91"+mobile+"")); 
   params.add(new BasicNameValuePair("From", "+12563045527")); 
   params.add(new BasicNameValuePair("Body", "Hey "+name+"! Thanks for shopping your order no is "+ordno+"")); 
   params.add(new BasicNameValuePair("MediaUrl", "http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg"));  
 
   MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
   Message message = messageFactory.create(params); 
   System.out.println(message.getSid());    
        
    }
    
    
}
