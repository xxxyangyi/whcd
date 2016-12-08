
// 管理员 界面中涉及的 图表

// 图表 1
$("#canvasUserSex").ready(function () {
        var man = 0;
        var women = 0;

        $.ajax({
            url:"Manager/getSexData",
            async: false,
            error: function () {
                alert("操作失败！");
            },
            success: function (data) {
                man = data.man !== '' ? data.man : 0;
                women = data.women !== '' ? data.women : 0;
                var pieData = [
                    {
                        value: man,
                        color: "#FABC3D",
                        highlight: "#BE3286",
                        label: "用户男"
                    },
                    {
                        value: women,
                        color: "#25B7D3",
                        highlight: "#BE3286",
                        label: "用户女"
                    }

                ];

                var ctxUserSex = document.getElementById("canvasUserSexArea").getContext("2d");
                window.myPie = new Chart(ctxUserSex).Pie(pieData);
            }
        });
    });

// 图表 2
$("#canvasIdentity").ready(function () {

    var user = 0;
    var expert = 0;
    $.ajax({
        url: "/Manager/getIdentityData",
        async: false,
        error: function () {
            alert("操作失败！");
        },
        success: function (data) {
            user = data.user !== '' ? data.user : 0;
            expert = data.expert !== '' ? data.expert : 0;
            var pieData = [
                {
                    value: user,
                    color: "#E04F5F",
                    highlight: "#BE3286",
                    label: "游客"
                },
                {
                    value: expert,
                    color: "#32BEA6",
                    highlight: "#BE3286",
                    label: "专家"
                }

            ];

            var ctxUserSex = document.getElementById("canvasIdentityArea").getContext("2d");
            window.myPie = new Chart(ctxUserSex).Pie(pieData);
        }
    });
});