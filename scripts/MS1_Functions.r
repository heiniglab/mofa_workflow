### Function for quantile normalization

quantile_normalization = function(X){
  ranks = apply(X, 2, rank, ties.method = 'min')  # determine ranks of each entry
  
  sorted = data.frame(apply(X, 2, sort)) # sort the entries
  means = apply(sorted, 1, mean) # calculate the means
  
  normalized_data = apply(ranks, 2 ,function(x){ means[x]}) # substitute the means into ranks matrix
}



### Gene wise quantile normalization


stdnorm <- function(x) {
  set.seed(42)
  r = rank(x[!is.na(x)], ties.method="average")
  x[!is.na(x)] = qnorm(r / (length(x[!is.na(x)]) + 1))
  return(x)
}



### Pathway Enrichment Function

run_enrichment_pathway =function(model, # MOFA Model
                         views = views,  # dimensions for which to run
                         factor_set,  # list of factors for which to run the enrichment
                         use_statistic,  # which statistic to use
                         feature_set, # Pathway Feature Set mapping
                         min_size, # Min size of genes within a pathway
                         use_test, # test used for calculating p-value
                         p_val_cutoff, # p-value cutoff used
                         enrichment_result_p_val){
    
    set.seed(1)

    for(i in  views){

        ### All

        enrichment.parametric = run_enrichment(model,
          view = i , factors = factor_set,
          set.statistic = c(use_statistic),
          feature.sets = feature_set,
          min.size = min_size,
          sign = "all",   # alternatives: positive, negative, all
          statistical.test =  use_test, # alternatives: "parametric", "cor.adj.parametric", "permutation".
          alpha = p_val_cutoff # defines the p-value cutoff for significant pathways
        )

        result_data_adj = enrichment.parametric$pval.adj
        result_data = enrichment.parametric$pval

        result_data_adj = as.data.frame(result_data_adj)
        result_data_adj$pathway = rownames(result_data_adj)

        result_data = as.data.frame(result_data)
        result_data$pathway = rownames(result_data)


        result_data_adj = melt(as.data.frame(result_data_adj)) %>% dplyr::rename(padj=value)
        result_data = melt(as.data.frame(result_data)) %>% dplyr::rename(p=value)

        result_data <- data.frame(result_data, padj=result_data_adj$padj)

        result_data$view = i
        result_data$enrichment = 'all'

        enrichment_result_p_val = rbind(enrichment_result_p_val, result_data)

        ### Negative

        enrichment.parametric = run_enrichment(model,
          view = i , factors =factor_set,
          set.statistic = c(use_statistic),
          feature.sets = feature_set,
          min.size = min_size,
          sign = "negative",   # alternatives: positive, negative, all
          statistical.test = use_test,
          alpha = p_val_cutoff # defines the p-value cutoff for significant pathways
        )

        result_data_adj = enrichment.parametric$pval.adj
        result_data = enrichment.parametric$pval

        result_data_adj = as.data.frame(result_data_adj)
        result_data_adj$pathway = rownames(result_data_adj)

        result_data = as.data.frame(result_data)
        result_data$pathway = rownames(result_data)


        result_data_adj = melt(as.data.frame(result_data_adj)) %>% dplyr::rename(padj=value)
        result_data = melt(as.data.frame(result_data)) %>% dplyr::rename(p=value)

        result_data <- data.frame(result_data, padj=result_data_adj$padj)

        result_data$view = i
        result_data$enrichment = 'negative'

        enrichment_result_p_val = rbind(enrichment_result_p_val, result_data)


        ### Positive

        enrichment.parametric = run_enrichment(model,
          view = i , factors =factor_set,
          set.statistic = c(use_statistic),
          feature.sets = feature_set,
          min.size = min_size,
          sign = "positive",   # alternatives: positive, negative, all
          statistical.test =  use_test,
          alpha = p_val_cutoff  # defines the p-value cutoff for significant pathways
        )

        result_data_adj = enrichment.parametric$pval.adj
        result_data = enrichment.parametric$pval

        result_data_adj = as.data.frame(result_data_adj)
        result_data_adj$pathway = rownames(result_data_adj)

        result_data = as.data.frame(result_data)
        result_data$pathway = rownames(result_data)


        result_data_adj = melt(as.data.frame(result_data_adj)) %>% dplyr::rename(padj=value)
        result_data = melt(as.data.frame(result_data)) %>% dplyr::rename(p=value)

        result_data <- data.frame(result_data, padj=result_data_adj$padj)

        result_data$view = i
        result_data$enrichment = 'positive'

        enrichment_result_p_val = rbind(enrichment_result_p_val, result_data)
      
        }
    
    ### correct for multiple testing
    enrichment_result_p_val$global_FDR = p.adjust(enrichment_result_p_val$p, "BH")
    return(enrichment_result_p_val)
}


# Define the JavaScript for the popup
popup_alert = function(popup_text){
    javascript_code <- paste0('
    alert("', popup_text, '");
    ')

    # Display the JavaScript to trigger the alert
    IRdisplay::display_javascript(data = javascript_code)
    }



popup_function_pos <- function(popup_text) {
    # Define the HTML, CSS, and JavaScript for the popup
    html_code <- paste0('
    <style>
    .popup {
      position: fixed;
      top: 10px;
      right: 20px;
      background-color: #B5DC78;
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      display: none; /* Initially hidden */
      z-index: 9999; /* Ensure it\'s on top of other content */
      width: 300px; /* Set width of the popup */
    }

    .popup.show {
      display: block; /* Show when .show class is added */
    }
    </style>

    <script>
    // Function to show the popup
    function showPopup(message) {
      var popup = document.getElementById("global-popup");
      if (!popup) {
        // Inject the popup into the top-level body element if it doesn\'t exist
        popup = document.createElement("div");
        popup.id = "global-popup";
        popup.className = "popup";
        document.body.appendChild(popup);
      }
      popup.innerHTML = message;
      popup.classList.add("show");

      // Automatically hide the popup after 10 seconds (10000 milliseconds)
      setTimeout(function(){
        popup.classList.remove("show");
      }, 10000); // Adjust the time interval as needed
    }

    // Call the function to show the popup immediately with the provided message
    showPopup("', popup_text, '");
    </script>
    ')

    # Display the HTML in the notebook
    IRdisplay::display_html(html_code)
}



popup_function_info <- function(popup_text) {
    # Define the HTML, CSS, and JavaScript for the popup
    html_code <- paste0('
    <style>
    .popup {
      position: fixed;
      top: 10px;
      right: 20px;
      background-color: #E7E7E7;
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      display: none; /* Initially hidden */
      z-index: 9999; /* Ensure it\'s on top of other content */
      width: 300px; /* Set width of the popup */
    }

    .popup.show {
      display: block; /* Show when .show class is added */
    }
    </style>

    <script>
    // Function to show the popup
    function showPopup(message) {
      var popup = document.getElementById("global-popup");
      if (!popup) {
        // Inject the popup into the top-level body element if it doesn\'t exist
        popup = document.createElement("div");
        popup.id = "global-popup";
        popup.className = "popup";
        document.body.appendChild(popup);
      }
      popup.innerHTML = message;
      popup.classList.add("show");

      // Automatically hide the popup after 10 seconds (10000 milliseconds)
      setTimeout(function(){
        popup.classList.remove("show");
      }, 10000); // Adjust the time interval as needed
    }

    // Call the function to show the popup immediately with the provided message
    showPopup("', popup_text, '");
    </script>
    ')

    # Display the HTML in the notebook
    IRdisplay::display_html(html_code)
}



popup_function_neg <- function(popup_text) {
    # Define the HTML, CSS, and JavaScript for the popup
    html_code <- paste0('
    <style>
    .popup {
      position: fixed;
      top: 10px;
      right: 20px;
      background-color: #DB2626;
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      display: none; /* Initially hidden */
      z-index: 9999; /* Ensure it\'s on top of other content */
      width: 300px; /* Set width of the popup */
    }

    .popup.show {
      display: block; /* Show when .show class is added */
    }
    </style>

    <script>
    // Function to show the popup
    function showPopup(message) {
      var popup = document.getElementById("global-popup");
      if (!popup) {
        // Inject the popup into the top-level body element if it doesn\'t exist
        popup = document.createElement("div");
        popup.id = "global-popup";
        popup.className = "popup";
        document.body.appendChild(popup);
      }
      popup.innerHTML = message;
      popup.classList.add("show");

      // Automatically hide the popup after 10 seconds (10000 milliseconds)
      setTimeout(function(){
        popup.classList.remove("show");
      }, 10000); // Adjust the time interval as needed
    }

    // Call the function to show the popup immediately with the provided message
    showPopup("', popup_text, '");
    </script>
    ')

    # Display the HTML in the notebook
    IRdisplay::display_html(html_code)
}

