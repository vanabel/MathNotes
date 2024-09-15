import re
import os

# Read the markdown file and extract headings for PDF file names
def extract_pdf_titles(markdown_file):
    pdf_titles = []
    with open(markdown_file, 'r', encoding='utf-8') as md_file:
        content = md_file.readlines()
        for line in content:
            match = re.match(r'^## \[\[([^\]]+)\]\]', line)
            if match:
                # Extract title and replace with corresponding PDF file name
                title = match.group(1)
                pdf_filename = f"{title}.pdf"
                pdf_titles.append((title, pdf_filename))
    return pdf_titles

# Generate the index.html for PDF.js viewing with all pages displayed in a scrollable view
def generate_html(output_dir, pdf_titles):
    html_content = '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PDF Viewer</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>
  <style>
    canvas {
      display: block;
      margin: 20px auto;
    }
  </style>
</head>
<body>
  <h1>PDF Files</h1>
  <ul>
'''

    # Add links to the PDF files
    for title, pdf_filename in pdf_titles:
        html_content += f'<li><a href="?file={pdf_filename}">{title}</a></li>\n'

    html_content += '''
  </ul>

  <div id="pdf-container"></div>

  <script>
    const pdfjsLib = window["pdfjs-dist/build/pdf"];
    pdfjsLib.GlobalWorkerOptions.workerSrc = "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.worker.min.js";

    // Get file from the query string (e.g., ?file=example.pdf)
    const urlParams = new URLSearchParams(window.location.search);
    const file = urlParams.get("file") || ""; // Default to no file

    // Initialize the PDF document and render all pages
    if (file) {
      pdfjsLib.getDocument(file).promise.then((pdfDoc) => {
        const pdfContainer = document.getElementById("pdf-container");

        for (let pageNum = 1; pageNum <= pdfDoc.numPages; pageNum++) {
          pdfDoc.getPage(pageNum).then((page) => {
            let viewport = page.getViewport({ scale: 1.5 });
            let canvas = document.createElement("canvas");
            let ctx = canvas.getContext("2d");

            canvas.height = viewport.height;
            canvas.width = viewport.width;

            let renderContext = {
              canvasContext: ctx,
              viewport: viewport
            };

            page.render(renderContext);
            pdfContainer.appendChild(canvas);
          });
        }
      });
    }
  </script>
</body>
</html>
'''

    # Save the generated HTML to the output directory
    html_path = os.path.join(output_dir, "index.html")
    with open(html_path, 'w', encoding='utf-8') as html_file:
        html_file.write(html_content)
    print(f"index.html generated at {html_path}")

# Define the paths
markdown_file = './MathSoftwear/数学软件课程讲义.md'  # Path to your markdown file
output_dir = './MathSoftwear/out'  # Output directory where index.html and PDF files are located

# Extract PDF titles and generate the HTML
pdf_titles = extract_pdf_titles(markdown_file)
generate_html(output_dir, pdf_titles)
