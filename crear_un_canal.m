function crear_un_canal (imagePath)
    % Cargar la imagen (JPG, PNG, BMP)
    img = imread(imagePath);

    % Asegurarse de que la imagen sea en escala de grises (si es una imagen RGB)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Crear los metadatos DICOM
    dicomMetadata = struct();
    dicomMetadata.PatientName = 'John Doe';
    dicomMetadata.PatientID = '123456';
    dicomMetadata.Modality = 'CT';
    dicomMetadata.StudyDate = '20250314';
    dicomMetadata.StudyTime = '120000';
    dicomMetadata.Manufacturer = 'MyCompany';

    % Convertir la imagen a un arreglo de tipo uint16 si es necesario
    img = uint16(img);

    % Crear el archivo DICOM
    dicomFile = 'output_image.dcm';
    dicomwrite(img, dicomFile, dicomMetadata);

    % Mostrar un mensaje de éxito
    disp('Imagen convertida a DICOM y guardada.');

    end

