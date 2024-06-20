### Popup function 

from IPython.display import display, HTML

def popup_function_pos(popup_text):
    # Define the HTML, CSS, and JavaScript for the popup
    html_code = f'''
    <style>
    .popup {{
      position: fixed;
      top: 20px;
      right: 20px;
      background-color: #B5DC78;
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      display: none; /* Initially hidden */
      z-index: 9999; /* Ensure it's on top of other content */
      width: 300px; /* Set width of the popup */
    }}

    .popup.show {{
      display: block; /* Show when .show class is added */
    }}
    </style>

    <script>
    // Ensure the popup exists in the body element of the current notebook
    if (!document.getElementById("global-popup")) {{
      var popupDiv = document.createElement("div");
      popupDiv.id = "global-popup";
      popupDiv.className = "popup";
      document.body.appendChild(popupDiv);
    }}

    // Function to show the popup
    function showPopup(message) {{
      var popup = document.getElementById("global-popup");
      popup.innerHTML = message;
      popup.classList.add("show");

      // Automatically hide the popup after 10 seconds (10000 milliseconds)
      setTimeout(function(){{
        popup.classList.remove("show");
      }}, 10000); // Adjust the time interval as needed
    }}

    // Call the function to show the popup immediately with the provided message
    showPopup("{popup_text}");
    </script>
    '''
    
    # Display the HTML in the notebook
    display(HTML(html_code))
    
    
    
def popup_function_info(popup_text):
    # Define the HTML, CSS, and JavaScript for the popup
    html_code = f'''
    <style>
    .popup {{
      position: fixed;
      top: 20px;
      right: 20px;
      background-color: #E7E7E7;
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      display: none; /* Initially hidden */
      z-index: 9999; /* Ensure it's on top of other content */
      width: 300px; /* Set width of the popup */
    }}

    .popup.show {{
      display: block; /* Show when .show class is added */
    }}
    </style>

    <script>
    // Ensure the popup exists in the body element of the current notebook
    if (!document.getElementById("global-popup")) {{
      var popupDiv = document.createElement("div");
      popupDiv.id = "global-popup";
      popupDiv.className = "popup";
      document.body.appendChild(popupDiv);
    }}

    // Function to show the popup
    function showPopup(message) {{
      var popup = document.getElementById("global-popup");
      popup.innerHTML = message;
      popup.classList.add("show");

      // Automatically hide the popup after 10 seconds (10000 milliseconds)
      setTimeout(function(){{
        popup.classList.remove("show");
      }}, 10000); // Adjust the time interval as needed
    }}

    // Call the function to show the popup immediately with the provided message
    showPopup("{popup_text}");
    </script>
    '''
    
    # Display the HTML in the notebook
    display(HTML(html_code))