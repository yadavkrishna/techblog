function doComment(pid,uid){
    
    console.log(pid+","+uid);
    const d={
        uid: uid,
        pid: pid,
        }
    $.ajax({
        url:"CommentServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
           console.log(data);
            console.log(uid,pid);
            
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
          
        }
        
    })
    
    
    
}


