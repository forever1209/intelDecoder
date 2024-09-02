if(TARGET opencv::opencv_calib3d AND NOT TARGET opencv_calib3d)
    add_library(opencv_calib3d INTERFACE IMPORTED)
    set_property(TARGET opencv_calib3d PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_calib3d)
endif()
if(TARGET opencv::opencv_core AND NOT TARGET opencv_core)
    add_library(opencv_core INTERFACE IMPORTED)
    set_property(TARGET opencv_core PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_core)
endif()
if(TARGET opencv::opencv_dnn AND NOT TARGET opencv_dnn)
    add_library(opencv_dnn INTERFACE IMPORTED)
    set_property(TARGET opencv_dnn PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_dnn)
endif()
if(TARGET opencv::opencv_features2d AND NOT TARGET opencv_features2d)
    add_library(opencv_features2d INTERFACE IMPORTED)
    set_property(TARGET opencv_features2d PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_features2d)
endif()
if(TARGET opencv::opencv_flann AND NOT TARGET opencv_flann)
    add_library(opencv_flann INTERFACE IMPORTED)
    set_property(TARGET opencv_flann PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_flann)
endif()
if(TARGET opencv::opencv_gapi AND NOT TARGET opencv_gapi)
    add_library(opencv_gapi INTERFACE IMPORTED)
    set_property(TARGET opencv_gapi PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_gapi)
endif()
if(TARGET opencv::opencv_highgui AND NOT TARGET opencv_highgui)
    add_library(opencv_highgui INTERFACE IMPORTED)
    set_property(TARGET opencv_highgui PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_highgui)
endif()
if(TARGET opencv::opencv_imgcodecs AND NOT TARGET opencv_imgcodecs)
    add_library(opencv_imgcodecs INTERFACE IMPORTED)
    set_property(TARGET opencv_imgcodecs PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_imgcodecs)
endif()
if(TARGET opencv::opencv_imgproc AND NOT TARGET opencv_imgproc)
    add_library(opencv_imgproc INTERFACE IMPORTED)
    set_property(TARGET opencv_imgproc PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_imgproc)
endif()
if(TARGET opencv::opencv_ml AND NOT TARGET opencv_ml)
    add_library(opencv_ml INTERFACE IMPORTED)
    set_property(TARGET opencv_ml PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_ml)
endif()
if(TARGET opencv::opencv_objdetect AND NOT TARGET opencv_objdetect)
    add_library(opencv_objdetect INTERFACE IMPORTED)
    set_property(TARGET opencv_objdetect PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_objdetect)
endif()
if(TARGET opencv::opencv_photo AND NOT TARGET opencv_photo)
    add_library(opencv_photo INTERFACE IMPORTED)
    set_property(TARGET opencv_photo PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_photo)
endif()
if(TARGET opencv::opencv_stitching AND NOT TARGET opencv_stitching)
    add_library(opencv_stitching INTERFACE IMPORTED)
    set_property(TARGET opencv_stitching PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_stitching)
endif()
if(TARGET opencv::opencv_video AND NOT TARGET opencv_video)
    add_library(opencv_video INTERFACE IMPORTED)
    set_property(TARGET opencv_video PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_video)
endif()
if(TARGET opencv::opencv_videoio AND NOT TARGET opencv_videoio)
    add_library(opencv_videoio INTERFACE IMPORTED)
    set_property(TARGET opencv_videoio PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_videoio)
endif()
if(TARGET opencv::opencv_alphamat AND NOT TARGET opencv_alphamat)
    add_library(opencv_alphamat INTERFACE IMPORTED)
    set_property(TARGET opencv_alphamat PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_alphamat)
endif()
if(TARGET opencv::opencv_aruco AND NOT TARGET opencv_aruco)
    add_library(opencv_aruco INTERFACE IMPORTED)
    set_property(TARGET opencv_aruco PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_aruco)
endif()
if(TARGET opencv::opencv_barcode AND NOT TARGET opencv_barcode)
    add_library(opencv_barcode INTERFACE IMPORTED)
    set_property(TARGET opencv_barcode PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_barcode)
endif()
if(TARGET opencv::opencv_bgsegm AND NOT TARGET opencv_bgsegm)
    add_library(opencv_bgsegm INTERFACE IMPORTED)
    set_property(TARGET opencv_bgsegm PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_bgsegm)
endif()
if(TARGET opencv::opencv_bioinspired AND NOT TARGET opencv_bioinspired)
    add_library(opencv_bioinspired INTERFACE IMPORTED)
    set_property(TARGET opencv_bioinspired PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_bioinspired)
endif()
if(TARGET opencv::opencv_ccalib AND NOT TARGET opencv_ccalib)
    add_library(opencv_ccalib INTERFACE IMPORTED)
    set_property(TARGET opencv_ccalib PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_ccalib)
endif()
if(TARGET opencv::opencv_cudaarithm AND NOT TARGET opencv_cudaarithm)
    add_library(opencv_cudaarithm INTERFACE IMPORTED)
    set_property(TARGET opencv_cudaarithm PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudaarithm)
endif()
if(TARGET opencv::opencv_cudabgsegm AND NOT TARGET opencv_cudabgsegm)
    add_library(opencv_cudabgsegm INTERFACE IMPORTED)
    set_property(TARGET opencv_cudabgsegm PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudabgsegm)
endif()
if(TARGET opencv::opencv_cudacodec AND NOT TARGET opencv_cudacodec)
    add_library(opencv_cudacodec INTERFACE IMPORTED)
    set_property(TARGET opencv_cudacodec PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudacodec)
endif()
if(TARGET opencv::opencv_cudafeatures2d AND NOT TARGET opencv_cudafeatures2d)
    add_library(opencv_cudafeatures2d INTERFACE IMPORTED)
    set_property(TARGET opencv_cudafeatures2d PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudafeatures2d)
endif()
if(TARGET opencv::opencv_cudafilters AND NOT TARGET opencv_cudafilters)
    add_library(opencv_cudafilters INTERFACE IMPORTED)
    set_property(TARGET opencv_cudafilters PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudafilters)
endif()
if(TARGET opencv::opencv_cudaimgproc AND NOT TARGET opencv_cudaimgproc)
    add_library(opencv_cudaimgproc INTERFACE IMPORTED)
    set_property(TARGET opencv_cudaimgproc PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudaimgproc)
endif()
if(TARGET opencv::opencv_cudalegacy AND NOT TARGET opencv_cudalegacy)
    add_library(opencv_cudalegacy INTERFACE IMPORTED)
    set_property(TARGET opencv_cudalegacy PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudalegacy)
endif()
if(TARGET opencv::opencv_cudaobjdetect AND NOT TARGET opencv_cudaobjdetect)
    add_library(opencv_cudaobjdetect INTERFACE IMPORTED)
    set_property(TARGET opencv_cudaobjdetect PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudaobjdetect)
endif()
if(TARGET opencv::opencv_cudaoptflow AND NOT TARGET opencv_cudaoptflow)
    add_library(opencv_cudaoptflow INTERFACE IMPORTED)
    set_property(TARGET opencv_cudaoptflow PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudaoptflow)
endif()
if(TARGET opencv::opencv_cudastereo AND NOT TARGET opencv_cudastereo)
    add_library(opencv_cudastereo INTERFACE IMPORTED)
    set_property(TARGET opencv_cudastereo PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudastereo)
endif()
if(TARGET opencv::opencv_cudawarping AND NOT TARGET opencv_cudawarping)
    add_library(opencv_cudawarping INTERFACE IMPORTED)
    set_property(TARGET opencv_cudawarping PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudawarping)
endif()
if(TARGET opencv::opencv_cudev AND NOT TARGET opencv_cudev)
    add_library(opencv_cudev INTERFACE IMPORTED)
    set_property(TARGET opencv_cudev PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cudev)
endif()
if(TARGET opencv::opencv_cvv AND NOT TARGET opencv_cvv)
    add_library(opencv_cvv INTERFACE IMPORTED)
    set_property(TARGET opencv_cvv PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_cvv)
endif()
if(TARGET opencv::opencv_datasets AND NOT TARGET opencv_datasets)
    add_library(opencv_datasets INTERFACE IMPORTED)
    set_property(TARGET opencv_datasets PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_datasets)
endif()
if(TARGET opencv::opencv_dnn_objdetect AND NOT TARGET opencv_dnn_objdetect)
    add_library(opencv_dnn_objdetect INTERFACE IMPORTED)
    set_property(TARGET opencv_dnn_objdetect PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_dnn_objdetect)
endif()
if(TARGET opencv::opencv_dnn_superres AND NOT TARGET opencv_dnn_superres)
    add_library(opencv_dnn_superres INTERFACE IMPORTED)
    set_property(TARGET opencv_dnn_superres PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_dnn_superres)
endif()
if(TARGET opencv::opencv_dpm AND NOT TARGET opencv_dpm)
    add_library(opencv_dpm INTERFACE IMPORTED)
    set_property(TARGET opencv_dpm PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_dpm)
endif()
if(TARGET opencv::opencv_face AND NOT TARGET opencv_face)
    add_library(opencv_face INTERFACE IMPORTED)
    set_property(TARGET opencv_face PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_face)
endif()
if(TARGET opencv::opencv_freetype AND NOT TARGET opencv_freetype)
    add_library(opencv_freetype INTERFACE IMPORTED)
    set_property(TARGET opencv_freetype PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_freetype)
endif()
if(TARGET opencv::opencv_fuzzy AND NOT TARGET opencv_fuzzy)
    add_library(opencv_fuzzy INTERFACE IMPORTED)
    set_property(TARGET opencv_fuzzy PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_fuzzy)
endif()
if(TARGET opencv::opencv_hdf AND NOT TARGET opencv_hdf)
    add_library(opencv_hdf INTERFACE IMPORTED)
    set_property(TARGET opencv_hdf PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_hdf)
endif()
if(TARGET opencv::opencv_hfs AND NOT TARGET opencv_hfs)
    add_library(opencv_hfs INTERFACE IMPORTED)
    set_property(TARGET opencv_hfs PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_hfs)
endif()
if(TARGET opencv::opencv_img_hash AND NOT TARGET opencv_img_hash)
    add_library(opencv_img_hash INTERFACE IMPORTED)
    set_property(TARGET opencv_img_hash PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_img_hash)
endif()
if(TARGET opencv::opencv_intensity_transform AND NOT TARGET opencv_intensity_transform)
    add_library(opencv_intensity_transform INTERFACE IMPORTED)
    set_property(TARGET opencv_intensity_transform PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_intensity_transform)
endif()
if(TARGET opencv::opencv_line_descriptor AND NOT TARGET opencv_line_descriptor)
    add_library(opencv_line_descriptor INTERFACE IMPORTED)
    set_property(TARGET opencv_line_descriptor PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_line_descriptor)
endif()
if(TARGET opencv::opencv_mcc AND NOT TARGET opencv_mcc)
    add_library(opencv_mcc INTERFACE IMPORTED)
    set_property(TARGET opencv_mcc PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_mcc)
endif()
if(TARGET opencv::opencv_optflow AND NOT TARGET opencv_optflow)
    add_library(opencv_optflow INTERFACE IMPORTED)
    set_property(TARGET opencv_optflow PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_optflow)
endif()
if(TARGET opencv::opencv_ovis AND NOT TARGET opencv_ovis)
    add_library(opencv_ovis INTERFACE IMPORTED)
    set_property(TARGET opencv_ovis PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_ovis)
endif()
if(TARGET opencv::opencv_phase_unwrapping AND NOT TARGET opencv_phase_unwrapping)
    add_library(opencv_phase_unwrapping INTERFACE IMPORTED)
    set_property(TARGET opencv_phase_unwrapping PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_phase_unwrapping)
endif()
if(TARGET opencv::opencv_plot AND NOT TARGET opencv_plot)
    add_library(opencv_plot INTERFACE IMPORTED)
    set_property(TARGET opencv_plot PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_plot)
endif()
if(TARGET opencv::opencv_quality AND NOT TARGET opencv_quality)
    add_library(opencv_quality INTERFACE IMPORTED)
    set_property(TARGET opencv_quality PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_quality)
endif()
if(TARGET opencv::opencv_rapid AND NOT TARGET opencv_rapid)
    add_library(opencv_rapid INTERFACE IMPORTED)
    set_property(TARGET opencv_rapid PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_rapid)
endif()
if(TARGET opencv::opencv_reg AND NOT TARGET opencv_reg)
    add_library(opencv_reg INTERFACE IMPORTED)
    set_property(TARGET opencv_reg PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_reg)
endif()
if(TARGET opencv::opencv_rgbd AND NOT TARGET opencv_rgbd)
    add_library(opencv_rgbd INTERFACE IMPORTED)
    set_property(TARGET opencv_rgbd PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_rgbd)
endif()
if(TARGET opencv::opencv_saliency AND NOT TARGET opencv_saliency)
    add_library(opencv_saliency INTERFACE IMPORTED)
    set_property(TARGET opencv_saliency PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_saliency)
endif()
if(TARGET opencv::opencv_sfm AND NOT TARGET opencv_sfm)
    add_library(opencv_sfm INTERFACE IMPORTED)
    set_property(TARGET opencv_sfm PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_sfm)
endif()
if(TARGET opencv::opencv_shape AND NOT TARGET opencv_shape)
    add_library(opencv_shape INTERFACE IMPORTED)
    set_property(TARGET opencv_shape PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_shape)
endif()
if(TARGET opencv::opencv_stereo AND NOT TARGET opencv_stereo)
    add_library(opencv_stereo INTERFACE IMPORTED)
    set_property(TARGET opencv_stereo PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_stereo)
endif()
if(TARGET opencv::opencv_structured_light AND NOT TARGET opencv_structured_light)
    add_library(opencv_structured_light INTERFACE IMPORTED)
    set_property(TARGET opencv_structured_light PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_structured_light)
endif()
if(TARGET opencv::opencv_superres AND NOT TARGET opencv_superres)
    add_library(opencv_superres INTERFACE IMPORTED)
    set_property(TARGET opencv_superres PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_superres)
endif()
if(TARGET opencv::opencv_surface_matching AND NOT TARGET opencv_surface_matching)
    add_library(opencv_surface_matching INTERFACE IMPORTED)
    set_property(TARGET opencv_surface_matching PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_surface_matching)
endif()
if(TARGET opencv::opencv_text AND NOT TARGET opencv_text)
    add_library(opencv_text INTERFACE IMPORTED)
    set_property(TARGET opencv_text PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_text)
endif()
if(TARGET opencv::opencv_tracking AND NOT TARGET opencv_tracking)
    add_library(opencv_tracking INTERFACE IMPORTED)
    set_property(TARGET opencv_tracking PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_tracking)
endif()
if(TARGET opencv::opencv_videostab AND NOT TARGET opencv_videostab)
    add_library(opencv_videostab INTERFACE IMPORTED)
    set_property(TARGET opencv_videostab PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_videostab)
endif()
if(TARGET opencv::opencv_viz AND NOT TARGET opencv_viz)
    add_library(opencv_viz INTERFACE IMPORTED)
    set_property(TARGET opencv_viz PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_viz)
endif()
if(TARGET opencv::opencv_wechat_qrcode AND NOT TARGET opencv_wechat_qrcode)
    add_library(opencv_wechat_qrcode INTERFACE IMPORTED)
    set_property(TARGET opencv_wechat_qrcode PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_wechat_qrcode)
endif()
if(TARGET opencv::opencv_xfeatures2d AND NOT TARGET opencv_xfeatures2d)
    add_library(opencv_xfeatures2d INTERFACE IMPORTED)
    set_property(TARGET opencv_xfeatures2d PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_xfeatures2d)
endif()
if(TARGET opencv::opencv_ximgproc AND NOT TARGET opencv_ximgproc)
    add_library(opencv_ximgproc INTERFACE IMPORTED)
    set_property(TARGET opencv_ximgproc PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_ximgproc)
endif()
if(TARGET opencv::opencv_xobjdetect AND NOT TARGET opencv_xobjdetect)
    add_library(opencv_xobjdetect INTERFACE IMPORTED)
    set_property(TARGET opencv_xobjdetect PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_xobjdetect)
endif()
if(TARGET opencv::opencv_xphoto AND NOT TARGET opencv_xphoto)
    add_library(opencv_xphoto INTERFACE IMPORTED)
    set_property(TARGET opencv_xphoto PROPERTY INTERFACE_LINK_LIBRARIES opencv::opencv_xphoto)
endif()
if(TARGET opencv::ippiw AND NOT TARGET ippiw)
    add_library(ippiw INTERFACE IMPORTED)
    set_property(TARGET ippiw PROPERTY INTERFACE_LINK_LIBRARIES opencv::ippiw)
endif()
if(TARGET opencv::numeric AND NOT TARGET numeric)
    add_library(numeric INTERFACE IMPORTED)
    set_property(TARGET numeric PROPERTY INTERFACE_LINK_LIBRARIES opencv::numeric)
endif()
if(TARGET opencv::correspondence AND NOT TARGET correspondence)
    add_library(correspondence INTERFACE IMPORTED)
    set_property(TARGET correspondence PROPERTY INTERFACE_LINK_LIBRARIES opencv::correspondence)
endif()
if(TARGET opencv::multiview AND NOT TARGET multiview)
    add_library(multiview INTERFACE IMPORTED)
    set_property(TARGET multiview PROPERTY INTERFACE_LINK_LIBRARIES opencv::multiview)
endif()
