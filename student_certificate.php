<?php
include 'db_connect.php';

// Get student information
$student_id = $_GET['id'];
$student = $conn->query("SELECT s.*, ef.ef_no, c.course, c.level FROM student s 
    LEFT JOIN student_ef_list ef ON ef.student_id = s.id 
    LEFT JOIN courses c ON c.id = ef.course_id 
    WHERE s.id = $student_id 
    LIMIT 1");

if ($student->num_rows == 0) {
    die("Estudiante no encontrado");
}

$data = $student->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificado de Estudio - <?php echo $data['name'] ?></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Georgia', 'Times New Roman', serif;
            background: #f5f5f5;
            padding: 20px;
        }

        .certificate-container {
            width: 8.5in;
            height: 11in;
            margin: 0 auto;
            background: white;
            padding: 0.75in;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            position: relative;
            border: 15px solid #2c3e50;
            border-image: linear-gradient(45deg, #3498db, #2c3e50) 1;
        }

        .inner-border {
            border: 3px double #3498db;
            padding: 40px;
            height: 100%;
            position: relative;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 20px;
        }

        .logo {
            width: 100px;
            height: 100px;
            margin: 0 auto 15px;
        }

        .institution-name {
            font-size: 28px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .institution-details {
            font-size: 12px;
            color: #555;
            margin-top: 5px;
        }

        .certificate-title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #3498db;
            margin: 30px 0;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        .certificate-body {
            text-align: justify;
            font-size: 16px;
            line-height: 2;
            color: #333;
            margin: 30px 0;
        }

        .student-name {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
            text-decoration: underline;
            text-transform: uppercase;
        }

        .student-id {
            font-weight: bold;
            color: #2c3e50;
        }

        .course-name {
            font-weight: bold;
            color: #3498db;
            text-transform: uppercase;
        }

        .footer {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        .signature-block {
            text-align: center;
            width: 45%;
        }

        .signature-line {
            border-top: 2px solid #333;
            margin-top: 60px;
            padding-top: 10px;
            font-size: 14px;
            font-weight: bold;
        }

        .signature-title {
            font-size: 12px;
            color: #666;
        }

        .date-block {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
        }

        .watermark {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg);
            font-size: 120px;
            color: rgba(52, 152, 219, 0.05);
            font-weight: bold;
            z-index: 0;
            pointer-events: none;
        }

        .content {
            position: relative;
            z-index: 1;
        }

        .seal {
            position: absolute;
            bottom: 100px;
            right: 80px;
            width: 120px;
            height: 120px;
            border: 3px solid #3498db;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            font-size: 10px;
            font-weight: bold;
            color: #3498db;
            transform: rotate(-15deg);
        }

        @media print {
            body {
                background: white;
                padding: 0;
            }

            .certificate-container {
                box-shadow: none;
                margin: 0;
                width: 100%;
                height: 100%;
            }

            @page {
                size: letter;
                margin: 0;
            }

            .no-print {
                display: none;
            }
        }

        .print-button {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 30px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        .print-button:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <button class="print-button no-print" onclick="window.print()">
        🖨️ Imprimir Certificado
    </button>

    <div class="certificate-container">
        <div class="inner-border">
            <div class="watermark">EMUNAH</div>
            
            <div class="content">
                <div class="header">
                    <div class="institution-name">
                        Institución Educativa EMUNAH
                    </div>
                    <div class="institution-details">
                        NIT: 60350099-8 | DANE: 354405000195<br>
                        Calle 17 AV 9 N KDX 153-10, Barrio Tierra Linda
                    </div>
                </div>

                <div class="certificate-title">
                    Certificado de Estudio
                </div>

                <div class="certificate-body">
                    <p>
                        La Institución Educativa EMUNAH, debidamente reconocida por el Ministerio de Educación Nacional, 
                        certifica que:
                    </p>
                    <br>
                    <p style="text-align: center;">
                        <span class="student-name"><?php echo strtoupper($data['name']) ?></span>
                    </p>
                    <br>
                    <p>
                        Identificado(a) con cédula/documento número <span class="student-id"><?php echo $data['id_no'] ?></span>, 
                        se encuentra matriculado(a) y cursando actualmente el grado 
                        <span class="course-name"><?php echo $data['course'] ?></span> 
                        en nuestra institución durante el año lectivo en curso.
                    </p>
                    <br>
                    <p>
                        El/La estudiante se encuentra a paz y salvo por todo concepto y mantiene un comportamiento 
                        acorde con las normas y reglamentos institucionales.
                    </p>
                    <br>
                    <p>
                        Se expide el presente certificado a solicitud del interesado(a) para los fines que estime conveniente.
                    </p>
                </div>

                <div class="date-block">
                    Expedido en Cúcuta, a los <?php echo date('d') ?> días del mes de <?php 
                    $meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
                    echo $meses[date('n')-1]; 
                    ?> de <?php echo date('Y') ?>
                </div>

                <div class="footer">
                    <div class="signature-block">
                        <div class="signature-line">
                            Director(a) / Rector(a)
                        </div>
                        <div class="signature-title">
                            Institución Educativa EMUNAH
                        </div>
                    </div>

                    <div class="signature-block">
                        <div class="signature-line">
                            Secretaría Académica
                        </div>
                        <div class="signature-title">
                            Institución Educativa EMUNAH
                        </div>
                    </div>
                </div>

                <div class="seal">
                    SELLO<br>
                    INSTITUCIÓN<br>
                    EDUCATIVA<br>
                    EMUNAH
                </div>
            </div>
        </div>
    </div>

    <script>
        // Auto-focus for printing
        window.onload = function() {
            // Optional: auto-print on load
            // window.print();
        }
    </script>
</body>
</html>
