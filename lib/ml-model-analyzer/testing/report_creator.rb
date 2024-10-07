module ReportCreator
  def self.markdown(model_repository, process = nil)
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

  def self.latex()
  end
end
