import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        try {
            // URL to fetch data from
            String urlString = "https://forms.whitworth.edu/calendar/event/detail/5102";

            // Fetch HTML content from the URL
            Document doc = Jsoup.connect(urlString).get();

            // Extract date, time, location, and description from the HTML content
            String title = doc.select("h4").first().text();
            String date = doc.select("h5").first().text(); // Select the first h5 element for the date
            String time = doc.select(".prop").first().text(); // Select the first element with class 'prop' for the time
            String location = doc.select(".val").first().text(); // Select the first element with class 'val' for the location
            Element descriptionTitleElement = doc.select("p.description").first(); // Select the first p element with class 'description' for the description
            
            // Select all paragraphs following the description title until the next heading (h4, h5, etc.)
            Elements descriptionParagraphs = descriptionTitleElement.parent().select("p.description ~ p:not(:has(h4,h5,h6))");

            // Build the description by concatenating all selected paragraphs
            StringBuilder descriptionBuilder = new StringBuilder();
            for (Element paragraph : descriptionParagraphs) {
                descriptionBuilder.append(paragraph.text()).append("\n");
            }
            String description = descriptionBuilder.toString().trim();

            // Print the extracted elements
            System.out.println("Title: " + title);
            System.out.println("Date: " + date);
            System.out.println("Time: " + time);
            System.out.println("Location: " + location);
            System.out.println("Description: " + description);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
