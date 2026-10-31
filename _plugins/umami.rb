# Injects the Umami analytics snippet before </body> (not supported by the al_analytics gem).
# Enabled via `enable_umami_analytics`, `umami_js` and `umami_analytics` in _config.yml.
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  site = doc.site
  next unless site.config["enable_umami_analytics"]
  next unless doc.output_ext == ".html" && doc.output.include?("</body>")

  src = site.config["umami_js"].to_s
  id = site.config["umami_analytics"].to_s
  next if src.empty? || id.empty?

  snippet = %(<!-- Umami Analytics -->\n<script async src="#{src}" data-website-id="#{id}"></script>\n)
  doc.output = doc.output.sub("</body>") { "#{snippet}</body>" }
end
