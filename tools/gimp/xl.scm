; xl: xl gimp plugin
; Copyright (C) 2012 Juan Manuel Borges Caño

; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.

; cp xl.scm ~/.gimp-$version/scripts/

(define (xl-make-scale filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(gimp-image-scale image 512 512)
		(gimp-brightness-contrast drawable 75 75)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-seamless filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-enhance filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(gimp-brightness-contrast drawable 25 50)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-emboss filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-emboss RUN-NONINTERACTIVE image drawable 30.0 45.0 20 0)
		(gimp-brightness-contrast drawable 75 75)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-oilify filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-oilify RUN-NONINTERACTIVE image drawable 15 1)
		(gimp-brightness-contrast drawable 25 50)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-cartoon filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-cartoon RUN-NONINTERACTIVE image drawable 50.0 1.0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-mosaic filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-mosaic RUN-NONINTERACTIVE image drawable 50.0 10.0 10.0 0.50 1 100.0 0.00 1 0 1 0 0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-cubism filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-cubism RUN-NONINTERACTIVE image drawable 15.0 2.5 0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-softglow filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-softglow RUN-NONINTERACTIVE image drawable 25.0 0.5 0.5)
		(gimp-brightness-contrast drawable 25 50)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-spread filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-spread RUN-NONINTERACTIVE image drawable 50.0 50.0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-dog filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-dog RUN-NONINTERACTIVE image drawable 30.0 1.0 TRUE FALSE)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-gauss filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-gauss RUN-NONINTERACTIVE image drawable 25.0 25.0 1)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-sobel filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-sobel RUN-NONINTERACTIVE image drawable 1 1 1)
		(gimp-brightness-contrast drawable 25 50)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-neon filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-neon RUN-NONINTERACTIVE image drawable 10.0 0.0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-laplace filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-laplace RUN-NONINTERACTIVE image drawable)
		(gimp-brightness-contrast drawable 75 75)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-edgesobel filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-edge RUN-NONINTERACTIVE image drawable 3.0 2 0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-edgelaplace filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-edge RUN-NONINTERACTIVE image drawable 3.0 2 5)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
(define (xl-make-noise filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-rgb-noise RUN-NONINTERACTIVE image drawable 1 0 0.75 0.75 0.75 0.0)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
;(define (xl-make-clothify filein fileout)
;	(let* (
;		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
;		(drawable (car (gimp-image-get-active-drawable image)))
;	)
;		(script-fu-clothify RUN-NONINTERACTIVE image drawable 3.0 3.0 360 1.0 10.0)
;		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
;		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
;		(gimp-image-delete image)
;	)
;)
(define (xl-make-sharpen filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(plug-in-sharpen RUN-NONINTERACTIVE image drawable 85)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
;(define (xl-make-predator filein fileout)
;	(let* (
;		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
;		(drawable (car (gimp-image-get-active-drawable image)))
;	)
;		(gimp-selection-all image)
;		(script-fu-predator RUN-NONINTERACTIVE image drawable 1.0 0 3.0 0 0)
;		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
;		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
;		(gimp-image-delete image)
;	)
;)
(define (xl-make-desaturate filein fileout)
	(let* (
		(image (car (gimp-file-load RUN-NONINTERACTIVE filein filein)))
		(drawable (car (gimp-image-get-active-drawable image)))
	)
		(gimp-desaturate-full drawable 1)
		(plug-in-make-seamless RUN-NONINTERACTIVE image drawable)
		(gimp-file-save RUN-NONINTERACTIVE image drawable fileout fileout)
		(gimp-image-delete image)
	)
)
