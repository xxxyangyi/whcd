/**
 * Created by tuberose on 16-9-6.
 */

/*
 *  InsertID    :   插入位置的DIV 的ID
 *  ModelId     :   模板的 DIV 的 ID
 *  actionName  :   action
 *  PageNo  :   当前的页数
 * */
function pagingStart(InsertID, ModelId, ActionName, isPaging) {
    paging(InsertID, ModelId, ActionName,1,isPaging)
}
function pagingStart2(InsertID, ModelId, PerId, NextId, TotalPageId, ActionName, functionName) {
    paging2(InsertID, ModelId, PerId, NextId, TotalPageId, ActionName, 1, functionName)
}

function paging(InsertID, ModelId, ActionName,PageNo,isPaging) {
    console.log("AJAX 发送请求 " + ActionName+ "  PageNo = "+ PageNo)
    var totelNumber = 0;
    var PageSize = 0;
    var PageNo = PageNo;
    var json = null;
    $.ajax({
        type: "post",
        data: {"PageNo":PageNo},
        url: ActionName,
        async: false,
        dataType: 'json',
        error : function() {
            alert("分页AJAX 出错");
        },
        success: function (msg) {
            console.log(msg);
            totelNumber = msg.rowCount;
            PageSize    = msg.pageSize;
            PageNo      = msg.pageNo;
            json        = msg.result;
        }
    })

    console.log("获取totelNumber---获取PageSize---获取PageNumber")

    $(InsertID).children().remove();
    if(totelNumber==0 || json.length == 0){
        $(InsertID).append("<h4>没有更多数据了</h4>");
        return;

    }
    // 获取数据完成 end

    // 加载页面 ----   加载数据   加载分页

    // 1. 加载数据

    console.log("加载页面");
    var model_html = $(ModelId).html();
    var map = new UtilMap();

    var patt = new RegExp(/[@]{3}[\w._]+[@]{1}/,"gmi");
    var result;
    while ((result = patt.exec(model_html)) != null)  {
        result = result.toString().replace(/([@]{3})([\w._]+)([@]{1})/, "$2");
        console.log(result+"----");
        map.put("@@@"+result+"@",result);
        console.log(map.arr)
    }
    // 进行循环打印
    for (var i = 0; i < json.length; i++) {
        var my_json = json[i];
        var linshiModelHtml = model_html;
        for (var j = 0; j < map.size(); j++) {
            var val = my_json;
            var keyVal = map.getKey(j);
            var keyValArrary =  map.get(keyVal).split('.');
            for(var i1= 0; i1<keyValArrary.length;i1++){
                val = val[keyValArrary[i1]];
            }
            linshiModelHtml = (linshiModelHtml.replace(keyVal, val)).toString();
        }

        $(InsertID).append(linshiModelHtml);

    }

    // 2 加载 分页信息
    if(isPaging==false){

    }else{
        console.log(Math.ceil(totelNumber/PageSize));

        var html = getPagingHtmlString(InsertID, ModelId,ActionName,Math.ceil(totelNumber/PageSize),PageNo)

        $(InsertID).append(html);
    }
}


// 总页数  当前页数  之前的页数
function getPagingHtmlString(InsertID, ModelId,ActionName,PageNumber,PageNo) {

    var html_head = '';
    var html_body = '';
    var html_foot = '';
    var PAGESIZE = 5;
    var position = PageNo % PAGESIZE;
    position == 0 ? position = PAGESIZE : position = position ;

    for(var i = 0; i < PAGESIZE; i++){
        var number = PageNo+(1 - position + i);
        if (number > PageNumber){
            html_body += '<li class="disabled" ><a>&nbsp&nbsp</a></li>';
        }else{
            if((1 - position + i) == 0){
                html_body += '<li class="active"><a>'+ number +'</a></li>';
            }else{
                html_body += (
                '<li><a href="javascript:paging(\''+InsertID+'\',\''+ModelId+'\',\''+ActionName+'\','+number+')">'+ number +'</a></li>');
            }
        }
    }
    if((PageNo-position)<=0){
        html_head = '<nav class="col-lg-6 col-lg-offset-4 col-md-6 col-md-offset-4"><ul class="pagination"><li class="disabled" ><a >Prev</a></li>' ;
    }else{
        html_head = '<nav><ul class="pagination"><li><a href="javascript:paging(\''+InsertID+'\',\''+ModelId+'\',\''+ActionName+'\','+(PageNo-position)+')">Prev</a></li>' ;
    }

    if((PageNo-position+PAGESIZE+1)>PageNumber){
        html_foot = '<li class="disabled" ><a >Next</a></li></ul></nav>';
    }else{
        html_foot = '<li><a href="javascript:paging(\''+InsertID+'\',\''+ModelId+'\',\''+ActionName+'\','+(PageNo-position+PAGESIZE+1)+')">Next</a></li></ul></nav>';

    }
    return html_head+html_body+html_foot;

}


function paging2(InsertID, ModelId, PerId, NextId, TotalPageId, ActionName, PageNo ,functionName) {
    var totelNumber = 0;
    var PageSize = 0;
    var PageNo = PageNo;
    var json = null;
    $.ajax({
        type: "post",
        data: {"pageNo":PageNo},
        url: ActionName,
        async: false,
        dataType: 'json',
        error : function() {
            alert("paging2 分页AJAX 出错");
        },
        success: function (msg) {
            console.log(msg);
            totelNumber = msg.rowCount;
            PageSize    = msg.pageSize;
            PageNo      = msg.pageNo;
            json        = msg.result;
        }
    })

    console.log("获取totelNumber---获取PageSize---获取PageNumber")

    $(InsertID).children().remove();
    if(totelNumber==0 || json.length == 0){
        alert("<h4>没有更多数据了</h4>");
        return;
    }
    // 获取数据完成 end
    // 加载页面 ----   加载数据   加载分页

    // 1. 加载数据

    console.log("加载页面");
    var model_html = $(ModelId).html();
    var map = new UtilMap();

    var patt = new RegExp(/[@]{3}[\w._]+[@]{1}/,"gmi");
    var result;
    while ((result = patt.exec(model_html)) != null)  {
        result = result.toString().replace(/([@]{3})([\w._]+)([@]{1})/, "$2");
        console.log(result+"----");
        map.put("@@@"+result+"@",result);
        console.log(map.arr)
    }
    // 进行循环打印
    for (var i = 0; i < json.length; i++) {
        var my_json = json[i];
        var linshiModelHtml = model_html;
        for (var j = 0; j < map.size(); j++) {
            var val = my_json;
            var keyVal = map.getKey(j);
            var keyValArrary =  map.get(keyVal).split('.');
            for(var i1= 0; i1<keyValArrary.length;i1++){
                val = val[keyValArrary[i1]];
            }
            linshiModelHtml = (linshiModelHtml.replace(keyVal, val)).toString();
        }

        $(InsertID).append(linshiModelHtml);

    }

    // 2 加载 分页信息
    console.log(Math.ceil(totelNumber/PageSize));
    var html = getPagingHtmlString2(InsertID, ModelId, PerId, NextId, TotalPageId, ActionName, Math.ceil(totelNumber/PageSize),PageNo,functionName)
    $(InsertID).append(html);

    if(functionName != null){
        console.log("paging2中 调用了方法");
        var func=eval(functionName);

    }else {
        console.log("paging2中 没有调用方法");
    }
}

// 总页数  当前页数  之前的页数
function getPagingHtmlString2(InsertID, ModelId, PerId, NextId, TotalPageId, ActionName, PageNumber, PageNo, functionName) {
    $(PerId).children().remove();
    $(NextId).children().remove();
    $(TotalPageId).children().remove();
    var per = PageNo - 1;
    var next = PageNo + 1;
    if(per > 0){
        $(PerId).append('<button type="button" class="btn btn-default btn-sm" ' +
            'onclick="paging2(\''+InsertID+'\',\''+ModelId+'\',\''+PerId+'\',\''+NextId+'\',\''+TotalPageId+'\',\''+ActionName+'\',\''+per+'\',\''+functionName+'\')">前一页</button>')
    }else {
        $(PerId).append('<button type="button" class="btn btn-default btn-sm" disabled="disabled">前一页</button>')
    }
    if(PageNumber - next >= 0){
        $(NextId).append('<button type="button" class="btn btn-default btn-sm" ' +
            'onclick="paging2(\''+InsertID+'\',\''+ModelId+'\',\''+PerId+'\',\''+NextId+'\',\''+TotalPageId+'\',\''+ActionName+'\',\''+next+'\',\''+functionName+'\')">后一页</button>')
    }else {
        $(NextId).append('<button type="button" class="btn btn-default btn-sm" disabled="disabled" >后一页</button>')
    }
    $(TotalPageId).append('<span>'+PageNo + "/" + PageNumber + ' 页</span>');
}








































///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
// MAP  方法
function UtilMap() {
    var struct = function (key, value) {
        this.key = key;
        this.value = value;
    };

    var put = function (key, value) {
        // for (var i = 0; i < this.arr.length; i++) {
        //     if (this.arr[i].key === key) {
        //         this.arr[i].value = value;
        //         return;
        //     }
        // }
        this.arr[this.arr.length] = new struct(key, value);
    };

    var get = function (key) {
        for (var i = 0; i < this.arr.length; i++) {
            if (this.arr[i].key === key) {
                return this.arr[i].value;
            }
        }
        return null;
    };
    var getKey = function (index) {
        if (index > -1 && index < this.arr.length) {
            return this.arr[index].key;
        }
        return null;
    };
    var remove = function (key) {
        var v;
        for (var i = 0; i < this.arr.length; i++) {
            v = this.arr.pop();
            if (v.key === key) {
                continue;
            }
            this.arr.unshift(v);
        }
    };

    var size = function () {
        return this.arr.length;
    };

    var isEmpty = function () {
        return this.arr.length <= 0;
    };
    this.arr = new Array();
    this.get = get;
    this.getKey = getKey;
    this.put = put;
    this.remove = remove;
    this.size = size;
    this.isEmpty = isEmpty;
}