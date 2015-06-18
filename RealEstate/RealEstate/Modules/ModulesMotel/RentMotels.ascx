<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentMotels.ascx.cs" Inherits="RealEstate.Modules.ModulesMotel.WebUserControl1" %>
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
            padding: 30px 0 0;
            position: relative;
            width: 70%;
            margin: 0 auto;
        }

            .tabbed .tabcont {
                background: #eee;
                padding: 20px;
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
            top: -1px;
            width: 100%;
            border-bottom: 1px solid #eee;
        }

            .tabnav li {
                float: left;
            }

                .tabnav li a {
                    height: 30px;
                    line-height: 30px;
                    padding: 0 14px;
                    font-size: 18px;
                    font-weight: bold;
                    border-radius: 5px 5px 0 0;
                    display: block;
                    color: #333;
                }

                .tabnav li.active a {
                    background: #eee;
                    color: #376405;
                }
    </style>



<div class="wr">

        <div class="logo">
            <a href="http://zkiwi.com" title="Về trang chủ">
                <img src="http://zkiwi.com/demobox/imgs/logo-demo.png" alt="zkiwi demo" />
            </a>
        </div>

        <h1>Demo Tabbed nội dung bằng jQuery + HTML + CSS</h1>

        <div class="tabbed">
            <ul class="tabnav">

                <li><a href="#tab1">Tab 01</a></li>

                <li><a href="#tab2">Tab 02</a></li>

                <li><a href="#tab3">Tab 03</a></li>

            </ul>
            <div class="tabcont">

                <div id="tab1" class="tabcontent" align="justify"><p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit. Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit</p> </div>

                <div id="tab2" class="tabcontent" align="justify"><p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit</p></div>

                <div id="tab3" class="tabcontent" align="justify"><p>Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit.Masagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderitMasagni dolores eoquie voluptate msequciuo quisquam estqui dolorem ipsumquia dolor sitamnetase adipisci unumquam eius. Basmodi temporant, ut laboreas dolore magnam aliquam quaerat pnim ad minim eniamagse quis nostrum exerm ullam. Вorporis quis autem vel eum iure reprehenderit.</p></div>

            </div>
        </div>


    </div>