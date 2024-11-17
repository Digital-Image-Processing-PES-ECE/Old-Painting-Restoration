# Old Painting Restoration

### Project Description:

#### Summary - 
This project focuses on restoring degraded and damaged paintings using traditional Digital Image Processing (DIP) techniques. The goal is to enhance the visual appeal of old artworks while preserving their original artistic integrity.

#### Course concepts used - 
1. **Image Processing**: Grayscale conversion, thresholding, and masking techniques to identify damaged areas.
2. **Inpainting**: Restoration of missing or damaged parts by analyzing neighboring pixels for seamless filling.
3. **Enhancement Techniques**: Contrast adjustment and sharpening to improve the visual quality of restored images.

#### Additional concepts used -
1. **Region-based Inpainting**: Inpainting to restore damaged areas by considering the surrounding image texture.
2. **Post-restoration Sharpening**: Enhancing image details and edges to ensure fine features are preserved.

#### Dataset - 
The dataset consists of digital images of old, degraded paintings. These images feature various types of damage such as scratches, dust, and missing portions. The images were sourced from publicly available online archives of historical art.

#### Novelty - 
1. Automated damage detection using intensity thresholding, reducing manual effort in identifying degraded regions.
2. Seamless inpainting that accurately fills damaged regions by analyzing neighboring undamaged pixels.
3. Utilization of traditional DIP methods, providing a computationally efficient and simple solution compared to modern machine learning-based techniques.

### Contributors:
1. **Jane Sharon (PES1UG22EC901)**
2. **Manthan BT (PES1UG22EC907)**
3. **Deepa Kulkarni (PES1UG22EC908)**

### Steps:
1. **Preprocessing**: Convert the image to grayscale and generate a binary mask of degraded areas.
2. **Restoration**: Apply inpainting to fill the damaged regions.
3. **Enhancement**: Adjust contrast and sharpen the image to improve visual quality.

### Outputs:
* **Important intermediate steps**:  
   - Grayscale conversion and damage detection through thresholding.  
   - Region-based inpainting to restore damaged portions of the image.  
   - Contrast adjustment and sharpening for final visual enhancement.

* **Final output images**:  
   Restored images with improved aesthetics, preserving the original artwork's integrity.

### References:
1. MATLAB Documentation on `regionfill`, `imadjust`, and `imsharpen`.
2. Research papers and online resources on traditional image restoration techniques and inpainting methods.

### Limitations and Future Work:
#### Limitations:
* The approach may not be effective for highly complex damage (e.g., severe distortion or large portions of missing content).
* Restoration quality is limited by the quality and condition of the input images.

#### Future Work:
* Integrating more advanced inpainting algorithms, or hybrid methods combining traditional techniques with machine learning for complex damage.
* Implementing the restoration method in real-time applications for use in museums and galleries for art preservation.
