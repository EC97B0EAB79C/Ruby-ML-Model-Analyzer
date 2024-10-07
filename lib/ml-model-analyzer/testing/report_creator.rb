require_relative "./latex_report.rb"

module ReportCreator
  def self.markdown_result_table(model_repository, process = nil)
    report = "| Model | Framework | " + process.join(" | ") + " |\n"
    report << "| --- " * (process.size + 2) + "|\n"

    model_repository.models.each do |model|
      results = markdown_color_map model.result.values_at(*process)
      report << "| #{model.name} | #{model.framework} | "
      report << results.join(" | ") << " |\n"
    end
    return report
  end

  def self.markdown_color_map(results)
    color_map = {
      "Success" => "<span style='color:lime'>Success</span>",
      "Skipped" => "<span style='color:yellow'>Skipped</span>",
      "Failed" => "<span style='color:red'>Failed</span>",
    }
    results.map { |r| color_map[r] }
  end

  def self.create_latex_report(report_path, model_repository, process = nil)
    Log.log.debug "Creating LaTeX report"
    current_dir = Dir.pwd
    Dir.chdir report_path

    begin
      Log.log.debug "> Create report file"
      File.write "report.tex", LatexReport.preamble
      Log.log.debug "> Created report file"

      Log.log.debug "> Creating result table"
      result_table_path = "result_table.tex"
      File.write result_table_path, LatexReport.result_table_body(model_repository, ["init", "conversion", "compile"])
      File.write "report.tex", LatexReport.result_table(result_table_path), mode: "a+"
      Log.log.debug "> Created result table"

      Log.log.debug "> Creating parameter dump"
      parameter_path = "parameter.tex"
      File.write parameter_path, LatexReport.parameter_body(model_repository)
      File.write "report.tex", LatexReport.parameter(parameter_path), mode: "a+"
      Log.log.debug "> Created parameter dump"

      File.write "report.tex", LatexReport.end, mode: "a+"

      Log.log.debug "> Compiling report"
      `pdflatex -synctex=1 -interaction=nonstopmode "report".tex`
      Log.log.debug "> Compiled report"
    rescue => e
      Log.log.error e
    end

    Dir.chdir current_dir
  end
end
