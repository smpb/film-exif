# `film-exif`

Alter specific EXIF tags on image files. Useful, and made for, film photography whose digital files lack proper metadata when they're straight out of the scanner.

## Usage Example

    perl film-exif.pl --pattern Scan \
      --date "2016:11:10 10:30:00"   \
      --cmake Canon --cmodel "A-1"   \
      --lmake Canon --lmodel "FD 100mm 2.8 SSC" \
      --comment "Kodak TMax 400 @ 400; HC-110 dillution B"

    Kodak-TMax-400-Scan-161115-0001.jpg: Canon A-1 (2016:11:15 10:30:00)
    Kodak-TMax-400-Scan-161115-0001.jpg: Changed '<Make> <Model>' to 'Canon' 'A-1' and '<UniqueCameraModel>' to 'Canon A-1'
    Kodak-TMax-400-Scan-161115-0001.jpg: Changed '<LensMake> <LensModel>' to 'Canon' 'FD 100mm 2.8 SSC' and '<Lens>' to 'Canon FD 100mm 2.8 SSC'
    Kodak-TMax-400-Scan-161115-0001.jpg: Changed '<DateTimeOriginal>' to '2016:11:10 10:30:00'
    Kodak-TMax-400-Scan-161115-0001.jpg: Changed '<UserComment>' to 'Kodak TMax 400 @ 400; HC-110 dillution B'
    Kodak-TMax-400-Scan-161115-0002.jpg: Canon A-1 (2016:11:15 10:30:00)
    Kodak-TMax-400-Scan-161115-0002.jpg: Changed '<Make> <Model>' to 'Canon' 'A-1' and '<UniqueCameraModel>' to 'Canon A-1'
    Kodak-TMax-400-Scan-161115-0002.jpg: Changed '<LensMake> <LensModel>' to 'Canon' 'FD 100mm 2.8 SSC' and '<Lens>' to 'Canon FD 100mm 2.8 SSC'
    Kodak-TMax-400-Scan-161115-0002.jpg: Changed '<DateTimeOriginal>' to '2016:11:10 10:30:00'
    Kodak-TMax-400-Scan-161115-0002.jpg: Changed '<UserComment>' to 'Kodak TMax 400 @ 400; HC-110 dillution B'
