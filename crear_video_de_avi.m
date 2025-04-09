function crear_video_de_avi (videoFilePath, outputDir)
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
        
        % Convierte el fotograma en un formato adecuado (escala de grises)
        % Este paso es necesario si el video es en color (RGB), 
        % ya que DICOM generalmente maneja imágenes en escala de grises.
        grayFrame = rgb2gray(frame);
        
        % Generar el nombre del archivo DICOM
        dicomFileName = fullfile(outputDir, sprintf('frame_%04d.dcm', frameNum));
        
        % Crear los metadatos DICOM
        dicomMetaData = createDicomMetadata(frameNum, size(grayFrame));
        
        % Guardar el fotograma como archivo DICOM
        dicomwrite(grayFrame, dicomFileName, dicomMetaData);
        
        % Incrementar el contador de fotogramas
        frameNum = frameNum + 1;
    end
    
    % Mensaje de éxito
    disp('Conversión completada. Los archivos DICOM se han guardado.');
end


