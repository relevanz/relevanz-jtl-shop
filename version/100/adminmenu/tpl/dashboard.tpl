
{foreach from=$alerts item=alert}
    <div class='alert alert-{$alert->type}'>
        {$alert->message}
    </div>
{/foreach}

{if isset($iframeUrl)}
    <style>
        #relevaStats {
            display: block;
            width: 100%;
            border: 1px solid #eee;
            min-height: 500px !important;
        }
    </style>
    <iframe id='relevaStats' src='{$iframeUrl}'></iframe>
    <script>
        // <!--
        $(function(){
            $('#relevaStats').css('height', ($(document).height() - $('#relevaStats').offset().top) + 'px');
            $('html, body').animate({
                scrollTop: $("#relevaStats").offset().top
            }, 1000);
        });
        // -->
    </script>
{/if}