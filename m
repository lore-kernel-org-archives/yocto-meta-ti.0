Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9A50E007E1
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 22:58:10 -0800 (PST)
Received: by mail-pb0-f50.google.com with SMTP id rr13so11479991pbb.23
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 22:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rvY4r8iIfvxNa9Sd6sPdkaZ9u4Q7LWj19xSKB5fBjIQ=;
	b=EDIVpIj8C1is699udZwf/r6vLGUa0/gsEaKJykjBeTuDQ2Hw0Yj+4M/GskwAnl4CUD
	lI2RtofN4vxfMMkI5VOLfTluFSF7liuQJqziM3gtzsyM2QPJ1eNV6XeW0i2LnaluDopa
	/bAziSdkAtWMtyETOObBgZfpio/tH9MgxVotnME6vjaZsNeCWyxh6eW1gNDfgVEWTH1Q
	YQRxY4DRL/y45dGCDYre7M8zOzZu19HNreBebPhgHPNnqiI+2BAqoYPoLqfTyHXzpdIq
	Q+FsK+XnxJT95ZreCrPYrMeN/3TdMqM+ujNpKRYfPrR3Q8Xcb/CItReXYqXWLoK9Cg2c
	8byA==
X-Received: by 10.68.204.136 with SMTP id ky8mr9152127pbc.33.1386831489742;
	Wed, 11 Dec 2013 22:58:09 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id vh3sm37657854pbc.8.2013.12.11.22.58.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Dec 2013 22:58:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Dec 2013 22:58:24 -0800
Message-Id: <1386831504-25028-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libgles-omap3: Update EGL includes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Dec 2013 06:58:12 -0000

Update include/OGLES{,2}/EGL/* to those shipped with mesa_9.2.4
The currently shipped eglext.h breaks cogl-1.0_1.16.0 because
it lacks EGL_SYNC_FENCE_KHR.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../0001-Update-OGLES-EGL-includes.patch           |  595 ++++++++++++++++++++
 .../0002-Update-OGLES2-EGL-includes.patch          |  595 ++++++++++++++++++++
 .../libgles/libgles-omap3_5.00.00.01.bb            |    2 +
 3 files changed, 1192 insertions(+)
 create mode 100644 recipes-graphics/libgles/libgles-omap3-5.00.00.01/0001-Update-OGLES-EGL-includes.patch
 create mode 100644 recipes-graphics/libgles/libgles-omap3-5.00.00.01/0002-Update-OGLES2-EGL-includes.patch

diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/0001-Update-OGLES-EGL-includes.patch b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/0001-Update-OGLES-EGL-includes.patch
new file mode 100644
index 0000000..b535ae0
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/0001-Update-OGLES-EGL-includes.patch
@@ -0,0 +1,595 @@
+Index: Graphics_SDK_5_00_00_01/include/OGLES/EGL/egl.h
+===================================================================
+--- Graphics_SDK_5_00_00_01.orig/include/OGLES/EGL/egl.h	2013-07-05 04:43:13.000000000 -0700
++++ Graphics_SDK_5_00_00_01/include/OGLES/EGL/egl.h	2013-12-11 20:01:34.792853918 -0800
+@@ -1,6 +1,7 @@
+ /* -*- mode: c; tab-width: 8; -*- */
+ /* vi: set sw=4 ts=8: */
+ /* Reference version of egl.h for EGL 1.4.
++ * $Revision: 9356 $ on $Date: 2009-10-21 02:52:25 -0700 (Wed, 21 Oct 2009) $
+  */
+ 
+ /*
+@@ -108,7 +109,6 @@
+ #define EGL_NATIVE_RENDERABLE		0x302D
+ #define EGL_NATIVE_VISUAL_ID		0x302E
+ #define EGL_NATIVE_VISUAL_TYPE		0x302F
+-#define EGL_PRESERVED_RESOURCES		0x3030
+ #define EGL_SAMPLES			0x3031
+ #define EGL_SAMPLE_BUFFERS		0x3032
+ #define EGL_SURFACE_TYPE		0x3033
+Index: Graphics_SDK_5_00_00_01/include/OGLES/EGL/eglext.h
+===================================================================
+--- Graphics_SDK_5_00_00_01.orig/include/OGLES/EGL/eglext.h	2013-07-05 04:43:13.000000000 -0700
++++ Graphics_SDK_5_00_00_01/include/OGLES/EGL/eglext.h	2013-12-11 19:59:40.060852005 -0800
+@@ -6,7 +6,7 @@
+ #endif
+ 
+ /*
+-** Copyright (c) 2007-2009 The Khronos Group Inc.
++** Copyright (c) 2007-2013 The Khronos Group Inc.
+ **
+ ** Permission is hereby granted, free of charge, to any person obtaining a
+ ** copy of this software and/or associated documentation files (the
+@@ -34,7 +34,8 @@
+ 
+ /* Header file version number */
+ /* Current version at http://www.khronos.org/registry/egl/ */
+-#define EGL_EGLEXT_VERSION 4
++/* $Revision: 21254 $ on $Date: 2013-04-25 03:11:55 -0700 (Thu, 25 Apr 2013) $ */
++#define EGL_EGLEXT_VERSION 16
+ 
+ #ifndef EGL_KHR_config_attribs
+ #define EGL_KHR_config_attribs 1
+@@ -119,6 +120,7 @@
+ #define EGL_GL_RENDERBUFFER_KHR			0x30B9	/* eglCreateImageKHR target */
+ #endif
+ 
++#if KHRONOS_SUPPORT_INT64   /* EGLTimeKHR requires 64-bit uint support */
+ #ifndef EGL_KHR_reusable_sync
+ #define EGL_KHR_reusable_sync 1
+ 
+@@ -142,11 +144,12 @@
+ EGLAPI EGLBoolean EGLAPIENTRY eglSignalSyncKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
+ EGLAPI EGLBoolean EGLAPIENTRY eglGetSyncAttribKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
+ #endif /* EGL_EGLEXT_PROTOTYPES */
+-typedef EGLSyncKHR (EGLAPIENTRYP PFNEGLCREATESYNCKHR) (EGLDisplay dpy, EGLenum type, const EGLint *attrib_list);
+-typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCKHR) (EGLDisplay dpy, EGLSyncKHR sync);
+-typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCKHR) (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
+-typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCKHR) (EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
+-typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBKHR) (EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
++typedef EGLSyncKHR (EGLAPIENTRYP PFNEGLCREATESYNCKHRPROC) (EGLDisplay dpy, EGLenum type, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync);
++typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
++#endif
+ #endif
+ 
+ #ifndef EGL_KHR_image_base
+@@ -168,8 +171,410 @@
+ #define EGL_CONTEXT_PRIORITY_LOW_IMG		0x3103
+ #endif
+ 
++#ifndef EGL_KHR_lock_surface2
++#define EGL_KHR_lock_surface2 1
++#define EGL_BITMAP_PIXEL_SIZE_KHR		0x3110
++#endif
++
++#ifndef EGL_NV_coverage_sample
++#define EGL_NV_coverage_sample 1
++#define EGL_COVERAGE_BUFFERS_NV			0x30E0
++#define EGL_COVERAGE_SAMPLES_NV			0x30E1
++#endif
++
++#ifndef EGL_NV_depth_nonlinear
++#define EGL_NV_depth_nonlinear 1
++#define EGL_DEPTH_ENCODING_NV			0x30E2
++#define EGL_DEPTH_ENCODING_NONE_NV 0
++#define EGL_DEPTH_ENCODING_NONLINEAR_NV		0x30E3
++#endif
++
++#if KHRONOS_SUPPORT_INT64   /* EGLTimeNV requires 64-bit uint support */
++#ifndef EGL_NV_sync
++#define EGL_NV_sync 1
++#define EGL_SYNC_PRIOR_COMMANDS_COMPLETE_NV	0x30E6
++#define EGL_SYNC_STATUS_NV			0x30E7
++#define EGL_SIGNALED_NV				0x30E8
++#define EGL_UNSIGNALED_NV			0x30E9
++#define EGL_SYNC_FLUSH_COMMANDS_BIT_NV		0x0001
++#define EGL_FOREVER_NV				0xFFFFFFFFFFFFFFFFull
++#define EGL_ALREADY_SIGNALED_NV			0x30EA
++#define EGL_TIMEOUT_EXPIRED_NV			0x30EB
++#define EGL_CONDITION_SATISFIED_NV		0x30EC
++#define EGL_SYNC_TYPE_NV			0x30ED
++#define EGL_SYNC_CONDITION_NV			0x30EE
++#define EGL_SYNC_FENCE_NV			0x30EF
++#define EGL_NO_SYNC_NV				((EGLSyncNV)0)
++typedef void* EGLSyncNV;
++typedef khronos_utime_nanoseconds_t EGLTimeNV;
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSyncNV EGLAPIENTRY eglCreateFenceSyncNV (EGLDisplay dpy, EGLenum condition, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroySyncNV (EGLSyncNV sync);
++EGLAPI EGLBoolean EGLAPIENTRY eglFenceNV (EGLSyncNV sync);
++EGLAPI EGLint EGLAPIENTRY eglClientWaitSyncNV (EGLSyncNV sync, EGLint flags, EGLTimeNV timeout);
++EGLAPI EGLBoolean EGLAPIENTRY eglSignalSyncNV (EGLSyncNV sync, EGLenum mode);
++EGLAPI EGLBoolean EGLAPIENTRY eglGetSyncAttribNV (EGLSyncNV sync, EGLint attribute, EGLint *value);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLSyncNV (EGLAPIENTRYP PFNEGLCREATEFENCESYNCNVPROC) (EGLDisplay dpy, EGLenum condition, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCNVPROC) (EGLSyncNV sync);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLFENCENVPROC) (EGLSyncNV sync);
++typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCNVPROC) (EGLSyncNV sync, EGLint flags, EGLTimeNV timeout);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCNVPROC) (EGLSyncNV sync, EGLenum mode);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBNVPROC) (EGLSyncNV sync, EGLint attribute, EGLint *value);
++#endif
++#endif
++
++#if KHRONOS_SUPPORT_INT64   /* Dependent on EGL_KHR_reusable_sync which requires 64-bit uint support */
++#ifndef EGL_KHR_fence_sync
++#define EGL_KHR_fence_sync 1
++/* Reuses most tokens and entry points from EGL_KHR_reusable_sync */
++#define EGL_SYNC_PRIOR_COMMANDS_COMPLETE_KHR	0x30F0
++#define EGL_SYNC_CONDITION_KHR			0x30F8
++#define EGL_SYNC_FENCE_KHR			0x30F9
++#endif
++#endif
++
++#ifndef EGL_HI_clientpixmap
++#define EGL_HI_clientpixmap 1
++
++/* Surface Attribute */
++#define EGL_CLIENT_PIXMAP_POINTER_HI		0x8F74
++/*
++ * Structure representing a client pixmap
++ * (pixmap's data is in client-space memory).
++ */
++struct EGLClientPixmapHI
++{
++	void*		pData;
++	EGLint		iWidth;
++	EGLint		iHeight;
++	EGLint		iStride;
++};
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurfaceHI(EGLDisplay dpy, EGLConfig config, struct EGLClientPixmapHI* pixmap);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPIXMAPSURFACEHIPROC) (EGLDisplay dpy, EGLConfig config, struct EGLClientPixmapHI* pixmap);
++#endif	/* EGL_HI_clientpixmap */
++
++#ifndef EGL_HI_colorformats
++#define EGL_HI_colorformats 1
++/* Config Attribute */
++#define EGL_COLOR_FORMAT_HI			0x8F70
++/* Color Formats */
++#define EGL_COLOR_RGB_HI			0x8F71
++#define EGL_COLOR_RGBA_HI			0x8F72
++#define EGL_COLOR_ARGB_HI			0x8F73
++#endif /* EGL_HI_colorformats */
++
++#ifndef EGL_MESA_drm_image
++#define EGL_MESA_drm_image 1
++#define EGL_DRM_BUFFER_FORMAT_MESA		0x31D0	    /* CreateDRMImageMESA attribute */
++#define EGL_DRM_BUFFER_USE_MESA			0x31D1	    /* CreateDRMImageMESA attribute */
++#define EGL_DRM_BUFFER_FORMAT_ARGB32_MESA	0x31D2	    /* EGL_IMAGE_FORMAT_MESA attribute value */
++#define EGL_DRM_BUFFER_MESA			0x31D3	    /* eglCreateImageKHR target */
++#define EGL_DRM_BUFFER_STRIDE_MESA		0x31D4
++#define EGL_DRM_BUFFER_USE_SCANOUT_MESA		0x00000001  /* EGL_DRM_BUFFER_USE_MESA bits */
++#define EGL_DRM_BUFFER_USE_SHARE_MESA		0x00000002  /* EGL_DRM_BUFFER_USE_MESA bits */
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLImageKHR EGLAPIENTRY eglCreateDRMImageMESA (EGLDisplay dpy, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglExportDRMImageMESA (EGLDisplay dpy, EGLImageKHR image, EGLint *name, EGLint *handle, EGLint *stride);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLImageKHR (EGLAPIENTRYP PFNEGLCREATEDRMIMAGEMESAPROC) (EGLDisplay dpy, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLEXPORTDRMIMAGEMESAPROC) (EGLDisplay dpy, EGLImageKHR image, EGLint *name, EGLint *handle, EGLint *stride);
++#endif
++
++#ifndef EGL_NV_post_sub_buffer
++#define EGL_NV_post_sub_buffer 1
++#define EGL_POST_SUB_BUFFER_SUPPORTED_NV	0x30BE
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglPostSubBufferNV (EGLDisplay dpy, EGLSurface surface, EGLint x, EGLint y, EGLint width, EGLint height);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLPOSTSUBBUFFERNVPROC) (EGLDisplay dpy, EGLSurface surface, EGLint x, EGLint y, EGLint width, EGLint height);
++#endif
++
++#ifndef EGL_ANGLE_query_surface_pointer
++#define EGL_ANGLE_query_surface_pointer 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean eglQuerySurfacePointerANGLE(EGLDisplay dpy, EGLSurface surface, EGLint attribute, void **value);
++#endif
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSURFACEPOINTERANGLEPROC) (EGLDisplay dpy, EGLSurface surface, EGLint attribute, void **value);
++#endif
++
++#ifndef EGL_ANGLE_surface_d3d_texture_2d_share_handle
++#define EGL_ANGLE_surface_d3d_texture_2d_share_handle 1
++#define EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE	0x3200
++#endif
++
++#ifndef EGL_NV_coverage_sample_resolve
++#define EGL_NV_coverage_sample_resolve 1
++#define EGL_COVERAGE_SAMPLE_RESOLVE_NV		0x3131
++#define EGL_COVERAGE_SAMPLE_RESOLVE_DEFAULT_NV	0x3132
++#define EGL_COVERAGE_SAMPLE_RESOLVE_NONE_NV	0x3133
++#endif
++
++#if KHRONOS_SUPPORT_INT64   /* EGLuint64NV requires 64-bit uint support */
++#ifndef EGL_NV_system_time
++#define EGL_NV_system_time 1
++typedef khronos_utime_nanoseconds_t EGLuint64NV;
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLuint64NV EGLAPIENTRY eglGetSystemTimeFrequencyNV(void);
++EGLAPI EGLuint64NV EGLAPIENTRY eglGetSystemTimeNV(void);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLuint64NV (EGLAPIENTRYP PFNEGLGETSYSTEMTIMEFREQUENCYNVPROC) (void);
++typedef EGLuint64NV (EGLAPIENTRYP PFNEGLGETSYSTEMTIMENVPROC) (void);
++#endif
++#endif
++
++#if KHRONOS_SUPPORT_INT64 /* EGLuint64KHR requires 64-bit uint support */
++#ifndef EGL_KHR_stream
++#define EGL_KHR_stream 1
++typedef void* EGLStreamKHR;
++typedef khronos_uint64_t EGLuint64KHR;
++#define EGL_NO_STREAM_KHR			((EGLStreamKHR)0)
++#define EGL_CONSUMER_LATENCY_USEC_KHR		0x3210
++#define EGL_PRODUCER_FRAME_KHR			0x3212
++#define EGL_CONSUMER_FRAME_KHR			0x3213
++#define EGL_STREAM_STATE_KHR			0x3214
++#define EGL_STREAM_STATE_CREATED_KHR		0x3215
++#define EGL_STREAM_STATE_CONNECTING_KHR		0x3216
++#define EGL_STREAM_STATE_EMPTY_KHR		0x3217
++#define EGL_STREAM_STATE_NEW_FRAME_AVAILABLE_KHR    0x3218
++#define EGL_STREAM_STATE_OLD_FRAME_AVAILABLE_KHR    0x3219
++#define EGL_STREAM_STATE_DISCONNECTED_KHR	0x321A
++#define EGL_BAD_STREAM_KHR			0x321B
++#define EGL_BAD_STATE_KHR			0x321C
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLStreamKHR EGLAPIENTRY eglCreateStreamKHR(EGLDisplay dpy, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroyStreamKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamAttribKHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint value);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamKHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint *value);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamu64KHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLuint64KHR *value);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLStreamKHR (EGLAPIENTRYP PFNEGLCREATESTREAMKHRPROC)(EGLDisplay dpy, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSTREAMKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMATTRIBKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint value);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint *value);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMU64KHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLuint64KHR *value);
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_consumer_gltexture
++#define EGL_KHR_stream_consumer_gltexture 1
++#define EGL_CONSUMER_ACQUIRE_TIMEOUT_USEC_KHR	0x321E
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerGLTextureExternalKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerAcquireKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerReleaseKHR(EGLDisplay dpy, EGLStreamKHR stream);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERGLTEXTUREEXTERNALKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERACQUIREKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERRELEASEKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_producer_eglsurface
++#define EGL_KHR_stream_producer_eglsurface 1
++#define EGL_STREAM_BIT_KHR			0x0800
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSurface EGLAPIENTRY eglCreateStreamProducerSurfaceKHR(EGLDisplay dpy, EGLConfig config, EGLStreamKHR stream, const EGLint *attrib_list);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATESTREAMPRODUCERSURFACEKHRPROC)(EGLDisplay dpy, EGLConfig config, EGLStreamKHR stream, const EGLint *attrib_list);
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_producer_aldatalocator
++#define EGL_KHR_stream_producer_aldatalocator 1
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_fifo
++#define EGL_KHR_stream_fifo 1
++/* reuse EGLTimeKHR */
++#define EGL_STREAM_FIFO_LENGTH_KHR		0x31FC
++#define EGL_STREAM_TIME_NOW_KHR			0x31FD
++#define EGL_STREAM_TIME_CONSUMER_KHR		0x31FE
++#define EGL_STREAM_TIME_PRODUCER_KHR		0x31FF
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamTimeKHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLTimeKHR *value);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMTIMEKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLTimeKHR *value);
++#endif
++#endif
++
++#ifndef EGL_EXT_create_context_robustness
++#define EGL_EXT_create_context_robustness 1
++#define EGL_CONTEXT_OPENGL_ROBUST_ACCESS_EXT	0x30BF
++#define EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_EXT 0x3138
++#define EGL_NO_RESET_NOTIFICATION_EXT		0x31BE
++#define EGL_LOSE_CONTEXT_ON_RESET_EXT		0x31BF
++#endif
++
++#ifndef EGL_ANGLE_d3d_share_handle_client_buffer
++#define EGL_ANGLE_d3d_share_handle_client_buffer 1
++/* reuse EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE */
++#endif
++
++#ifndef EGL_KHR_create_context
++#define EGL_KHR_create_context 1
++#define EGL_CONTEXT_MAJOR_VERSION_KHR			    EGL_CONTEXT_CLIENT_VERSION
++#define EGL_CONTEXT_MINOR_VERSION_KHR			    0x30FB
++#define EGL_CONTEXT_FLAGS_KHR				    0x30FC
++#define EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR		    0x30FD
++#define EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_KHR  0x31BD
++#define EGL_NO_RESET_NOTIFICATION_KHR			    0x31BE
++#define EGL_LOSE_CONTEXT_ON_RESET_KHR			    0x31BF
++#define EGL_CONTEXT_OPENGL_DEBUG_BIT_KHR		    0x00000001
++#define EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE_BIT_KHR	    0x00000002
++#define EGL_CONTEXT_OPENGL_ROBUST_ACCESS_BIT_KHR	    0x00000004
++#define EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT_KHR		    0x00000001
++#define EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT_KHR    0x00000002
++#define EGL_OPENGL_ES3_BIT_KHR				    0x00000040
++#endif
++
++#ifndef EGL_KHR_surfaceless_context
++#define EGL_KHR_surfaceless_context 1
++/* No tokens/entry points, just relaxes an error condition */
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_cross_process_fd
++#define EGL_KHR_stream_cross_process_fd 1
++typedef int EGLNativeFileDescriptorKHR;
++#define EGL_NO_FILE_DESCRIPTOR_KHR		((EGLNativeFileDescriptorKHR)(-1))
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLNativeFileDescriptorKHR EGLAPIENTRY eglGetStreamFileDescriptorKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLStreamKHR EGLAPIENTRY eglCreateStreamFromFileDescriptorKHR(EGLDisplay dpy, EGLNativeFileDescriptorKHR file_descriptor);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLNativeFileDescriptorKHR (EGLAPIENTRYP PFNEGLGETSTREAMFILEDESCRIPTORKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLStreamKHR (EGLAPIENTRYP PFNEGLCREATESTREAMFROMFILEDESCRIPTORKHRPROC)(EGLDisplay dpy, EGLNativeFileDescriptorKHR file_descriptor);
++#endif
++#endif
++
++#ifndef EGL_EXT_multiview_window
++#define EGL_EXT_multiview_window 1
++#define EGL_MULTIVIEW_VIEW_COUNT_EXT		0x3134
++#endif
++
++#ifndef EGL_KHR_wait_sync
++#define EGL_KHR_wait_sync 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLint EGLAPIENTRY eglWaitSyncKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLint flags);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLint (EGLAPIENTRYP PFNEGLWAITSYNCKHRPROC)(EGLDisplay dpy, EGLSyncKHR sync, EGLint flags);
++#endif
++
++#ifndef EGL_NV_post_convert_rounding
++#define EGL_NV_post_convert_rounding 1
++/* No tokens or entry points, just relaxes behavior of SwapBuffers */
++#endif
++
++#ifndef EGL_NV_native_query
++#define EGL_NV_native_query 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativeDisplayNV( EGLDisplay dpy, EGLNativeDisplayType* display_id);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativeWindowNV( EGLDisplay dpy, EGLSurface surf, EGLNativeWindowType* window);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativePixmapNV( EGLDisplay dpy, EGLSurface surf, EGLNativePixmapType* pixmap);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEDISPLAYNVPROC)(EGLDisplay dpy, EGLNativeDisplayType *display_id);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEWINDOWNVPROC)(EGLDisplay dpy, EGLSurface surf, EGLNativeWindowType *window);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEPIXMAPNVPROC)(EGLDisplay dpy, EGLSurface surf, EGLNativePixmapType *pixmap);
++#endif
++
++#ifndef EGL_NV_3dvision_surface
++#define EGL_NV_3dvision_surface 1
++#define EGL_AUTO_STEREO_NV			0x3136
++#endif
++
++#ifndef EGL_ANDROID_framebuffer_target
++#define EGL_ANDROID_framebuffer_target 1
++#define EGL_FRAMEBUFFER_TARGET_ANDROID		0x3147
++#endif
++
++#ifndef EGL_ANDROID_blob_cache
++#define EGL_ANDROID_blob_cache 1
++typedef khronos_ssize_t EGLsizeiANDROID;
++typedef void (*EGLSetBlobFuncANDROID) (const void *key, EGLsizeiANDROID keySize, const void *value, EGLsizeiANDROID valueSize);
++typedef EGLsizeiANDROID (*EGLGetBlobFuncANDROID) (const void *key, EGLsizeiANDROID keySize, void *value, EGLsizeiANDROID valueSize);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI void EGLAPIENTRY eglSetBlobCacheFuncsANDROID(EGLDisplay dpy, EGLSetBlobFuncANDROID set, EGLGetBlobFuncANDROID get);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef void (EGLAPIENTRYP PFNEGLSETBLOBCACHEFUNCSANDROIDPROC)(EGLDisplay dpy, EGLSetBlobFuncANDROID set, EGLGetBlobFuncANDROID get);
++#endif
++
++#ifndef EGL_ANDROID_image_native_buffer
++#define EGL_ANDROID_image_native_buffer 1
++#define EGL_NATIVE_BUFFER_ANDROID		0x3140
++#endif
++
++#ifndef EGL_ANDROID_native_fence_sync
++#define EGL_ANDROID_native_fence_sync 1
++#define EGL_SYNC_NATIVE_FENCE_ANDROID		0x3144
++#define EGL_SYNC_NATIVE_FENCE_FD_ANDROID	0x3145
++#define EGL_SYNC_NATIVE_FENCE_SIGNALED_ANDROID	0x3146
++#define EGL_NO_NATIVE_FENCE_FD_ANDROID		-1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLint EGLAPIENTRY eglDupNativeFenceFDANDROID( EGLDisplay dpy, EGLSyncKHR);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLint (EGLAPIENTRYP PFNEGLDUPNATIVEFENCEFDANDROIDPROC)(EGLDisplay dpy, EGLSyncKHR);
++#endif
++
++#ifndef EGL_ANDROID_recordable
++#define EGL_ANDROID_recordable 1
++#define EGL_RECORDABLE_ANDROID			0x3142
++#endif
++
++#ifndef EGL_EXT_buffer_age
++#define EGL_EXT_buffer_age 1
++#define EGL_BUFFER_AGE_EXT			0x313D
++#endif
++
++#ifndef EGL_EXT_image_dma_buf_import
++#define EGL_EXT_image_dma_buf_import 1
++#define EGL_LINUX_DMA_BUF_EXT			0x3270
++#define EGL_LINUX_DRM_FOURCC_EXT		0x3271
++#define EGL_DMA_BUF_PLANE0_FD_EXT		0x3272
++#define EGL_DMA_BUF_PLANE0_OFFSET_EXT		0x3273
++#define EGL_DMA_BUF_PLANE0_PITCH_EXT		0x3274
++#define EGL_DMA_BUF_PLANE1_FD_EXT		0x3275
++#define EGL_DMA_BUF_PLANE1_OFFSET_EXT		0x3276
++#define EGL_DMA_BUF_PLANE1_PITCH_EXT		0x3277
++#define EGL_DMA_BUF_PLANE2_FD_EXT		0x3278
++#define EGL_DMA_BUF_PLANE2_OFFSET_EXT		0x3279
++#define EGL_DMA_BUF_PLANE2_PITCH_EXT		0x327A
++#define EGL_YUV_COLOR_SPACE_HINT_EXT		0x327B
++#define EGL_SAMPLE_RANGE_HINT_EXT		0x327C
++#define EGL_YUV_CHROMA_HORIZONTAL_SITING_HINT_EXT 0x327D
++#define EGL_YUV_CHROMA_VERTICAL_SITING_HINT_EXT 0x327E
++#define EGL_ITU_REC601_EXT			0x327F
++#define EGL_ITU_REC709_EXT			0x3280
++#define EGL_ITU_REC2020_EXT			0x3281
++#define EGL_YUV_FULL_RANGE_EXT			0x3282
++#define EGL_YUV_NARROW_RANGE_EXT		0x3283
++#define EGL_YUV_CHROMA_SITING_0_EXT		0x3284
++#define EGL_YUV_CHROMA_SITING_0_5_EXT		0x3285
++#endif
++
++#ifndef EGL_ARM_pixmap_multisample_discard
++#define EGL_ARM_pixmap_multisample_discard 1
++#define EGL_DISCARD_SAMPLES_ARM			0x3286
++#endif
++
++#ifndef EGL_EXT_swap_buffers_with_damage
++#define EGL_EXT_swap_buffers_with_damage 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglSwapBuffersWithDamageEXT( EGLDisplay dpy, EGLSurface surface, EGLint *rects, EGLint n_rects);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSWAPBUFFERSWITHDAMAGEEXTPROC)(EGLDisplay dpy, EGLSurface surface, EGLint *rects, EGLint n_rects);
++#endif
++
++#include <EGL/eglmesaext.h>
++
+ #ifdef __cplusplus
+ }
+ #endif
+ 
+-#endif
++#endif /* __eglext_h_ */
+Index: Graphics_SDK_5_00_00_01/include/OGLES/EGL/eglplatform.h
+===================================================================
+--- Graphics_SDK_5_00_00_01.orig/include/OGLES/EGL/eglplatform.h	2013-07-05 04:43:13.000000000 -0700
++++ Graphics_SDK_5_00_00_01/include/OGLES/EGL/eglplatform.h	2013-12-11 20:03:10.832855774 -0800
+@@ -25,6 +25,7 @@
+ */
+ 
+ /* Platform-specific types and definitions for egl.h
++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
+  *
+  * Adopters may modify khrplatform.h and this file to suit their platform.
+  * You are encouraged to submit all modifications to the Khronos group so that
+@@ -49,17 +50,24 @@
+ #define EGLAPI KHRONOS_APICALL
+ #endif
+ 
++#ifndef EGLAPIENTRY
+ #define EGLAPIENTRY  KHRONOS_APIENTRY
+-#define EGLAPIENTRYP KHRONOS_APIENTRY*
++#endif
++#define EGLAPIENTRYP EGLAPIENTRY*
+ 
+ /* The types NativeDisplayType, NativeWindowType, and NativePixmapType
+  * are aliases of window-system-dependent types, such as X Display * or
+  * Windows Device Context. They must be defined in platform-specific
+  * code below. The EGL-prefixed versions of Native*Type are the same
+  * types, renamed in EGL 1.3 so all types in the API start with "EGL".
++ *
++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
++ * provided below, since these changes affect both binary and source
++ * portability of applications using EGL running on different EGL
++ * implementations.
+  */
+ 
+-#if defined(_WIN32) && !defined(__WINSCW__) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
+ #ifndef WIN32_LEAN_AND_MEAN
+ #define WIN32_LEAN_AND_MEAN 1
+ #endif
+@@ -69,38 +77,55 @@
+ typedef HBITMAP EGLNativePixmapType;
+ typedef HWND    EGLNativeWindowType;
+ 
+-#elif defined(SUPPORT_X11)
++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
+ 
+-/* X11 (tentative)  */
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
++typedef int   EGLNativeDisplayType;
++typedef void *EGLNativeWindowType;
++typedef void *EGLNativePixmapType;
+ 
+-typedef Display *EGLNativeDisplayType;
+-typedef Pixmap   EGLNativePixmapType;
+-typedef Window   EGLNativeWindowType;
++#elif defined(WL_EGL_PLATFORM)
+ 
++typedef struct wl_display     *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
++typedef struct wl_egl_window  *EGLNativeWindowType;
+ 
+-#elif defined(__ANDROID__) || defined(ANDROID)
++#elif defined(__GBM__)
+ 
+-#include <android/native_window.h>
++typedef struct gbm_device  *EGLNativeDisplayType;
++typedef struct gbm_bo      *EGLNativePixmapType;
++typedef void               *EGLNativeWindowType;
+ 
++#elif defined(ANDROID) /* Android */
++
++struct ANativeWindow;
+ struct egl_native_pixmap_t;
+ 
+-typedef struct ANativeWindow*           EGLNativeWindowType;
+-typedef struct egl_native_pixmap_t*     EGLNativePixmapType;
+-typedef void*                           EGLNativeDisplayType;
++typedef struct ANativeWindow        *EGLNativeWindowType;
++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
++typedef void                        *EGLNativeDisplayType;
+ 
+-#else
++#elif defined(__unix__)
++
++#ifdef MESA_EGL_NO_X11_HEADERS
++
++typedef void            *EGLNativeDisplayType;
++typedef khronos_uintptr_t EGLNativePixmapType;
++typedef khronos_uintptr_t EGLNativeWindowType;
+ 
+-#if defined(_WIN64) ||  __WORDSIZE == 64
+-typedef khronos_int64_t EGLNativeDisplayType;
+ #else
+-typedef int EGLNativeDisplayType;
+-#endif
+ 
+-typedef void *EGLNativeWindowType;
+-typedef void *EGLNativePixmapType;
++/* X11 (tentative)  */
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
+ 
++typedef Display *EGLNativeDisplayType;
++typedef Pixmap   EGLNativePixmapType;
++typedef Window   EGLNativeWindowType;
++
++#endif /* MESA_EGL_NO_X11_HEADERS */
++
++#else
++#error "Platform not recognized"
+ #endif
+ 
+ /* EGL 1.2 types, renamed for consistency in EGL 1.3 */
diff --git a/recipes-graphics/libgles/libgles-omap3-5.00.00.01/0002-Update-OGLES2-EGL-includes.patch b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/0002-Update-OGLES2-EGL-includes.patch
new file mode 100644
index 0000000..061eaa4
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/0002-Update-OGLES2-EGL-includes.patch
@@ -0,0 +1,595 @@
+Index: Graphics_SDK_5_00_00_01/include/OGLES2/EGL/egl.h
+===================================================================
+--- Graphics_SDK_5_00_00_01.orig/include/OGLES2/EGL/egl.h	2013-07-05 04:43:13.000000000 -0700
++++ Graphics_SDK_5_00_00_01/include/OGLES2/EGL/egl.h	2013-12-11 20:06:47.468859201 -0800
+@@ -1,6 +1,7 @@
+ /* -*- mode: c; tab-width: 8; -*- */
+ /* vi: set sw=4 ts=8: */
+ /* Reference version of egl.h for EGL 1.4.
++ * $Revision: 9356 $ on $Date: 2009-10-21 02:52:25 -0700 (Wed, 21 Oct 2009) $
+  */
+ 
+ /*
+@@ -108,7 +109,6 @@
+ #define EGL_NATIVE_RENDERABLE		0x302D
+ #define EGL_NATIVE_VISUAL_ID		0x302E
+ #define EGL_NATIVE_VISUAL_TYPE		0x302F
+-#define EGL_PRESERVED_RESOURCES		0x3030
+ #define EGL_SAMPLES			0x3031
+ #define EGL_SAMPLE_BUFFERS		0x3032
+ #define EGL_SURFACE_TYPE		0x3033
+Index: Graphics_SDK_5_00_00_01/include/OGLES2/EGL/eglext.h
+===================================================================
+--- Graphics_SDK_5_00_00_01.orig/include/OGLES2/EGL/eglext.h	2013-07-05 04:43:13.000000000 -0700
++++ Graphics_SDK_5_00_00_01/include/OGLES2/EGL/eglext.h	2013-12-11 20:05:28.660858022 -0800
+@@ -6,7 +6,7 @@
+ #endif
+ 
+ /*
+-** Copyright (c) 2007-2009 The Khronos Group Inc.
++** Copyright (c) 2007-2013 The Khronos Group Inc.
+ **
+ ** Permission is hereby granted, free of charge, to any person obtaining a
+ ** copy of this software and/or associated documentation files (the
+@@ -34,7 +34,8 @@
+ 
+ /* Header file version number */
+ /* Current version at http://www.khronos.org/registry/egl/ */
+-#define EGL_EGLEXT_VERSION 4
++/* $Revision: 21254 $ on $Date: 2013-04-25 03:11:55 -0700 (Thu, 25 Apr 2013) $ */
++#define EGL_EGLEXT_VERSION 16
+ 
+ #ifndef EGL_KHR_config_attribs
+ #define EGL_KHR_config_attribs 1
+@@ -119,6 +120,7 @@
+ #define EGL_GL_RENDERBUFFER_KHR			0x30B9	/* eglCreateImageKHR target */
+ #endif
+ 
++#if KHRONOS_SUPPORT_INT64   /* EGLTimeKHR requires 64-bit uint support */
+ #ifndef EGL_KHR_reusable_sync
+ #define EGL_KHR_reusable_sync 1
+ 
+@@ -142,11 +144,12 @@
+ EGLAPI EGLBoolean EGLAPIENTRY eglSignalSyncKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
+ EGLAPI EGLBoolean EGLAPIENTRY eglGetSyncAttribKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
+ #endif /* EGL_EGLEXT_PROTOTYPES */
+-typedef EGLSyncKHR (EGLAPIENTRYP PFNEGLCREATESYNCKHR) (EGLDisplay dpy, EGLenum type, const EGLint *attrib_list);
+-typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCKHR) (EGLDisplay dpy, EGLSyncKHR sync);
+-typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCKHR) (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
+-typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCKHR) (EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
+-typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBKHR) (EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
++typedef EGLSyncKHR (EGLAPIENTRYP PFNEGLCREATESYNCKHRPROC) (EGLDisplay dpy, EGLenum type, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync);
++typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
++#endif
+ #endif
+ 
+ #ifndef EGL_KHR_image_base
+@@ -168,8 +171,410 @@
+ #define EGL_CONTEXT_PRIORITY_LOW_IMG		0x3103
+ #endif
+ 
++#ifndef EGL_KHR_lock_surface2
++#define EGL_KHR_lock_surface2 1
++#define EGL_BITMAP_PIXEL_SIZE_KHR		0x3110
++#endif
++
++#ifndef EGL_NV_coverage_sample
++#define EGL_NV_coverage_sample 1
++#define EGL_COVERAGE_BUFFERS_NV			0x30E0
++#define EGL_COVERAGE_SAMPLES_NV			0x30E1
++#endif
++
++#ifndef EGL_NV_depth_nonlinear
++#define EGL_NV_depth_nonlinear 1
++#define EGL_DEPTH_ENCODING_NV			0x30E2
++#define EGL_DEPTH_ENCODING_NONE_NV 0
++#define EGL_DEPTH_ENCODING_NONLINEAR_NV		0x30E3
++#endif
++
++#if KHRONOS_SUPPORT_INT64   /* EGLTimeNV requires 64-bit uint support */
++#ifndef EGL_NV_sync
++#define EGL_NV_sync 1
++#define EGL_SYNC_PRIOR_COMMANDS_COMPLETE_NV	0x30E6
++#define EGL_SYNC_STATUS_NV			0x30E7
++#define EGL_SIGNALED_NV				0x30E8
++#define EGL_UNSIGNALED_NV			0x30E9
++#define EGL_SYNC_FLUSH_COMMANDS_BIT_NV		0x0001
++#define EGL_FOREVER_NV				0xFFFFFFFFFFFFFFFFull
++#define EGL_ALREADY_SIGNALED_NV			0x30EA
++#define EGL_TIMEOUT_EXPIRED_NV			0x30EB
++#define EGL_CONDITION_SATISFIED_NV		0x30EC
++#define EGL_SYNC_TYPE_NV			0x30ED
++#define EGL_SYNC_CONDITION_NV			0x30EE
++#define EGL_SYNC_FENCE_NV			0x30EF
++#define EGL_NO_SYNC_NV				((EGLSyncNV)0)
++typedef void* EGLSyncNV;
++typedef khronos_utime_nanoseconds_t EGLTimeNV;
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSyncNV EGLAPIENTRY eglCreateFenceSyncNV (EGLDisplay dpy, EGLenum condition, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroySyncNV (EGLSyncNV sync);
++EGLAPI EGLBoolean EGLAPIENTRY eglFenceNV (EGLSyncNV sync);
++EGLAPI EGLint EGLAPIENTRY eglClientWaitSyncNV (EGLSyncNV sync, EGLint flags, EGLTimeNV timeout);
++EGLAPI EGLBoolean EGLAPIENTRY eglSignalSyncNV (EGLSyncNV sync, EGLenum mode);
++EGLAPI EGLBoolean EGLAPIENTRY eglGetSyncAttribNV (EGLSyncNV sync, EGLint attribute, EGLint *value);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLSyncNV (EGLAPIENTRYP PFNEGLCREATEFENCESYNCNVPROC) (EGLDisplay dpy, EGLenum condition, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCNVPROC) (EGLSyncNV sync);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLFENCENVPROC) (EGLSyncNV sync);
++typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCNVPROC) (EGLSyncNV sync, EGLint flags, EGLTimeNV timeout);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCNVPROC) (EGLSyncNV sync, EGLenum mode);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBNVPROC) (EGLSyncNV sync, EGLint attribute, EGLint *value);
++#endif
++#endif
++
++#if KHRONOS_SUPPORT_INT64   /* Dependent on EGL_KHR_reusable_sync which requires 64-bit uint support */
++#ifndef EGL_KHR_fence_sync
++#define EGL_KHR_fence_sync 1
++/* Reuses most tokens and entry points from EGL_KHR_reusable_sync */
++#define EGL_SYNC_PRIOR_COMMANDS_COMPLETE_KHR	0x30F0
++#define EGL_SYNC_CONDITION_KHR			0x30F8
++#define EGL_SYNC_FENCE_KHR			0x30F9
++#endif
++#endif
++
++#ifndef EGL_HI_clientpixmap
++#define EGL_HI_clientpixmap 1
++
++/* Surface Attribute */
++#define EGL_CLIENT_PIXMAP_POINTER_HI		0x8F74
++/*
++ * Structure representing a client pixmap
++ * (pixmap's data is in client-space memory).
++ */
++struct EGLClientPixmapHI
++{
++	void*		pData;
++	EGLint		iWidth;
++	EGLint		iHeight;
++	EGLint		iStride;
++};
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurfaceHI(EGLDisplay dpy, EGLConfig config, struct EGLClientPixmapHI* pixmap);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPIXMAPSURFACEHIPROC) (EGLDisplay dpy, EGLConfig config, struct EGLClientPixmapHI* pixmap);
++#endif	/* EGL_HI_clientpixmap */
++
++#ifndef EGL_HI_colorformats
++#define EGL_HI_colorformats 1
++/* Config Attribute */
++#define EGL_COLOR_FORMAT_HI			0x8F70
++/* Color Formats */
++#define EGL_COLOR_RGB_HI			0x8F71
++#define EGL_COLOR_RGBA_HI			0x8F72
++#define EGL_COLOR_ARGB_HI			0x8F73
++#endif /* EGL_HI_colorformats */
++
++#ifndef EGL_MESA_drm_image
++#define EGL_MESA_drm_image 1
++#define EGL_DRM_BUFFER_FORMAT_MESA		0x31D0	    /* CreateDRMImageMESA attribute */
++#define EGL_DRM_BUFFER_USE_MESA			0x31D1	    /* CreateDRMImageMESA attribute */
++#define EGL_DRM_BUFFER_FORMAT_ARGB32_MESA	0x31D2	    /* EGL_IMAGE_FORMAT_MESA attribute value */
++#define EGL_DRM_BUFFER_MESA			0x31D3	    /* eglCreateImageKHR target */
++#define EGL_DRM_BUFFER_STRIDE_MESA		0x31D4
++#define EGL_DRM_BUFFER_USE_SCANOUT_MESA		0x00000001  /* EGL_DRM_BUFFER_USE_MESA bits */
++#define EGL_DRM_BUFFER_USE_SHARE_MESA		0x00000002  /* EGL_DRM_BUFFER_USE_MESA bits */
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLImageKHR EGLAPIENTRY eglCreateDRMImageMESA (EGLDisplay dpy, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglExportDRMImageMESA (EGLDisplay dpy, EGLImageKHR image, EGLint *name, EGLint *handle, EGLint *stride);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLImageKHR (EGLAPIENTRYP PFNEGLCREATEDRMIMAGEMESAPROC) (EGLDisplay dpy, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLEXPORTDRMIMAGEMESAPROC) (EGLDisplay dpy, EGLImageKHR image, EGLint *name, EGLint *handle, EGLint *stride);
++#endif
++
++#ifndef EGL_NV_post_sub_buffer
++#define EGL_NV_post_sub_buffer 1
++#define EGL_POST_SUB_BUFFER_SUPPORTED_NV	0x30BE
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglPostSubBufferNV (EGLDisplay dpy, EGLSurface surface, EGLint x, EGLint y, EGLint width, EGLint height);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLPOSTSUBBUFFERNVPROC) (EGLDisplay dpy, EGLSurface surface, EGLint x, EGLint y, EGLint width, EGLint height);
++#endif
++
++#ifndef EGL_ANGLE_query_surface_pointer
++#define EGL_ANGLE_query_surface_pointer 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean eglQuerySurfacePointerANGLE(EGLDisplay dpy, EGLSurface surface, EGLint attribute, void **value);
++#endif
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSURFACEPOINTERANGLEPROC) (EGLDisplay dpy, EGLSurface surface, EGLint attribute, void **value);
++#endif
++
++#ifndef EGL_ANGLE_surface_d3d_texture_2d_share_handle
++#define EGL_ANGLE_surface_d3d_texture_2d_share_handle 1
++#define EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE	0x3200
++#endif
++
++#ifndef EGL_NV_coverage_sample_resolve
++#define EGL_NV_coverage_sample_resolve 1
++#define EGL_COVERAGE_SAMPLE_RESOLVE_NV		0x3131
++#define EGL_COVERAGE_SAMPLE_RESOLVE_DEFAULT_NV	0x3132
++#define EGL_COVERAGE_SAMPLE_RESOLVE_NONE_NV	0x3133
++#endif
++
++#if KHRONOS_SUPPORT_INT64   /* EGLuint64NV requires 64-bit uint support */
++#ifndef EGL_NV_system_time
++#define EGL_NV_system_time 1
++typedef khronos_utime_nanoseconds_t EGLuint64NV;
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLuint64NV EGLAPIENTRY eglGetSystemTimeFrequencyNV(void);
++EGLAPI EGLuint64NV EGLAPIENTRY eglGetSystemTimeNV(void);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLuint64NV (EGLAPIENTRYP PFNEGLGETSYSTEMTIMEFREQUENCYNVPROC) (void);
++typedef EGLuint64NV (EGLAPIENTRYP PFNEGLGETSYSTEMTIMENVPROC) (void);
++#endif
++#endif
++
++#if KHRONOS_SUPPORT_INT64 /* EGLuint64KHR requires 64-bit uint support */
++#ifndef EGL_KHR_stream
++#define EGL_KHR_stream 1
++typedef void* EGLStreamKHR;
++typedef khronos_uint64_t EGLuint64KHR;
++#define EGL_NO_STREAM_KHR			((EGLStreamKHR)0)
++#define EGL_CONSUMER_LATENCY_USEC_KHR		0x3210
++#define EGL_PRODUCER_FRAME_KHR			0x3212
++#define EGL_CONSUMER_FRAME_KHR			0x3213
++#define EGL_STREAM_STATE_KHR			0x3214
++#define EGL_STREAM_STATE_CREATED_KHR		0x3215
++#define EGL_STREAM_STATE_CONNECTING_KHR		0x3216
++#define EGL_STREAM_STATE_EMPTY_KHR		0x3217
++#define EGL_STREAM_STATE_NEW_FRAME_AVAILABLE_KHR    0x3218
++#define EGL_STREAM_STATE_OLD_FRAME_AVAILABLE_KHR    0x3219
++#define EGL_STREAM_STATE_DISCONNECTED_KHR	0x321A
++#define EGL_BAD_STREAM_KHR			0x321B
++#define EGL_BAD_STATE_KHR			0x321C
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLStreamKHR EGLAPIENTRY eglCreateStreamKHR(EGLDisplay dpy, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroyStreamKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamAttribKHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint value);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamKHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint *value);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamu64KHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLuint64KHR *value);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLStreamKHR (EGLAPIENTRYP PFNEGLCREATESTREAMKHRPROC)(EGLDisplay dpy, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSTREAMKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMATTRIBKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint value);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint *value);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMU64KHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLuint64KHR *value);
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_consumer_gltexture
++#define EGL_KHR_stream_consumer_gltexture 1
++#define EGL_CONSUMER_ACQUIRE_TIMEOUT_USEC_KHR	0x321E
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerGLTextureExternalKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerAcquireKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerReleaseKHR(EGLDisplay dpy, EGLStreamKHR stream);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERGLTEXTUREEXTERNALKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERACQUIREKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERRELEASEKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_producer_eglsurface
++#define EGL_KHR_stream_producer_eglsurface 1
++#define EGL_STREAM_BIT_KHR			0x0800
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSurface EGLAPIENTRY eglCreateStreamProducerSurfaceKHR(EGLDisplay dpy, EGLConfig config, EGLStreamKHR stream, const EGLint *attrib_list);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATESTREAMPRODUCERSURFACEKHRPROC)(EGLDisplay dpy, EGLConfig config, EGLStreamKHR stream, const EGLint *attrib_list);
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_producer_aldatalocator
++#define EGL_KHR_stream_producer_aldatalocator 1
++#endif
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_fifo
++#define EGL_KHR_stream_fifo 1
++/* reuse EGLTimeKHR */
++#define EGL_STREAM_FIFO_LENGTH_KHR		0x31FC
++#define EGL_STREAM_TIME_NOW_KHR			0x31FD
++#define EGL_STREAM_TIME_CONSUMER_KHR		0x31FE
++#define EGL_STREAM_TIME_PRODUCER_KHR		0x31FF
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamTimeKHR(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLTimeKHR *value);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMTIMEKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLTimeKHR *value);
++#endif
++#endif
++
++#ifndef EGL_EXT_create_context_robustness
++#define EGL_EXT_create_context_robustness 1
++#define EGL_CONTEXT_OPENGL_ROBUST_ACCESS_EXT	0x30BF
++#define EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_EXT 0x3138
++#define EGL_NO_RESET_NOTIFICATION_EXT		0x31BE
++#define EGL_LOSE_CONTEXT_ON_RESET_EXT		0x31BF
++#endif
++
++#ifndef EGL_ANGLE_d3d_share_handle_client_buffer
++#define EGL_ANGLE_d3d_share_handle_client_buffer 1
++/* reuse EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE */
++#endif
++
++#ifndef EGL_KHR_create_context
++#define EGL_KHR_create_context 1
++#define EGL_CONTEXT_MAJOR_VERSION_KHR			    EGL_CONTEXT_CLIENT_VERSION
++#define EGL_CONTEXT_MINOR_VERSION_KHR			    0x30FB
++#define EGL_CONTEXT_FLAGS_KHR				    0x30FC
++#define EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR		    0x30FD
++#define EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_KHR  0x31BD
++#define EGL_NO_RESET_NOTIFICATION_KHR			    0x31BE
++#define EGL_LOSE_CONTEXT_ON_RESET_KHR			    0x31BF
++#define EGL_CONTEXT_OPENGL_DEBUG_BIT_KHR		    0x00000001
++#define EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE_BIT_KHR	    0x00000002
++#define EGL_CONTEXT_OPENGL_ROBUST_ACCESS_BIT_KHR	    0x00000004
++#define EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT_KHR		    0x00000001
++#define EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT_KHR    0x00000002
++#define EGL_OPENGL_ES3_BIT_KHR				    0x00000040
++#endif
++
++#ifndef EGL_KHR_surfaceless_context
++#define EGL_KHR_surfaceless_context 1
++/* No tokens/entry points, just relaxes an error condition */
++#endif
++
++#ifdef EGL_KHR_stream /* Requires KHR_stream extension */
++#ifndef EGL_KHR_stream_cross_process_fd
++#define EGL_KHR_stream_cross_process_fd 1
++typedef int EGLNativeFileDescriptorKHR;
++#define EGL_NO_FILE_DESCRIPTOR_KHR		((EGLNativeFileDescriptorKHR)(-1))
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLNativeFileDescriptorKHR EGLAPIENTRY eglGetStreamFileDescriptorKHR(EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLStreamKHR EGLAPIENTRY eglCreateStreamFromFileDescriptorKHR(EGLDisplay dpy, EGLNativeFileDescriptorKHR file_descriptor);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLNativeFileDescriptorKHR (EGLAPIENTRYP PFNEGLGETSTREAMFILEDESCRIPTORKHRPROC)(EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLStreamKHR (EGLAPIENTRYP PFNEGLCREATESTREAMFROMFILEDESCRIPTORKHRPROC)(EGLDisplay dpy, EGLNativeFileDescriptorKHR file_descriptor);
++#endif
++#endif
++
++#ifndef EGL_EXT_multiview_window
++#define EGL_EXT_multiview_window 1
++#define EGL_MULTIVIEW_VIEW_COUNT_EXT		0x3134
++#endif
++
++#ifndef EGL_KHR_wait_sync
++#define EGL_KHR_wait_sync 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLint EGLAPIENTRY eglWaitSyncKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLint flags);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLint (EGLAPIENTRYP PFNEGLWAITSYNCKHRPROC)(EGLDisplay dpy, EGLSyncKHR sync, EGLint flags);
++#endif
++
++#ifndef EGL_NV_post_convert_rounding
++#define EGL_NV_post_convert_rounding 1
++/* No tokens or entry points, just relaxes behavior of SwapBuffers */
++#endif
++
++#ifndef EGL_NV_native_query
++#define EGL_NV_native_query 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativeDisplayNV( EGLDisplay dpy, EGLNativeDisplayType* display_id);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativeWindowNV( EGLDisplay dpy, EGLSurface surf, EGLNativeWindowType* window);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativePixmapNV( EGLDisplay dpy, EGLSurface surf, EGLNativePixmapType* pixmap);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEDISPLAYNVPROC)(EGLDisplay dpy, EGLNativeDisplayType *display_id);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEWINDOWNVPROC)(EGLDisplay dpy, EGLSurface surf, EGLNativeWindowType *window);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEPIXMAPNVPROC)(EGLDisplay dpy, EGLSurface surf, EGLNativePixmapType *pixmap);
++#endif
++
++#ifndef EGL_NV_3dvision_surface
++#define EGL_NV_3dvision_surface 1
++#define EGL_AUTO_STEREO_NV			0x3136
++#endif
++
++#ifndef EGL_ANDROID_framebuffer_target
++#define EGL_ANDROID_framebuffer_target 1
++#define EGL_FRAMEBUFFER_TARGET_ANDROID		0x3147
++#endif
++
++#ifndef EGL_ANDROID_blob_cache
++#define EGL_ANDROID_blob_cache 1
++typedef khronos_ssize_t EGLsizeiANDROID;
++typedef void (*EGLSetBlobFuncANDROID) (const void *key, EGLsizeiANDROID keySize, const void *value, EGLsizeiANDROID valueSize);
++typedef EGLsizeiANDROID (*EGLGetBlobFuncANDROID) (const void *key, EGLsizeiANDROID keySize, void *value, EGLsizeiANDROID valueSize);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI void EGLAPIENTRY eglSetBlobCacheFuncsANDROID(EGLDisplay dpy, EGLSetBlobFuncANDROID set, EGLGetBlobFuncANDROID get);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef void (EGLAPIENTRYP PFNEGLSETBLOBCACHEFUNCSANDROIDPROC)(EGLDisplay dpy, EGLSetBlobFuncANDROID set, EGLGetBlobFuncANDROID get);
++#endif
++
++#ifndef EGL_ANDROID_image_native_buffer
++#define EGL_ANDROID_image_native_buffer 1
++#define EGL_NATIVE_BUFFER_ANDROID		0x3140
++#endif
++
++#ifndef EGL_ANDROID_native_fence_sync
++#define EGL_ANDROID_native_fence_sync 1
++#define EGL_SYNC_NATIVE_FENCE_ANDROID		0x3144
++#define EGL_SYNC_NATIVE_FENCE_FD_ANDROID	0x3145
++#define EGL_SYNC_NATIVE_FENCE_SIGNALED_ANDROID	0x3146
++#define EGL_NO_NATIVE_FENCE_FD_ANDROID		-1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLint EGLAPIENTRY eglDupNativeFenceFDANDROID( EGLDisplay dpy, EGLSyncKHR);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLint (EGLAPIENTRYP PFNEGLDUPNATIVEFENCEFDANDROIDPROC)(EGLDisplay dpy, EGLSyncKHR);
++#endif
++
++#ifndef EGL_ANDROID_recordable
++#define EGL_ANDROID_recordable 1
++#define EGL_RECORDABLE_ANDROID			0x3142
++#endif
++
++#ifndef EGL_EXT_buffer_age
++#define EGL_EXT_buffer_age 1
++#define EGL_BUFFER_AGE_EXT			0x313D
++#endif
++
++#ifndef EGL_EXT_image_dma_buf_import
++#define EGL_EXT_image_dma_buf_import 1
++#define EGL_LINUX_DMA_BUF_EXT			0x3270
++#define EGL_LINUX_DRM_FOURCC_EXT		0x3271
++#define EGL_DMA_BUF_PLANE0_FD_EXT		0x3272
++#define EGL_DMA_BUF_PLANE0_OFFSET_EXT		0x3273
++#define EGL_DMA_BUF_PLANE0_PITCH_EXT		0x3274
++#define EGL_DMA_BUF_PLANE1_FD_EXT		0x3275
++#define EGL_DMA_BUF_PLANE1_OFFSET_EXT		0x3276
++#define EGL_DMA_BUF_PLANE1_PITCH_EXT		0x3277
++#define EGL_DMA_BUF_PLANE2_FD_EXT		0x3278
++#define EGL_DMA_BUF_PLANE2_OFFSET_EXT		0x3279
++#define EGL_DMA_BUF_PLANE2_PITCH_EXT		0x327A
++#define EGL_YUV_COLOR_SPACE_HINT_EXT		0x327B
++#define EGL_SAMPLE_RANGE_HINT_EXT		0x327C
++#define EGL_YUV_CHROMA_HORIZONTAL_SITING_HINT_EXT 0x327D
++#define EGL_YUV_CHROMA_VERTICAL_SITING_HINT_EXT 0x327E
++#define EGL_ITU_REC601_EXT			0x327F
++#define EGL_ITU_REC709_EXT			0x3280
++#define EGL_ITU_REC2020_EXT			0x3281
++#define EGL_YUV_FULL_RANGE_EXT			0x3282
++#define EGL_YUV_NARROW_RANGE_EXT		0x3283
++#define EGL_YUV_CHROMA_SITING_0_EXT		0x3284
++#define EGL_YUV_CHROMA_SITING_0_5_EXT		0x3285
++#endif
++
++#ifndef EGL_ARM_pixmap_multisample_discard
++#define EGL_ARM_pixmap_multisample_discard 1
++#define EGL_DISCARD_SAMPLES_ARM			0x3286
++#endif
++
++#ifndef EGL_EXT_swap_buffers_with_damage
++#define EGL_EXT_swap_buffers_with_damage 1
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglSwapBuffersWithDamageEXT( EGLDisplay dpy, EGLSurface surface, EGLint *rects, EGLint n_rects);
++#endif /* EGL_EGLEXT_PROTOTYPES */
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSWAPBUFFERSWITHDAMAGEEXTPROC)(EGLDisplay dpy, EGLSurface surface, EGLint *rects, EGLint n_rects);
++#endif
++
++#include <EGL/eglmesaext.h>
++
+ #ifdef __cplusplus
+ }
+ #endif
+ 
+-#endif
++#endif /* __eglext_h_ */
+Index: Graphics_SDK_5_00_00_01/include/OGLES2/EGL/eglplatform.h
+===================================================================
+--- Graphics_SDK_5_00_00_01.orig/include/OGLES2/EGL/eglplatform.h	2013-07-05 04:43:13.000000000 -0700
++++ Graphics_SDK_5_00_00_01/include/OGLES2/EGL/eglplatform.h	2013-12-11 20:07:59.784861027 -0800
+@@ -25,6 +25,7 @@
+ */
+ 
+ /* Platform-specific types and definitions for egl.h
++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
+  *
+  * Adopters may modify khrplatform.h and this file to suit their platform.
+  * You are encouraged to submit all modifications to the Khronos group so that
+@@ -49,17 +50,24 @@
+ #define EGLAPI KHRONOS_APICALL
+ #endif
+ 
++#ifndef EGLAPIENTRY
+ #define EGLAPIENTRY  KHRONOS_APIENTRY
+-#define EGLAPIENTRYP KHRONOS_APIENTRY*
++#endif
++#define EGLAPIENTRYP EGLAPIENTRY*
+ 
+ /* The types NativeDisplayType, NativeWindowType, and NativePixmapType
+  * are aliases of window-system-dependent types, such as X Display * or
+  * Windows Device Context. They must be defined in platform-specific
+  * code below. The EGL-prefixed versions of Native*Type are the same
+  * types, renamed in EGL 1.3 so all types in the API start with "EGL".
++ *
++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
++ * provided below, since these changes affect both binary and source
++ * portability of applications using EGL running on different EGL
++ * implementations.
+  */
+ 
+-#if defined(_WIN32) && !defined(__WINSCW__) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
+ #ifndef WIN32_LEAN_AND_MEAN
+ #define WIN32_LEAN_AND_MEAN 1
+ #endif
+@@ -69,38 +77,55 @@
+ typedef HBITMAP EGLNativePixmapType;
+ typedef HWND    EGLNativeWindowType;
+ 
+-#elif defined(SUPPORT_X11)
++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
+ 
+-/* X11 (tentative)  */
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
++typedef int   EGLNativeDisplayType;
++typedef void *EGLNativeWindowType;
++typedef void *EGLNativePixmapType;
+ 
+-typedef Display *EGLNativeDisplayType;
+-typedef Pixmap   EGLNativePixmapType;
+-typedef Window   EGLNativeWindowType;
++#elif defined(WL_EGL_PLATFORM)
+ 
++typedef struct wl_display     *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
++typedef struct wl_egl_window  *EGLNativeWindowType;
+ 
+-#elif defined(__ANDROID__) || defined(ANDROID)
++#elif defined(__GBM__)
+ 
+-#include <android/native_window.h>
++typedef struct gbm_device  *EGLNativeDisplayType;
++typedef struct gbm_bo      *EGLNativePixmapType;
++typedef void               *EGLNativeWindowType;
+ 
++#elif defined(ANDROID) /* Android */
++
++struct ANativeWindow;
+ struct egl_native_pixmap_t;
+ 
+-typedef struct ANativeWindow*           EGLNativeWindowType;
+-typedef struct egl_native_pixmap_t*     EGLNativePixmapType;
+-typedef void*                           EGLNativeDisplayType;
++typedef struct ANativeWindow        *EGLNativeWindowType;
++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
++typedef void                        *EGLNativeDisplayType;
+ 
+-#else
++#elif defined(__unix__)
++
++#ifdef MESA_EGL_NO_X11_HEADERS
++
++typedef void            *EGLNativeDisplayType;
++typedef khronos_uintptr_t EGLNativePixmapType;
++typedef khronos_uintptr_t EGLNativeWindowType;
+ 
+-#if defined(_WIN64) ||  __WORDSIZE == 64
+-typedef khronos_int64_t EGLNativeDisplayType;
+ #else
+-typedef int EGLNativeDisplayType;
+-#endif
+ 
+-typedef void *EGLNativeWindowType;
+-typedef void *EGLNativePixmapType;
++/* X11 (tentative)  */
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
+ 
++typedef Display *EGLNativeDisplayType;
++typedef Pixmap   EGLNativePixmapType;
++typedef Window   EGLNativeWindowType;
++
++#endif /* MESA_EGL_NO_X11_HEADERS */
++
++#else
++#error "Platform not recognized"
+ #endif
+ 
+ /* EGL 1.2 types, renamed for consistency in EGL 1.3 */
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
index e48ec63..9d224d1 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
@@ -40,6 +40,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports
            file://cputype \
            file://rc.pvr \
            file://99-bufferclass.rules  \
+           file://0001-Update-OGLES-EGL-includes.patch \
+           file://0002-Update-OGLES2-EGL-includes.patch \
 "
 
 SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
-- 
1.7.9.5


