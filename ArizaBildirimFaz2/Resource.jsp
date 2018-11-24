<%  ResourceBundle resources;

    String resourceClassName = config.getServletContext().getInitParameter("resourceClassName");
    
    String lang = (String)session.getAttribute("lang");
    if (lang != null && lang.compareTo("Turkish") == 0){
        resources = ResourceBundle.getBundle(resourceClassName, new Locale("TR", "tr"));
    }
    else if (lang != null && lang.compareTo("English") == 0){
        resources = ResourceBundle.getBundle(resourceClassName, new Locale("EN", "en"));
    }
    else{
        resources = ResourceBundle.getBundle(resourceClassName);
    }
    try{
%>