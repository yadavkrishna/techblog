function doComment(pid,uid){
     console.log(pid+","+uid);
    const d={
        uid: uid,
        pid: pid,
        operation:'comment'
    }
    $.ajax({
        url:"CommentServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
           console.log(data);
            if(data.trim()=="done"){
                let c=$(".cmtCounter").html();
                c++;
                $(".cmtCounter").html(c);
            }
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
          
        }
        
    })
    
    
    
}
