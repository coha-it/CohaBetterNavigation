{extends file="parent:frontend/index/main-navigation.tpl"}

{block name="frontend_index_navigation_categories_top_home"}
    {action module=widgets controller=checkout action=info}
    {$smarty.block.parent}
{/block}

{block name='frontend_index_navigation_categories_top_entry'}
    {if !$sCategory.hideTop}

        {*$sCategory->getAttribute('coha_cat_floating_direction')|@var_dump*}
        {*$sCategory->getAttribute()|@var_dump*}
        {$coha_floating = $sCategory.attribute.coha_cat_floating}

        <li class="navigation--entry{if $sCategory.flag} is--active{/if} coha--floating coha--floating-{if $coha_floating}right{else}left{/if}" role="menuitem">
            {block name='frontend_index_navigation_categories_top_link'}
                <a class="navigation--link{if $sCategory.flag} is--active{/if}" href="{$sCategory.link}" title="{$sCategory.description}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
                    <span itemprop="name">{$sCategory.description}</span>
                </a>
            {/block}
        </li>
    {/if}
{/block}
