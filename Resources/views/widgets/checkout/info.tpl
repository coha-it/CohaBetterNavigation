{extends file="parent:widgets/checkout/info.tpl"}

{* Cart entry *}
{block name="frontend_index_checkout_actions_cart"}
    <li class="navigation--entry entry--cart" role="menuitem">
        {s namespace="frontend/index/checkout_actions" name="IndexLinkCart" assign="snippetIndexLinkCart"}{/s}
        <a class="navigation--link" href="{url controller='checkout' action='cart'}" title="{$snippetIndexLinkCart|escape}">
            <i class="thin-icon bag"></i>
        </a>
        <div class="ajax-loader">&nbsp;</div>
    </li>

    {* Account entry *}
    <li class="navigation--entry entry--account{if {config name=useSltCookie} || $sOneTimeAccount} with-slt{/if}"
        role="menuitem"
        data-offcanvas="true"
        data-offCanvasSelector=".account--dropdown-navigation">
        {block name="frontend_index_checkout_actions_account"}
            <a href="{url controller='account'}"
               title="{"{if $userInfo}{s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}{$userInfo['firstname']}{s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s} - {/if}{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"|escape}"
               class="navigation--link {if $userInfo} account--user-loggedin{/if}">
                <i class="thin-icon user"></i>
            </a>
        {/block}

        {if {config name=useSltCookie} || $sOneTimeAccount}
            {block name="frontend_index_checkout_actions_account_navigation"}
                <div class="account--dropdown-navigation">

                    {block name="frontend_index_checkout_actions_account_navigation_smartphone"}
                        <div class="navigation--smartphone">
                            <div class="entry--close-off-canvas">
                                <a href="#close-account-menu"
                                   class="account--close-off-canvas"
                                   title="{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}">
                                    {s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s} <i class="icon--arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    {/block}

                    {block name="frontend_index_checkout_actions_account_menu"}
                        {include file="frontend/account/sidebar.tpl" showSidebar=true inHeader=true}
                    {/block}
                </div>
            {/block}
        {/if}
    </li>
{/block}
