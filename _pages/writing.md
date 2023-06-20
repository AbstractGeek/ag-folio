---
layout: page
title: writing
permalink: /writing/
description: A collection of my writings.
nav: true
display_categories: [features, short]
nav_order: 7
---

<!-- pages/writing.md -->
<div class="writing">
{%- if site.enable_project_categories and page.display_categories %}
  <!-- Display categorized writing -->
  {%- for category in page.display_categories %}
  <h2 class="category">{{ category }}</h2>
  {%- assign categorized_projects = site.writing | where: "category", category -%}
  {%- assign sorted_projects = categorized_projects | sort: "importance" %}
  <!-- Generate cards for each writing type -->
  <div class="list-style mx-auto">
    {%- for project in sorted_projects -%}
      {% include writing.html %}
    {%- endfor %}
  </div>
  {% endfor %}

{%- else -%}
<!-- Display writing without categories -->
  {%- assign sorted_projects = site.writing | sort: "importance" -%}
  <!-- Generate cards for each project -->
  <div class="list-style mx-auto">
    {%- for project in sorted_projects -%}
      {% include writing.html %}
    {%- endfor %}
  </div>
{%- endif -%}

</div>
