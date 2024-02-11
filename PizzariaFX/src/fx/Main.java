package fx;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends javafx.application.Application {

    @java.lang.Override
    public void start(javafx.stage.Stage stage) throws java.lang.Exception {
        javafx.scene.Parent root
                = javafx.fxml.FXMLLoader.load(getClass().getResource("pizzaria-app.fxml"));

        javafx.scene.Scene scene = new javafx.scene.Scene(root);

        // Set the Window title
        stage.setTitle("Pizzaria");
        stage.sizeToScene();
        stage.resizableProperty().setValue(java.lang.Boolean.FALSE);
        stage.setScene(scene);
        stage.show();
    }

    public static void main(java.lang.String[] args) {
        launch(args);
    }
}