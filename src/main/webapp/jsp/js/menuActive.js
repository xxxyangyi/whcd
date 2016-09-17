/**
 * Created by tuberose on 16-9-15.
 *
 * 描述使用方法:
 * 1.   每个页面  头部添加标签
 * '<pageid name="pageID" ></pageid>'
 *      pageID 是每个页面的标识符。
 *
 * 2.   在meun 的div 上 引用此方法
 *
 * 3.   此方法会检索标 meun active 属性是否和 pageID 相同，若是相同，则激活，否则不激活。
 *
 */

// $(document).ready(
//
//     menuActive()
//
// )

// 有待改善

function menuActive() {
    var pageID = $("pageid")[0].getAttribute("name");

    $(".list-group a").each(function() {
        console.log($(this))
        var activePage = $(this).attr("pageid");
        if(activePage != null && activePage == pageID ){
            // 符合条件 开始添加激活属性
            console.log("添加属性");
            $(this).addClass("active")
        }else {
            // 什么都不做 直接进行下一次循环
            console.log("不符合条件");
            $(this).removeClass("active");
        }
    });
}