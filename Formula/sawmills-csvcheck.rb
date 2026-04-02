class SawmillsCsvcheck < Formula
  desc "Validate CSV files against Sawmills CSV enrichment processor rules"
  homepage "https://github.com/Sawmills/sawmills-collector/tree/main/processor/csvenrichmentprocessor"
  license :cannot_represent
  head "https://github.com/Sawmills/sawmills-collector.git", branch: "main"

  depends_on "go" => :build

  def install
    cd "processor/csvenrichmentprocessor" do
      system "go", "build", *std_go_args(
        ldflags: "-s -w -X main.version=head",
        output:  bin/"sawmills-csvcheck",
      ), "./cmd/csvcheck"
    end
  end

  test do
    (testpath/"valid.csv").write <<~CSV
      service_name,team
      checkout,commerce
    CSV

    output = shell_output("#{bin}/sawmills-csvcheck -file #{testpath}/valid.csv -lookup-key service_name")
    assert_match "VALID: CSV matches csvenrichmentprocessor parsing rules", output
    assert_equal "head\n", shell_output("#{bin}/sawmills-csvcheck -version")
  end
end
