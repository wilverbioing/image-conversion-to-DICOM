function crear_video(videoPath)
    % Abrir el video
    vidObj = VideoReader(videoPath);

        % Crear los metadatos DICOM comunes para todas las imágenes
    dicomMetadata = struct();
    dicomMetadata.PatientName = 'John Doe';
    dicomMetadata.PatientID = '123456';
    dicomMetadata.Modality = 'US';  % Ecografía (US para Ultrasonido)
    dicomMetadata.StudyDate = datestr(now, 'yyyymmdd');
    dicomMetadata.StudyTime = datestr(now, 'HHMMSS');
    dicomMetadata.Manufacturer = 'MyCompany';
    dicomMetadata.SeriesDescription = 'Ultrasound Video';

    % Leer fotogramas del video
    frameNumber = 1;
    while hasFrame(vidObj)
        % Leer el siguiente fotograma
        frame = readFrame(vidObj);

        % Si la imagen es RGB, convertirla a escala de grises
        if size(frame, 3) == 3
            frame = rgb2gray(frame);
        end

        % Convertir el fotograma a uint16 (puedes cambiar esto según tus necesidades)
        frame = uint16(frame);

        % Crear el nombre del archivo DICOM para cada fotograma
        dicomFileName = sprintf('%s/frame_%04d.dcm', frameNumber);

        % Escribir el fotograma como una imagen DICOM
        dicomwrite(frame, dicomFileName, dicomMetadata);

        % Mostrar el progreso
        disp(['Fotograma ', num2str(frameNumber), ' guardado como DICOM.']);

        % Incrementar el contador de fotogramas
        frameNumber = frameNumber + 1;
    end

    % Mensaje de finalización
    disp('Conversión de video a DICOM completada.');
end

% Uso de la función
%videoPath = 'ecografia.mp4';  % Ruta del video de entrada (por ejemplo, un video de ecografía)
%outputFolder = 'dicom_video';  % Carpeta de salida donde se guardarán las imágenes DICOM
%convert_video_to_dicom(videoPath, outputFolder);
