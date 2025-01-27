@extends('layouts/backend/main')
@section('main-section')

<div class="container mt-5 pt-5 mx-auto">
    <div class="text-center mb-4">
        <h1 class="display-4">Event Schedule</h1>
    </div>
    <div id="eventDetails" class="p-4 bg-light rounded shadow-sm mb-4"> 
        <!-- Add more events as needed -->
    </div>
    <div class="text-center mt-4">
        <div id="pdfContainer"></div>
        <a id="downloadPdfButton" class="btn btn-primary mt-3" href="#" download="event_schedule.pdf">Download PDF</a>
    </div>
</div>

@section('javascript-section')
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', async () => {
        const { jsPDF } = window.jspdf;
        const canvas = await html2canvas(document.getElementById('eventDetails'));
        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF();
        pdf.addImage(imgData, 'PNG', 10, 10, 190, 0);

        // Generate the PDF and create a URL
        const pdfBlob = pdf.output('blob');
        const pdfUrl = URL.createObjectURL(pdfBlob);

        // Embed the PDF in the page
        const pdfContainer = document.getElementById('pdfContainer');
        const iframe = document.createElement('iframe');
        iframe.src = pdfUrl;
        iframe.width = '100%';
        iframe.height = '600px';
        pdfContainer.appendChild(iframe);

        // Set the download link
        const downloadPdfButton = document.getElementById('downloadPdfButton');
        downloadPdfButton.href = pdfUrl;
    });
</script>
@endsection
@endsection
