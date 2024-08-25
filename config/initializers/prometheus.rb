if defined?(PrometheusExporter::Instrumentation)
  PrometheusExporter::Instrumentation::Process.start(type: "web")

  # You can add custom metrics here
  PrometheusExporter::Instrumentation::ActiveRecord.start
end
