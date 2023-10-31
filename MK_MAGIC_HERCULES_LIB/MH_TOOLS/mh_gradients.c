/*
 * gradients.c
 *
 *  Created on: 3 cze 2023
 *      Author: Miros³aw Kardaœ
 */


#include "../magic_hercules_cfg.h"





void mh_draw_rgb_gradient(int x, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode) {

    // Rozdzielenie sk³adowych koloru startowego
    uint8_t startR = (startColor >> 16) & 0xFF;
    uint8_t startG = (startColor >> 8) & 0xFF;
    uint8_t startB = startColor & 0xFF;

    // Rozdzielenie sk³adowych koloru koñcowego
    uint8_t endR = (endColor >> 16) & 0xFF;
    uint8_t endG = (endColor >> 8) & 0xFF;
    uint8_t endB = endColor & 0xFF;

    // Obliczenie kroków zmiany wartoœci sk³adników R, G, B na podstawie d³ugoœci paska
    int32_t stepR = ((int32_t)endR - (int32_t)startR) * 256 / length;
    int32_t stepG = ((int32_t)endG - (int32_t)startG) * 256 / length;
    int32_t stepB = ((int32_t)endB - (int32_t)startB) * 256 / length;

    // Sprawdzenie, czy kroki s¹ ujemne dla odpowiednich sk³adowych
    uint8_t reverseR = (stepR < 0) ? 1 : 0;
    uint8_t reverseG = (stepG < 0) ? 1 : 0;
    uint8_t reverseB = (stepB < 0) ? 1 : 0;

    // Jeœli kroki s¹ ujemne, odwracamy kierunek gradientu
    if(reverseR) stepR = -stepR;
    if(reverseG) stepG = -stepG;
    if(reverseB) stepB = -stepB;

    // Rysowanie gradientu piksel po pikselu
    for (int i = 0; i < length; i++) {
        // Obliczenie aktualnych wartoœci sk³adników R, G, B
        uint8_t currentR = startR + (stepR * i / 256);
        uint8_t currentG = startG + (stepG * i / 256);
        uint8_t currentB = startB + (stepB * i / 256);

        // Jeœli kroki s¹ ujemne, odwracamy kolor
        if (reverseR) currentR = startR - (stepR * i / 256);
        if (reverseG) currentG = startG - (stepG * i / 256);
        if (reverseB) currentB = startB - (stepB * i / 256);

        // Rysowanie piksela o obliczonym kolorze
        uint32_t color = ((uint32_t)currentR << 16) | ((uint32_t)currentG << 8) | currentB;
        mh_set_pixel(x + i, color, mode);
    }
}








void mh_draw_hsv_gradient(int x, int length, uint8_t startH, uint8_t startS, uint8_t startV,
											 uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode ) {

    uint8_t swapH = 0, swapS = 0, swapV = 0;

    // Sprawdzenie, czy kolor pocz¹tkowy jest wiêkszy ni¿ kolor koñcowy dla sk³adników H, S, V
    if (startH > endH) {
        swapH = 1;
        uint8_t tempH = startH;
        startH = endH;
        endH = tempH;
    }
    if (startS > endS) {
        swapS = 1;
        uint8_t tempS = startS;
        startS = endS;
        endS = tempS;
    }
    if (startV > endV) {
        swapV = 1;
        uint8_t tempV = startV;
        startV = endV;
        endV = tempV;
    }

    // Obliczenie kroków zmiany wartoœci sk³adników H, S, V na podstawie d³ugoœci paska
    int16_t stepH = ((int32_t)endH - (int32_t)startH) * 256 / length;
    int16_t stepS = ((int32_t)endS - (int32_t)startS) * 256 / length;
    int16_t stepV = ((int32_t)endV - (int32_t)startV) * 256 / length;

    // Rysowanie gradientu piksel po pikselu
    for (int i = 0; i < length; i++) {
        // Obliczenie aktualnych wartoœci sk³adników H, S, V
        uint8_t currentH = startH + (stepH * i >> 8);
        uint8_t currentS = startS + (stepS * i >> 8);
        uint8_t currentV = startV + (stepV * i >> 8);

        // Odwrócenie gradientu, jeœli kolor pocz¹tkowy jest wiêkszy od koñcowego
        if (swapH) currentH = endH - (stepH * i >> 8);
        if (swapS) currentS = endS - (stepS * i >> 8);
        if (swapV) currentV = endV - (stepV * i >> 8);


        // Rysowanie piksela o obliczonym kolorze w przestrzeni HSV
        uint32_t color = mh_hsv_to_rgb(currentH, currentS, currentV);
        mh_set_pixel(x + i, color, mode);
    }
}






