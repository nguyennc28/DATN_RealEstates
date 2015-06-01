<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeBannerSlide1.ascx.cs" Inherits="RealEstate.Controls.FeBannerSlide1" %>
<style type="text/css">
        .captionOrange, .captionBlack
        {
            color: #fff;
            font-size: 20px;
            line-height: 30px;
            text-align: center;
            border-radius: 4px;
        }
        .captionOrange
        {
            background: #EB5100;
            background-color: rgba(235, 81, 0, 0.6);
        }
        .captionBlack
        {
        	font-size:16px;
            background: #000;
            background-color: rgba(0, 0, 0, 0.4);
        }
        a.captionOrange, A.captionOrange:active, A.captionOrange:visited
        {
        	color: #ffffff;
        	text-decoration: none;
        }
        a.captionOrange:hover
        {
            color: #eb5100;
            text-decoration: underline;
            background-color: #eeeeee;
            background-color: rgba(238, 238, 238, 0.7);
        }
        .bricon
        {
            background: url(../img/browser-icons.png);
        }
</style>
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/FeBannerSlide1/jssor.js"></script>
<script src="../js/FeBannerSlide1/jssor.slider.js"></script>
<script type="text/javascript">
       jQuery(document).ready(function ($) {
           //Reference http://www.jssor.com/development/slider-with-slideshow-jquery.html
           //Reference http://www.jssor.com/development/tool-slideshow-transition-viewer.html

           var _SlideshowTransitions = [
           //Fade in R
           {$Duration: 1200, x: -0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
           //Fade out L
           , { $Duration: 1200, x: 0.3, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
           ];

           var options = {
               $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
               $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
               $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
               $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

               $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
               $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
               $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
               //$SlideWidth: 980,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
               //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
               $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
               $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
               $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
               $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
               $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
               $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

               $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
                   $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
                   $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
                   $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                   $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
               },

               $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                   $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                   $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                   $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                   $SpacingX: 10,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                   $SpacingY: 10                                    //[Optional] Vertical space between each item in pixel, default value is 0
               },

               $ArrowNavigatorOptions: {
                   $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                   $ChanceToShow: 2,                                //[Required] 0 Never, 1 Mouse Over, 2 Always
                   $AutoCenter: 2                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
               },

               $ThumbnailNavigatorOptions: {
                   $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                   $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                   $ActionMode: 0,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                   $DisableDrag: true                              //[Optional] Disable drag or not, default value is false
               }
           };

           var jssor_sliderb = new $JssorSlider$("sliderb_container", options);
           //responsive code begin
           //you can remove responsive code if you don't want the slider scales while window resizes
           function ScaleSlider() {
               var parentWidth = jssor_sliderb.$Elmt.parentNode.clientWidth;
               if (parentWidth)
                   jssor_sliderb.$ScaleWidth(Math.min(parentWidth, 980));
               else
                   window.setTimeout(ScaleSlider, 30);
           }
           ScaleSlider();

           $(window).bind("load", ScaleSlider);
           $(window).bind("resize", ScaleSlider);
           $(window).bind("orientationchange", ScaleSlider);
           //responsive code end
       });
</script>
<div class="carousel-inner">
    <%--<asp:Literal ID="ltrBannerSilde" runat="server"></asp:Literal>--%>
    
    <div id="sliderb_container" style="position: relative; top: 0px; left: 0px; width: 980px;
        height: 300px; overflow: hidden;">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
        <% if (lstAdvertises.Count > 0)
           {%>
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 980px; height: 300px;
            overflow: hidden;">
            <% for (int i = 0; i < lstAdvertises.Count; i++)
               {%>
                   <div>
                <a href="<%=lstAdvertises[i].Link %>" alt="<%=lstAdvertises[i].AdvName %>"><img u=image src="<% =lstAdvertises[i].Image %>" /></a>
                <div u="thumb"><span><%=lstAdvertises[i].AdvName %></span></div>
            </div>
               <%} %>
        </div>
        <%} %>
        <!--#region Thumbnail Navigator Skin Begin -->
        <!-- Help: http://www.jssor.com/development/slider-with-thumbnail-navigator-jquery.html -->
        <!-- thumbnail navigator container -->
        <!-- Help: http://www.jssor.com/development/slider-with-thumbnail-navigator-jquery.html -->
        <div u="thumbnavigator" style="position: absolute; bottom: 0px; left: 0px; height:45px; width:980px;">
            <div style="filter: alpha(opacity=40); opacity:0.4; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
            </div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides">
                <div u="prototype" style="POSITION: absolute; WIDTH: 980px; HEIGHT: 45px; TOP: 0; LEFT: 0;">
                    <div u="thumbnailtemplate" style="font-family: verdana; font-weight: normal; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0; LEFT: 0; color:#fff; line-height: 45px; font-size:20px; padding-left:10px;"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>

        <style>

            .jssorb01 {
                position: absolute;
            }
            .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av {
                position: absolute;
                /* size of bullet elment */
                width: 12px;
                height: 12px;
                filter: alpha(opacity=70);
                opacity: .7;
                overflow: hidden;
                cursor: pointer;
                border: #000 1px solid;
            }
            .jssorb01 div { background-color: gray; }
            .jssorb01 div:hover, .jssorb01 .av:hover { background-color: #d3d3d3; }
            .jssorb01 .av { background-color: #fff; }
            .jssorb01 .dn, .jssorb01 .dn:hover { background-color: #555555; }
        </style>
        <!-- bullet navigator container -->
        <div u="navigator" class="jssorb01" style="bottom: 16px; right: 10px;">
            <!-- bullet navigator item prototype -->
            <div u="prototype"></div>
        </div>

        <style>

            .jssora05l, .jssora05r {
                display: block;
                position: absolute;
                /* size of arrow element */
                width: 40px;
                height: 40px;
                cursor: pointer;
                background: url(../img/a17.png) no-repeat;
                overflow: hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05l.jssora05ldn { background-position: -250px -40px; }
            .jssora05r.jssora05rdn { background-position: -310px -40px; }
        </style>
        <!-- Arrow Left -->
        <span u="arrowleft" class="jssora05l" style="top: 123px; left: 8px;">
        </span>
        <!-- Arrow Right -->
        <span u="arrowright" class="jssora05r" style="top: 123px; right: 8px;">
        </span>
        <a style="display: none" href="http://www.jssor.com">Bootstrap Slider</a>
        <!-- Trigger -->
    </div>

</div>
