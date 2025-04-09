% Conversión de imágenes RGB a DICOM en MATLAB
function crear_rgb (imagePath)
    % Cargar la imagen RGB (JPG, PNG, BMP)
    img = imread(imagePath);

    % Verificar que la imagen es RGB (tiene 3 canales)
    if size(img, 3) ~= 3
        error('La imagen no es RGB.');
    end

    % Crear los metadatos DICOM
    dicomMetadata = struct();
    dicomMetadata.PatientName = 'juan pedro';
    dicomMetadata.PatientID = '123456';
    dicomMetadata.Modality = 'RGB';  % Puede cambiar según la modalidad (por ejemplo, CT, MRI, etc.)
    dicomMetadata.StudyDate = datestr(now, 'yyyymmdd');
    dicomMetadata.StudyTime = datestr(now, 'HHMMSS');
    dicomMetadata.Manufacturer = 'MyCompany';

    % Convertir la imagen a tipo uint8 para DICOM (si no es uint8 ya)
    img = uint8(img);

    % Crear el archivo DICOM
   dicomFile = 'salida_rgb.dcm';
  % dicomwrite(img, dicomFile, dicomMetadata, 'PhotometricInterpretation', 'RGB');
   dicomwrite(img, dicomFile, dicomMetadata, 'PhotometricInterpretation', 'RGB');


  %  dicomwrite(img, dicomFile, dicomMetadata, 'RGB');


    % Mostrar un mensaje de éxito
    disp(['Imagen RGB convertida a DICOM y guardada en: ']);
end

% Uso de la función
%imagePath = 'imagen_rgb.jpg';  % Ruta de la imagen RGB de entrada
%outputDicomPath = 'imagen_rgb_convertida.dcm';  % Ruta de salida para el archivo DICOM
%convert_rgb_to_dicom(imagePath, outputDicomPath);
