{extends file="parent:frontend/index/main-navigation.tpl"}

{block name='frontend_index_navigation_categories_top_entry'}
    {if !$sCategory.hideTop}

        {*$sCategory->getAttribute('coha_cat_floating_direction')|@var_dump*}
        {*$sCategory->getAttribute()|@var_dump*}

        <li class="navigation--entry{if $sCategory.flag} is--active{/if}" role="menuitem">
            {block name='frontend_index_navigation_categories_top_link'}
                <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
                    <span itemprop="name">{$sCategory.description}</span>
                </a>
            {/block}
        </li>
    {/if}
{/block}

{block name='frontend_index_navigation_categories_navigation_list'}
    <ul class="navigation--list container coha--floating coha--floating-left" role="menubar" itemscope="itemscope" itemtype="http://schema.org/SiteNavigationElement">
        {strip}

            {block name='frontend_index_navigation_categories_top_home'}
                <li class="navigation--entry{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} is--active{/if} is--home" role="menuitem">
                    {block name='frontend_index_navigation_categories_top_link_home'}
                        <a class="navigation--link is--first{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} active{/if}" href="{url controller='index'}" title="{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}" itemprop="url">
                            <span itemprop="name">{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}</span>
                        </a>
                    {/block}
                </li>
            {/block}

            {block name='frontend_index_navigation_categories_top_before'}{/block}

            {foreach $sMainCategories as $sCategory}
                {$coha_floating = $sCategory.attribute.coha_cat_floating}
                {if !$coha_floating}
                    {block name='frontend_index_navigation_categories_top_entry'}
                        {$smarty.block.parent}
                    {/block}
                {/if}
            {/foreach}

            {block name='frontend_index_navigation_categories_top_after'}{/block}
        {/strip}
    </ul>

    <ul class="navigation--list container coha--floating coha--floating-right" role="menubar" itemscope="itemscope" itemtype="http://schema.org/SiteNavigationElement">
        {foreach $sMainCategories as $sCategory}
            {$coha_floating = $sCategory.attribute.coha_cat_floating}
            {if $coha_floating}
                {block name='frontend_index_navigation_categories_top_entry'}
                    {$smarty.block.parent}
                {/block}
            {/if}
        {/foreach}
        {action module=widgets controller=checkout action=info}
    </ul>

{/block}


