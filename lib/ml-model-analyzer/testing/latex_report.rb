class LatexReport
  @color_map = {
    "Success" => "\\textcolor{teal}{Success}",
    "Skipped" => "\\textcolor{orange}{Skipped}",
    "Failed" => "\\textcolor{purple}{Failed}",
  }

  def self.map_color(results)
    results.map { |r| @color_map[r] }
  end

  def self.clean_text(text)
    text.gsub! "_", "\\_"
    return text
  end

  def self.preamble
    text = "\\documentclass[a4paper,11pt]{article}\n"
    text << "\\usepackage[left=25mm,right=25mm,top=25mm,bottom=25mm]{geometry}\n"
    text << "\\usepackage{amsmath}\n"
    text << "\\usepackage[section]{placeins}\n"
    text << "\\usepackage{longtable}\n"
    text << "\\usepackage{xcolor}\n"
    text << "\\usepackage{xurl}\n"
    text << "\\begin{document}\n"
    return text
  end

  def self.result_table_body(model_repository, process = nil)
    column_size = (process.size + 2)
    columns = ["Model", "Framework"] + process

    report = "\\begin{longtable}{|#{"l|" * column_size}}\n"

    report << "\\hline " << columns.join(" & ")
    report << " \\\\\\hline\\hline\n\\endfirsthead\n\n"

    report << "\\multicolumn{#{column_size}}{l}{Continued from previous page}"
    report << " \\\\\\hline\n\\endhead\n"

    report << "\\multicolumn{#{column_size}}{r}{Continued on next page}"
    report << "\n\\endfoot\n"

    report << "\\hline\n\\endlastfoot\n"

    model_repository.models.each do |model|
      results = map_color model.result.values_at(*process)
      report << "#{clean_text model.name} & #{clean_text model.framework} & "
      report << results.join(" & ") << " \\\\\\hline\n"
    end
    report << "\\end{longtable}"
    return report
  end

  def self.result_table(result_table_path)
    text = "\n\t\\section{Result Summary}\n"
    text << "\t\\input{#{result_table_path}}\n\n"
    return text
  end

  def self.parameter_body(model_repository)
    text = ""

    model_repository.models.each do |model|
      text << "\\paragraph{#{model}}\n"
      text << "\\begin{verbatim}\n"
      text << model.parameter.to_yaml
      text << "\\end{verbatim}\n"
      text << "Source: \\url{#{clean_text model.source}}"
    end

    return text
  end

  def self.parameter(parameter_path)
    text = "\n\t\\section{Parameter Settings}\n"
    text << "\t\\input{#{parameter_path}}\n\n"
    return text
  end

  def self.end
    text = "\\end{document}"
    return text
  end
end
