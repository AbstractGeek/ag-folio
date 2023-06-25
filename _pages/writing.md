---
layout: page
title: writing
permalink: /writing/
description: A collection of my writings.
nav: true
only_highlights: false
display_categories: [features, short]
nav_order: 7
---

<!-- pages/writing.md -->
<div class="writing">
{%- if site.enable_project_categories and page.display_categories -%}
  <!-- Display categorized writing -->
  {%- for category in page.display_categories -%}
  <h2 class="category">{{ category }}</h2>
  {%- if page.only_highlights -%}
    {%- assign categorized_projects = site.writing | where: "highlighted", true | where: "category", category -%}
  {%- else -%}
    {%- assign categorized_projects = site.writing | where: "category", category -%}
  {%- endif -%}
  {%- assign sorted_projects = categorized_projects | sort: "importance" | sort: "date" -%}
  <!-- Generate cards for each writing type -->
  <div class="list-style mx-auto">
    {%- for project in categorized_projects -%}
      {% include writing.html %}
    {%- endfor %}
  </div>
  {% endfor %}

{%- else -%}
<!-- Display writing without categories -->
  {%- if page.only_highlights -%}
  {%- assign sorted_projects = site.writing | where: "highlighted", true | sort: "importance" | sort: "date" -%}
  {%- else -%}
  {%- assign sorted_projects = site.writing | sort: "importance" | sort: "date" -%}
  {%- endif -%}
  <!-- Generate cards for each project -->
  <div class="list-style mx-auto">
    {%- for project in sorted_projects -%}
      {% include writing.html %}
    {%- endfor %}
  </div>
{%- endif -%}

</div>
