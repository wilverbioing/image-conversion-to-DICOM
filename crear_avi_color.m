function crear_avi_color(videoFilePath, outputDir)
    % Abre el archivo de video
    video = VideoReader(videoFilePath);

    % Contador de fotogramas
    frameNum = 1;

    % Crea un directorio para guardar los archivos DICOM si no existe
    if ~exist(outputDir, 'dir')
        mkdir(outputDir);
    end
    
    % Lee cada fotograma del video
    while hasFrame(video)
        % Lee el fotograma
        frame = readFrame(video);
        
        % Si el video es en color RGB, lo mantendremos como tal.
        % Si el video está en formato uint8, lo podemos guardar directamente
        if ~isa(frame, 'uint8')
            % Convertir el fotograma a uint8 (si no está en ese tipo de dato)
            frame = uint8(frame);
        end
        
        % Generar el nombre del archivo DICOM
        dicomFileName = fullfile(outputDir, sprintf('frame_%04d.dcm', frameNum));
        
        % Crear los metadatos DICOM
        dicomMetaData = createDicomMetadata(frameNum, size(frame));
        
        % Guardar el fotograma como archivo DICOM
        dicomwrite(frame, dicomFileName, dicomMetaData);
        
        % Incrementar el contador de fotogramas
        frameNum = frameNum + 1;
    end
    
    % Mensaje de éxito
    disp('Conversión completada. Los archivos DICOM se han guardado.');
end

