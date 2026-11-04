---
layout: page
title: writing
permalink: /writing/
description: A collection of my writings.
nav: true
# Entries live in _data/writing.yml
sort_order: desc # desc = newest first, asc = oldest first
display_categories: [features, short] # set to [] for a single flat list
nav_order: 7
---

<div class="writing">
{%- assign all_items = site.data.writing | sort: "date" -%}
{%- if page.sort_order != "asc" -%}
  {%- assign all_items = all_items | reverse -%}
{%- endif -%}
{%- if page.display_categories and page.display_categories.size > 0 -%}
  {%- for category in page.display_categories -%}
  {%- assign items = all_items | where: "category", category -%}
  {%- if items.size > 0 -%}
  <h2 class="category" id="{{ category }}">{{ category }}</h2>
  {% include writing-list.liquid items=items %}
  {%- endif -%}
  {%- endfor -%}
{%- else -%}
  {% include writing-list.liquid items=all_items %}
{%- endif -%}
</div>
