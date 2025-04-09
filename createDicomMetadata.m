function metadata = createDicomMetadata(frameNum, frameSize)
    % Crea metadatos DICOM básicos
    metadata = struct();
    metadata.PatientID = '4337812345';                  % ID del paciente (ejemplo)
    metadata.PatientName = 'wilver';              % Nombre del paciente (ejemplo)
    metadata.StudyDescription = 'termografia';        % Descripción del estudio
    metadata.SeriesDescription = 'Video a color de termografia'; % Descripción de la serie
    metadata.InstanceNumber = frameNum;             % Número de la instancia (fotograma)
    metadata.Rows = frameSize(1);                   % Filas de la imagen
    metadata.Columns = frameSize(2);                % Columnas de la imagen
    metadata.SamplesPerPixel = 1;                   % Número de canales (escala de grises)
    metadata.PhotometricInterpretation = 'a color'; % Interpretación fotométrica (escala de grises)
    metadata.PixelSpacing = [1 1];                  % Espaciado entre píxeles (ajustar según sea necesario)
    metadata.SliceThickness = 1;                    % Grosor de la imagen (ajustar según sea necesario)
    metadata.Modality = 'US';                       % Modalidad (ecografía)
    metadata.StudyDate = datestr(now, 'yyyymmdd');  % Fecha del estudio
    metadata.StudyTime = datestr(now, 'HHMMSS');    % Hora del estudio
end