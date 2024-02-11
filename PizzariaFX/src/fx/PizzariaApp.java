package fx;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;

//import javax.swing.text.html.ImageView;
import javafx.scene.image.ImageView;

public class PizzariaApp {
    DB2Test d;
    @FXML
    private ResourceBundle resources;

    @FXML
    private URL location;

    @FXML
    private Button btnBestSellers;

    @FXML
    private Button btnDrinkByName;

    @FXML
    private Button btnClientsByCity;

    @FXML
    private Button btnOrdersByPhoneNum;

    @FXML
    private Button btnPizzaByName;
    @FXML
    private Button btnQuit;

    @FXML
    private TextArea txaResult;

    @FXML
    private TextField txtInput;

//    @FXML
    public ImageView myImageView;
//

    public PizzariaApp() {
        d = new DB2Test();
        d.openConnection();

    }
    @FXML
    void btnBestSellersOnAction(ActionEvent event) {

        String columns = "NAME,  PRICE,  WEIGHT:\n";
        String select = d.select("SELECT NAME,PRICE,WEIGHT FROM FN2MI0700013.PIZZA WHERE PRICE > 15", 3);
        txaResult.setText(columns);
        txaResult.appendText(select);
    }

    @FXML
    void btnDrinkByName(ActionEvent event) {
        String name = txtInput.getText();
        String columns = "NAME,  PRICE,  QUANTITY:\n";
        String select = d.select("SELECT NAME, PRICE, QUANTITY FROM FN2MI0700013.DRINKS WHERE NAME LIKE '%" + name + "%'", 3);
        txaResult.setText(columns);
        txaResult.appendText(select);
    }

    @FXML
    void btnClientsByCityOnAction(ActionEvent event) {
        String city = txtInput.getText();
        String columns = "NAME,  ADDRESS,  PHONE NUMBER:\n";
        String select = d.select("SELECT NAME, ADDRESS, PHONE_NUMBER FROM FN2MI0700013.CLIENT WHERE ADDRESS LIKE '%" + city +"%'",3);
        txaResult.setText(columns);
        txaResult.appendText(select);
    }

    @FXML
    void btnOrdersByPhoneNumOnAction(ActionEvent event) {
        String phoneNum = txtInput.getText();
        String columns = "Number of orders: ";
        String select = d.select("SELECT COUNT (*) FROM FN2MI0700013.ORDER WHERE FN2MI0700013.ORDER.CLIENT_PHONE_NUMBER LIKE '%" + phoneNum +"%'",1);
        txaResult.setText(columns);
        txaResult.appendText(select);
    }

    @FXML
    void btnPizzaByNameOnAction(ActionEvent event) {
        String name = txtInput.getText();
        String columns = "NAME,  PRICE,  WEIGHT:\n";
        String select = d.select("SELECT NAME, PRICE, WEIGHT FROM FN2MI0700013.PIZZA WHERE NAME LIKE '%" + name + "%'", 3);
        txaResult.setText(columns);
        txaResult.appendText(select);
    }
    @FXML
    void btnQuitOnAction(ActionEvent event) {
        Platform.exit();
        d.closeConnection();
    }
    @FXML
    void initialize() {
        assert btnBestSellers != null : "fx:id=\"btnBestSellers\" was not injected: check your FXML file 'pizzaria-app.fxml'.";
        assert btnDrinkByName != null : "fx:id=\"btnDrinkByName\" was not injected: check your FXML file 'pizzaria-app.fxml'.";
        assert btnClientsByCity != null : "fx:id=\"btnClientsByCity\" was not injected: check your FXML file 'pizzaria-app.fxml'.";
        assert btnOrdersByPhoneNum != null : "fx:id=\"btnOrdersByPhoneNum\" was not injected: check your FXML file 'pizzaria-app.fxml'.";
        assert btnPizzaByName != null : "fx:id=\"btnPizzaByName\" was not injected: check your FXML file 'pizzaria-app.fxml'.";
        assert txaResult != null : "fx:id=\"txaResult\" was not injected: check your FXML file 'pizzaria-app.fxml'.";
        assert txtInput != null : "fx:id=\"txtInput\" was not injected: check your FXML file 'pizzaria-app.fxml'.";

    }
}

