# Raptor 0.3 - OCT Volume Assembly Labview Software
Mike Hughes, Applied Optics Group, University of Kent. September 2021
Contact: m.r.hughes@kent.ac.uk

## Introduction
Raptor is Labview program to build OCT volumes (and fluorescence images) where one of the two scanning axes (the slow axis) is manual or in some other way uneven. It was designed to allow 3D volumes to be built when a 1D scanning endoscopic OCT/fluorescence probe is manually scanned in along a second axis. This is a real-time approximate implementation of the method in:

*Manuel J. Marques, Michael R. Hughes, Adrián F Uceda, Grigory Gelikonov, Adrian Bradu, Adrian Podoleanu, **Endoscopic en-face optical coherence tomography and fluorescence imaging using correlation-based probe tracking***

At time of release this paper is under review and a copy is available on Arxiv. Please consult the paper for a detailed expanation and evaluation of the approach, and cite this paper if publishing anything using this software.
This software was tested on Labview 2015 and requires the Vision Development Module. It runs at 250 fps on an Intel i7 processor with 8GB RAM. 

## Setup
Raptor requires OpenCV v4.1.0. Download from https://opencv.org/releases and ensure than opencv_world410.dll is somewhere in the system or Labview search path.

## Running the Test Program
Run test-raptor.vi to launch the Raptor programme on a set of pre-captured images. test_raptor.vi effectively simulated an OCT/fluorescence imaging system. An example set of OCT B-scans and fluorescent lines is in the 'test data' folder. On the test_raptor.vi front panel, ensure that the 'test1_OCT' folder is selected in the 'Folder of TIFs ...' file selector control, and the 'test1_fluor.tif' file is selected for the 'TIF File for ...'  file selector control.

When test_raptor.vi is run, the images will be pre-loaded and then streamed to the Raptor programme which will assemble the volume. The default parameters will produce a good quality reconstruction. Providing 'Show Raptor Window' is checked, the full Raptor window will display. If the 'Show Raptor Window' option is unchecked, the Raptor window will not display, but the live en face and fluorescence reconstructions will still be displayed on the test_raptor.vi front panel.

The 'Simulated FPS' numeric control determines the speed at which the images will be served to the Raptor programme. Change this value to simulated imaging systems with different B-scan frame rates.

The 'New Scan' button has no effect unless the 'Continuous Scan' option is selected. In this case, images will be continuously streamed in a loop, and a new en face image can be forced by pressing 'New Scan'.

## Algorithm
Raptor runs in parallel with the OCT acquisition/processing system (or the test_raptor.vi simulator) and assembles en face images from a stream of B-scan images and a fluorescence image from a stream of fluorescence lines. The assembly procedure is as follows:
1. From the first B-scan, detect top surface using thresholding, binarisation, morphological dilate, looking for first white pixel in each column and taking median. This is the ‘reference frame’.
2. Select a user-defined region of interest (ROI) below the top surface of the reference frame.
3. For next B-scan frame, take normalised cross-correlation (NCC) between region of interest from current frame and a slightly larger region from the reference frame. The peak of the cross-correlation map indicates the x-and y shifts between the two images. 
4. Take a ROI from the reference frame and a ROI from the current frame, shifted to correct for x and y shifts detected in Step 3. Filter both ROIs by subtracting a mean filtered copy of the frame and then by 2D Gaussian filtering. Mask out bright pixels (specularities). Compute correlation. 
5. Compare correlation value to a threshold. If above threshold then we have not moved sufficiently far, so go to next B-Scan (Step 3). If below threshold then we have moved sufficiently far out-of-plane.
6. Determine how far past the correlation threshold we are. Advance our current line position in the en face image by the correct distance.
7. Extract a line from the B-scan at the required depth of the en-face image (user specified depth relative to top of B scan or top surface of sample) and add it to the live en-face image, filling the space from the last insertion to the current line position. The line is inserted with the x-shift determined from the NCC. If fluorescence imaging channel present, also add line in same location to live fluorescence image.
6. This B-scan becomes the next reference image. Go to Step 1.

## Integration with OCT Acquisition Software
Raptor is designed to be simple to integrate with any OCT software in Labview.
Raptor is launched from the OCT acquisition software by calling raptor_initialise.vi . Parameters are passed to this using a cluster of typedef raptor_parameters.ctl (see below). A separate input is required for the number of frames in a buffer of unprocessed images used by Raptor. This should >100 when using high frame rates to allow for occasional slow-downs.

When ready to scan, call raptor_new_scan.vi to begin real-time volume assembly.

As B-scans are acquired and reconstructed by the OCT acquisition software they are passed as 8 bit IMAQ images to Raptor by calling raptor_send_images.vi . Once this VI returns it is safe to overwrite the IMAQ image as Raptor copies the image to its own internal buffer before volume assembly.

Once a scan is completed, call raptor_end.vi to stop assembling the volume or raptor_new_scan.vi to begin assembling the next scan.

Obtain the current en face or fluorescence image by calling raptor_get_enface.vi or raptor_get_fluorescence.vi respectively.

Check if Raptor is keeping pace by calling raptor_getlag.vi to find out how many frames are awaiting processing.

When done call raptor_shutdown.vi.

Change the en face depth on-the-fly by calling raptor_set_en_face_depth.vi.

For all other parameters you must call raptor_initialise.vi again. This clears all data stored by Raptor.

## Parameters
A cluster of following parameters is passed to raptor_initialise.vi:
* **Display Raptor** : If true the Raptor Window will open. If false it will not open, and the only way to see the assembled en face image is using calling raptor_enface.vi and raptor_fluorescence.vi which copy the current en face and fluorescence images to a supplied IMAQ image reference.
* **En Face Depth**: Depth in pixels of the real-time en-face image with respect either to the top of supplied B-scans (if Track Depth is off) or relative to the estimated surface of the sample (if Track Depth is on). This can be changed while running by calling raptor_depth.vi.
* **Correlation Threshold**: A new line is added to the en face image when correlation drops below this. 
* **Aspect Ratio**: The ratio of the decorrelation distance (the pre-calibrated out-of-plane distance required to reach the correlation threshold) to the lateral pixel size. En-face/fluorescence images will be stretched by this factor in the out-of-plane direction so that the pixel size is square.
* **Template Width**: Width of the ROI used for the NCC in pixels. The maximum x-shift checked for is (B-scan Width – ROI Size) / 2
* **Surface Threshold**: Used by surface finding algorithm, thresholding value for binarisation. May need to be tuned if surface detection has errors.
* **Surface Morph Size**: Used by surface finding algorithm, size of structuring element used for dilation following binarisation. May need to be tuned if surface detection has errors.
* **En Face Width/Height** : Size of the en face image generated in pixels. If Auto-Expand is on, the width can be set to the same size as the B-scans initially.
* **Vertical Search Range**: Maximum y-shift allowed for between images in pixels.
* **Template Height**: Height of the ROI used for the NCC in pixels.
* **Num En Face Reviews**: Raptor stores this many previously generated en face and fluorescence scans.
* **Track Depth**: If turned on then the live en face image will be generated relative to the estimated surface position of the sample at each B-scan. The En Face Depth value is then relative to this surface rather than the top of the B-scans. This can be turned on or off independently for the Volume Review in the Raptor window. 
* **Continuous Scan**: If turned on Raptor continuously generates en face images whenever the probe is moved. If tracking is lost then the current en face image is copied across to the en face review and a new en face image begins. If the size of a generated en face image exceeds the En Face Height parameter then the en face image is copied to the review, and a new en face image begins. It is still necessary to call ‘raptor_new_scan.vi’ to begin. 
* **Fluorescence Channel**: On if we have a fluorescence channel.
* **Auto Expand**: If on, the width of the en face and fluorescence image windows will be adjusted on the fly to accommodate the generated images (i.e. En Face Width is only used as the initial width).

## Raptor VI
Raptor VI will open when raptor_initialise.vi is called. Do not run raptor.vi directly as this will not initialise the frame buffers.
Start, Stop and New Scan buttons are provided but only use these if not controlling scans from OCT acquisition software.
Raptor Parameters cannot be changed at run-time, except for En Face Depth.
It is possible to save current en face and fluorescence images from the review panel, or the entire stack of B-scans selected to be used in the OCT image from the buttons on the right (under the Volume review). All files are saved in the save folder, specified in the folder box at the lower left. Filenames contain a timestamped to avoid over-writing. The OCT volume is saved as an IMAQ data dump.
The live B-scan is shown on the left. The live en face and fluorescence images are then shown. The en face and fluorescence reviews can be used to review previously generated images. The volume review can be used to re-slice the most recent volume at any depth.

## Implementation Notes
### Real-time performance
To allow the system to run at 250 Hz:
The surface position is only found every 4 reference frames (this frequency is hard-coded in the ‘constants’ state).
Display images and plots are only updated every 10 frames (this frequency is hard-coded in the ‘constants’ state).
Normalised cross correlation uses an OpenCV4 implementation in template_match.dll. Pre-filtering uses an OpenCV4 implementation in raptor.dll. 

### Units
Raptor is not given any physical dimensions or real frame rates, and so all displayed value are in pixel-based units. The y-axis of the velocity plot is in units of decorrelation distance per B-scan. (The decorrelation distance is the pre-calibrated out-of-plane distance required to reach the correlation threshold). This should be kept <1 during scanning to avoid under-sampling. Values approaching 2 will likely lead to distortions as true velocities above 2 tend to be under-estimated.  The displayed  velocity can be converted to microns per second by multiplying the displayed value by decorrelation distance (in microns) and then by the frame rate (in Hz). 
