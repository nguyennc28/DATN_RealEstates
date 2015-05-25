﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchLeft.ascx.cs" Inherits="RealEstate.Modules.SearchLeft" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="http://zkiwi.com/demobox/css/style-demo.css" rel="stylesheet" media="all" />
<script type="text/javascript">
    $(function () {

        if (localStorage.getItem('active')) {
            $('.tabbed').find('#' + localStorage.getItem('active')).addClass('active');
            $('.tabbed').find('a[href=' + localStorage.getItem('active') + ']').parent().addClass('active');

        }
        else {
            $('.tabbed').find('.tabcontent:first').addClass('active');
            $('.tabbed').find('.tabnav li:first').addClass('active');
        }
        $('.tabbed').find('.tabnav li').each(function () {
            $(this).click(function () {
                ntab = $(this).find('> a').attr('href');
                localStorage.setItem('active', ntab);
                $(this).parents('.tabbed').find('.active').removeClass('active');
                $(this).addClass('active');
                $(this).parents('.tabbed').find(ntab).addClass('active');
                return false;
            });
        });
    })
</script>
<style type="text/css">
    .tabbed {
        width: 235px;
        position: relative;
        width: 70%;
        margin: 0 auto;
    }

    .tabbed .tabcont {
        background: #eee;
        padding: 20px;
        margin-top: 32px;
    }

    .tabbed .tabcont .tabcontent {
        display: none;
        position: relative;
        line-height: 20px;
    }

    .tabbed .tabcont .tabcontent img {
        max-width: 100%;
    }

    .tabbed .tabcont .tabcontent.active {
        display: block;
    }

    .tabnav {
        position: absolute;
        left: 0;
        width: 100%;
        border-bottom: 1px solid #eee;
    }

    .tabnav li {
        float: left;
        background: #404533;
        text-align: center;
        height: 50px;
    }

    .tabnav li a {
        height: 35px;
        line-height: 17px;
        padding: 0 14px;
        margin-top: 15px;
        border-radius: 5px 5px 0 0;
        font-size: 13px;
        font-weight: bold;
        display: block;
        color: #fff;
    }
    .tabnav li.active a {
        background: #eee;
        color: #376405;
    }

    .tabtit {
        background: #252B16;
        height: 50px;
        font-size: 18px;
        text-align: center;
        border-radius: 7px 7px 0 0;
        line-height: 48px;
        color: #fff;
    }
</style>
<div class="tabbed" style="width: 235px; margin-left: -1px;">
    <div class="tabhead">
        <h2 class="tabtit">
            <img src="searchnha.png" style="width: 45px; float: left; margin-top: 2px; margin-left: 8px;" />
            Công cụ tìm kiếm </h2>
        <ul class="tabnav">
            <li style="width: 50px;"><a href="#tab1">BĐS bán </a></li>
            <li style="width: 85px;"><a href="#tab2">BĐS cho thuê</a></li>
            <li style="width: 50px;"><a href="#tab3">Nhà trọ</a></li>
            <li style="width: 50px;"><a href="#tab4">Môi giới</a></li>
        </ul>
    </div>
    <div class="tabcont">
        <div id="tab1" class="tabcontent" align="justify">
            <p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit. Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit</p>
        </div>

        <div id="tab2" class="tabcontent" align="justify">
            <p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit</p>
        </div>

        <div id="tab3" class="tabcontent" align="justify">
            <p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit.Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderitMasagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit.</p>
        </div>

        <div id="tab4" class="tabcontent" align="justify">
            <p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit.</p>
        </div>
    </div>
</div>