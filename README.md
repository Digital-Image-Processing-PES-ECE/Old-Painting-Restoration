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
1. Multi-Stage Inpainting:  Two-step inpainting refines restoration by targeting large-scale and subtle damage iteratively.
2. Adaptive Mask Refinement:  Dynamic mask generation post-inpainting ensures precise restoration of residual damage.
3. Dual Contrast Adjustment:  Combines RGB adjustments and LAB color enhancement for balanced brightness and vividness.
4. Detail Recovery with Deconvolution:  Uses Gaussian PSF to restore fine textures while avoiding artifacts.
5. Subtle Gamma Correction:  Enhances tonal response naturally to maintain artistic authenticity.
6. Metrics-Driven Evaluation:  Contrast and brightness metrics quantify restoration quality, aligning technical and visual accuracy.
7. Artistic Application: Tailored to preserve artistic nuances, unlike generic image restoration methods.

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
1. H. Ram and M. Choudhary, "Image processing methods performance for digital re-establishment of older paintings," Int. J. Sci. Res. (IJSR), vol. 3, no. 4, pp. 1480-1484, 2014.. 
2.	D. Pagrotra and N. Kaur, "A review paper on crack detection and restoration of old painting," Int. J. Sci. Res. (IJSR), vol. 3, no. 4, pp. 1420-1424, 2014. 
3.	S. Poornapushpakala, S. Barani, M. Subramoniam, and T. Vijayashree, "Restoration of Tanjore paintings using segmentation and in-painting techniques," Int. J. Sci. Res. (IJSR), vol. 3, no. 5, pp. 1723-1727, 2014. 


### Limitations and Future Work:
#### Limitations:
* The approach may not be effective for highly complex damage (e.g., severe distortion or large portions of missing content).
* Restoration quality is limited by the quality and condition of the input images.

#### Future Work:
* Integrating more advanced inpainting algorithms, or hybrid methods combining traditional techniques with machine learning for complex damage.
* Implementing the restoration method in real-time applications for use in museums and galleries for art preservation.
