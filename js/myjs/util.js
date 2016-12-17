function getXHR(){  
    var xmlHttp;  
    try {  
        xmlHttp=new XMLHttpRequest();  
    }catch(e)  
    {  
        try{  
            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");  
        }  
        catch(e)  
        {  
            try{  
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");  
            }  
            catch(e)  
            {  
                alert("your browser does not support ajax");  
                return false;  
            }  
              
        }  
          
    }  
    return xmlHttp;  
}  