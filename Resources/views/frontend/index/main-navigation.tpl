{extends file="parent:frontend/index/main-navigation.tpl"}

{block name='frontend_index_navigation_categories_top_home'}
    <li class="navigation--entry{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} is--active{/if} is--home" role="menuitem">
        {block name='frontend_index_navigation_categories_top_link_home'}
            <a class="navigation--link is--first{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} active{/if}" href="{url controller='index'}" title="{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}" itemprop="url">
                <span itemprop="name">{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}</span>
            </a>
        {/block}
    </li>
{/block}

{block name='frontend_index_navigation_categories_top_entry'}
    {if !$sCategory.hideTop}


        {$coha_floating = $sCategory.attribute.coha_cat_floating}
        {$coha_floating_direction = $sCategory.attribute.coha_cat_floating_direction}


        {*$sCategory->getAttribute('coha_cat_floating_direction')|@var_dump*}
        {*$sCategory->getAttribute()|@var_dump*}

        <li class="navigation--entry{if $sCategory.flag} is--active{/if} {if $coha_floating}coha-floating coha-floating-{$coha_floating_direction}{/if} " role="menuitem">
            {block name='frontend_index_navigation_categories_top_link'}
                <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
                    <span itemprop="name">{$sCategory.description}</span>
                </a>
            {/block}
        </li>
    {/if}
{/block}
