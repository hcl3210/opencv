/*M///////////////////////////////////////////////////////////////////////////////////////
//
//  IMPORTANT: READ BEFORE DOWNLOADING, COPYING, INSTALLING OR USING.
//
//  By downloading, copying, installing or using the software you agree to this license.
//  If you do not agree to this license, do not download, install,
//  copy or use the software.
//
//
//                        Intel License Agreement
//                For Open Source Computer Vision Library
//
// Copyright (C) 2000, Intel Corporation, all rights reserved.
// Third party copyrights are property of their respective owners.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
//   * Redistribution's of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//   * Redistribution's in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//   * The name of Intel Corporation may not be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
// This software is provided by the copyright holders and contributors "as is" and
// any express or implied warranties, including, but not limited to, the implied
// warranties of merchantability and fitness for a particular purpose are disclaimed.
// In no event shall the Intel Corporation or contributors be liable for any direct,
// indirect, incidental, special, exemplary, or consequential damages
// (including, but not limited to, procurement of substitute goods or services;
// loss of use, data, or profits; or business interruption) however caused
// and on any theory of liability, whether in contract, strict liability,
// or tort (including negligence or otherwise) arising in any way out of
// the use of this software, even if advised of the possibility of such damage.
//
//M*/

// 2004-03-16, Gabriel Schreiber <schreiber@ient.rwth-aachen.de>
//             Mark Asbach       <asbach@ient.rwth-aachen.de>
//             Institute of Communications Engineering, RWTH Aachen University
// 2008-04-03, Xavier Delacour    <xavier.delacour@gmail.com>


// todo remove these..
#pragma SWIG nowarn=312,362,303,365,366,367,368,370,371,372,451,454,503


%{
#include "octhelpers.h"
#include "octcvseq.hpp"
#include "error.h"
%}


// direct SWIG to generate octave docstrings
%feature("autodoc", 1);

// include octave-specific files
%include "./octtypemaps.i"
%include "./cvshadow.i" 

// parse OpenCV headers
%include "../general/cv.i"

// Accessors for the CvMat and IplImage data structure are defined here
%include "./cvarr.i"

// Octave sequence compatibility for CvSeq
%include "./cvseq.i"


%include "./imagedata.i"

// include some wrappers to manipulate CvSeq types
%include "./octcvseq.hpp"

// aliases from #defines
%include "./cvaliases.i"

%insert(init) %{
  cvRedirectError(function_ptr_generator(), void_ptr_generator(), void_ptrptr_generator());
%}
