import QtQuick 2.4

Search_PageForm{
    search_button.onClicked: {
        console.log("Button Pressed. Entered text: " + search_text_field.text);
        searchResults.url = "https://www.google.it/search?q="+search_text_field.text;
    }
}
