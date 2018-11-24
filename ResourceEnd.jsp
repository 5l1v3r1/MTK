<%  }
    catch (MissingResourceException e){
        response.sendRedirect("/MTK/Error.jsp?message=hata 123" + URLEncoder.encode(e.getMessage()));
    }
    
    catch (Exception e){
        response.sendRedirect("/MTK/Error.jsp?message= hata hata" + URLEncoder.encode(e.getMessage()));
    }
    
%>