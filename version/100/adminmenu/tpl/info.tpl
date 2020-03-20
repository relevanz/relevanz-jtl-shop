{*
-------------------------------------------------------------------------------
JTL-Shop
File: info.tpl, smarty template inc file

https://www.webstollen.de

Copyright (c) 2018 WebStollen
-------------------------------------------------------------------------------
*}
<table id="jst_support_tab">
    <tr>
        <th>
            Lizenzinformationen:
        </th>
        <td>
            <small class="check_info hidden" title="Letzter Check">{$last_check}</small>
            {if !$oLizenzData}
                <b class="lic_failed">Lizenzpr&uuml;fung fehlgeschlagen.</b>
                {if $invalid}
                    (<a href='?kPlugin={$oPlugin->kPlugin}&recheck=1'>aktualisieren</a>)
                {/if}
                <br/>
                <a class="button orange" target="_blank"
                   href="https://www.webstollen.de/navi.php?suchausdruck={$oPlugin->cPluginID}">Lizenz kaufen</a>
            {else}

                {if $invalid}
                    <b class="lic_failed">Lizenzpr&uuml;fung fehlgeschlagen.</b>
                    (<a href='?kPlugin={$oPlugin->kPlugin}&recheck=1'>aktualisieren</a>)
                {else}
                    <b>{if $oLizenzData->testLicence}Testlizenz{else}Produktivlizenz{/if}</b>
                    <br/>
                    {if $oLizenzData->testLicence}G&uuml;ltig bis:{else}Kostenlose Updates bis:{/if}
                    <b class="{if $smarty.now > $oLizenzData->validUntil}lic_failed{else}lic_ok{/if}">{$oLizenzData->validUntil|date_format:"%d.%m.%Y"}</b>
                {/if}
                <br/>
                {if $oLizenzData->testLicence || $smarty.now > $oLizenzData->validUntil}
                    <a class="button orange" target="_blank"
                       href="https://www.webstollen.de/?subcode={$subcode}">{if $oLizenzData->testLicence}Lizenz kaufen{else}Subskription verl&auml;ngern{/if}</a>
                {/if}
            {/if}
        </td>
        <td>
            Ihre Version: <strong>{$oPlugin->nVersion}</strong><br/>
            {if $latestVersion}
                Aktuelle Version:
                <strong>{$latestVersion->nVersion}</strong>
                ({$latestVersion->dCreateDate})
                <br/>
                {if $oPlugin->nVersion < $latestVersion->nVersion}
                    {if $oLizenzData && $oLizenzData->validUntil > $latestVersion->dCreateDate|strtotime}
                        <a class=" button orange" href="{$latestVersion->cDownloadURL}">Download</a>
                    {else}
                        <i>F&uuml;r ein Update m&uuml;ssen Sie Ihre Subskription verl&auml;ngern.</i>
                    {/if}
                {else}
                    <strong style="color:#00AA00">Plugin ist auf dem aktuellsten Stand!</strong>
                {/if}
            {/if}
        </td>
    </tr>
    <tr>
        <th>Mehr Infos:</th>
        <td colspan="2" style="line-height:32px;">
            <img id="loading" style="display: none; float:right" src="//cdn.webstollen.de/assets/img/loading.gif">

            <a class="nav button orange" href="https://www.webstollen.de/plugin-aktionstab?exclusive_content=1"
               target="support">Infos</a>
            <a class="nav button orange" href="https://plugins.webstollen.de/doc/{$oPlugin->cPluginID}?if=2&"
               target="support">Dokumentation</a>
            <a class="nav button orange" href="https://plugins.webstollen.de/support?{$cSupportQuery}" target="support">Support</a>
            {if $oPlugin->oPluginSprachvariable_arr|count}
                <a class="nav button sprache orange"
                   href="{$URL_SHOP}/admin/pluginverwaltung.php?pluginverwaltung_uebersicht=1&sprachvariablen=1&kPlugin={$oPlugin->kPlugin}{if $IS_MODERN}&token={$smarty.session.jtl_token}{/if}"
                   target="_top">Sprachvariablen</a>
            {/if}
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <iframe frameborder="0" style="border: 0;" id="support" name="support" src="" height="800"
                    width="100%"></iframe>
        </td>
    </tr>
</table>
<script>
    // <!--
    {if $reload}
    window.location.href = "?kPlugin={$oPlugin->kPlugin}";
    {/if}
    $.getScript("//cdn.webstollen.de/assets/js/default{if $IS_MODERN}_v4{/if}.js?pluginId={$oPlugin->cPluginID}");
    {literal}
    $(document).ready(function () {
        {/literal}
        {if $invalid}{literal}
        setTimeout(function () {
            $('ul.tabbernav a[title="Support"]').click();
        }, 500);
        setTimeout(function () {
            $('ul.tabbernav a[title="Support"]').click();
        }, 1000);
        {/literal}{/if}
        {literal}
    });
    {/literal}
    // -->
</script>