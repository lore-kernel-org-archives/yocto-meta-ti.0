Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC6CC47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 16:40:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.20286.1706546452143903949
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 08:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kTnmllwK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40TGem4X038747;
	Mon, 29 Jan 2024 10:40:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706546448;
	bh=AvZ/rJJxcX3YnQwbDLK/yhozg4p/MhRMtTBVUmu6AKo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kTnmllwKclFUOVzlg+NqNNj7Y7hpvizQMeV5ySBfjye50c4GgvwFOA6bsUwV8CtkB
	 fxIAi7l6eFTPHsyF5P5gQRFG3Jazb0FvEe2O0IDLLA7NITzT/KHEaNR8qlq46tJ1YI
	 vlJDgXNaQpeXhznKz+J2xUiV5uQyy4b/aBPFj3tA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40TGemXr104097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 10:40:48 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jan 2024 10:40:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Jan 2024 10:40:48 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40TGemJm057098;
	Mon, 29 Jan 2024 10:40:48 -0600
Message-ID: <8047dee6-f8e7-49ad-a842-91c91890b711@ti.com>
Date: Mon, 29 Jan 2024 10:40:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 1/4] gstreamer1.0-plugins-bad: Add
 patches to support DRM allocator
Content-Language: en-US
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20240129115342.9321-1-sinthu.raja@ti.com>
 <20240129115342.9321-2-sinthu.raja@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240129115342.9321-2-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 16:40:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17431

On 1/29/24 5:53 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Add patches to support the DRM based allocator support for the
> gst-plugins-bad which is needed for the OMAP DRM
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   ...mallocator-Add-DRM-allocator-support.patch | 367 ++++++++++++++++++
>   ...drm-and-tidss-in-the-list-of-drivers.patch | 160 ++++++++
>   .../gstreamer1.0-plugins-bad_1.20.%.bbappend  |  15 +
>   3 files changed, 542 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
> new file mode 100644
> index 00000000..35f49e9f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
> @@ -0,0 +1,367 @@
> +From 481d4192c3a64d02cc5cb11c20b611dd3f8d4f0a Mon Sep 17 00:00:00 2001
> +From: Sinthu Raja <sinthu.raja@ti.com>
> +Date: Thu, 7 Sep 2023 16:41:56 +0530
> +Subject: [PATCH 1/2] gstdrmallocator: Add DRM allocator support
> +
> +Add DRM based allocator support.
> +
> +The following changes are included :
> +1. Use DRM dumb buffers and associated APIs for
> +   dmabuf allocation.
> +2. Have DRM device fd a member of allocator object
> +3. Allocate GstMemory objects with mem_type as 'dmabuf'
> +4. Add meson build file
> +
> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> +---
> + gst-libs/gst/drm/gstdrmallocator.c | 206 +++++++++++++++++++++++++++++
> + gst-libs/gst/drm/gstdrmallocator.h |  77 +++++++++++
> + gst-libs/gst/drm/meson.build       |  26 ++++
> + gst-libs/gst/meson.build           |   1 +
> + 4 files changed, 310 insertions(+)
> + create mode 100644 gst-libs/gst/drm/gstdrmallocator.c
> + create mode 100644 gst-libs/gst/drm/gstdrmallocator.h
> + create mode 100644 gst-libs/gst/drm/meson.build
> +
> +diff --git a/gst-libs/gst/drm/gstdrmallocator.c b/gst-libs/gst/drm/gstdrmallocator.c
> +new file mode 100644
> +index 0000000..b557ad2
> +--- /dev/null
> ++++ b/gst-libs/gst/drm/gstdrmallocator.c
> +@@ -0,0 +1,206 @@
> ++/*
> ++ * GStreamer
> ++ *
> ++ * Copyright (C) 2012 Texas Instruments
> ++ *
> ++ * Authors:
> ++ *  Pooja Prajod <poojaprajod@ti.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Lesser General Public
> ++ * License as published by the Free Software Foundation
> ++ * version 2.1 of the License.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> ++ * Lesser General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General Public
> ++ * License along with this library; if not, write to the Free Software
> ++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
> ++ */
> ++
> ++/**
> ++ * SECTION:GstDRMAllocator
> ++ * @short_description: GStreamer DRM allocator support
> ++ *
> ++ * Since: 1.6.3
> ++ */
> ++
> ++
> ++#include "gstdrmallocator.h"
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <errno.h>
> ++#include <unistd.h>
> ++#include <sys/mman.h>
> ++#include <sys/types.h>
> ++
> ++#define INVALID_DRM_FD (-1)
> ++
> ++GST_DEBUG_CATEGORY (drmallocator_debug);
> ++#define GST_CAT_DEFAULT drmallocator_debug
> ++
> ++#define gst_drm_allocator_parent_class parent_class
> ++G_DEFINE_TYPE (GstDRMAllocator, gst_drm_allocator, GST_TYPE_FD_ALLOCATOR);
> ++
> ++static GstMemory *
> ++gst_drm_allocator_alloc (GstAllocator * allocator, gsize size,
> ++    GstAllocationParams * params)
> ++{
> ++  GstDRMAllocator *self = GST_DRM_ALLOCATOR (allocator);
> ++  int fd = -1;
> ++  int DrmDeviceFD = self->DrmDeviceFD;
> ++  GstMemory *mem;
> ++  /* Variable for DRM Dumb Buffers */
> ++
> ++  struct drm_mode_create_dumb creq;
> ++  struct drm_mode_destroy_dumb dreq;
> ++  int ret ;
> ++
> ++  GST_LOG_OBJECT (self, "DRM Memory alloc");
> ++
> ++  memset(&creq, 0, sizeof(struct drm_mode_create_dumb));
> ++  /*
> ++   We have only total size as argument to _allocator_alloc.
> ++   Since the DDR storage is linear, it is as good as saying
> ++   the buffer is of width = size and height = 1
> ++  */
> ++  creq.width = size;
> ++  creq.height = 1;

Using DRM's dumb-buffers to get DMA-BUFs was always a hack. Setting
width and height like this should be your hint this API was not being
used as intended.

Way back there was not many options for this, many used ION which was
Android specific, we also had CMEM, but neither were upstream. Now we
have an upstream solution with "DMA-BUF Heaps"[0]. Other GST users have
switched to it[1], we should also.

Andrew

[0] https://source.android.com/docs/core/architecture/kernel/dma-buf-heaps
[1] https://github.com/Freescale/gstreamer-imx/blob/master/gst-libs/gst/imx/common/gstimxdmaheapallocator.c

> ++  creq.bpp = 8;
> ++
> ++  /* Create a DRM dumb buffer */
> ++  ret = drmIoctl (DrmDeviceFD, DRM_IOCTL_MODE_CREATE_DUMB, &creq);
> ++  if (ret < 0) {
> ++    GST_ERROR_OBJECT (self, "Create DRM dumb buffer failed");
> ++    return NULL;
> ++  }
> ++  /* Get a dmabuf fd from the dumb buffer handle */
> ++  drmPrimeHandleToFD (DrmDeviceFD, creq.handle, DRM_CLOEXEC | O_RDWR, &fd);
> ++
> ++  if (fd < 0) {
> ++    GST_ERROR_OBJECT (self, "Invalid fd returned: %d", fd);
> ++    goto fail;
> ++  }
> ++
> ++  /* Get a dmabuf gstmemory with the fd */
> ++  mem = gst_fd_allocator_alloc (allocator, fd, size, 0);
> ++
> ++  if (G_UNLIKELY (!mem)) {
> ++    GST_ERROR_OBJECT (self, "GstDmaBufMemory allocation failed");
> ++    close (fd);
> ++    goto fail;
> ++  }
> ++
> ++  return mem;
> ++
> ++  fail:
> ++    memset(&dreq, 0, sizeof(struct drm_mode_destroy_dumb));
> ++    dreq.handle = creq.handle;
> ++    drmIoctl (DrmDeviceFD, DRM_IOCTL_MODE_DESTROY_DUMB, &dreq);
> ++    return NULL;
> ++}
> ++
> ++static void
> ++gst_drm_allocator_free (GstAllocator * allocator, GstMemory * mem)
> ++{
> ++  GstDRMAllocator *self = GST_DRM_ALLOCATOR (allocator);
> ++  uint32_t handle = 0;
> ++  int DrmDeviceFD = self->DrmDeviceFD;
> ++  int fd = -1;
> ++
> ++  GST_LOG_OBJECT (self, "DRM Memory free");
> ++
> ++  g_return_if_fail (GST_IS_ALLOCATOR (allocator));
> ++  g_return_if_fail (mem != NULL);
> ++  g_return_if_fail (gst_is_drm_memory (mem));
> ++
> ++  fd = gst_fd_memory_get_fd (mem);
> ++  drmPrimeFDToHandle(DrmDeviceFD, fd, &handle);
> ++
> ++  /* Incase there are some mapped memory, we unmap and ready it to be cleaned*/
> ++  GST_ALLOCATOR_CLASS (parent_class)->free (allocator, mem);
> ++
> ++  if (handle) {
> ++    struct drm_mode_destroy_dumb dreq;
> ++    memset(&dreq, 0, sizeof(struct drm_mode_destroy_dumb));
> ++    dreq.handle = handle;
> ++    drmIoctl (DrmDeviceFD, DRM_IOCTL_MODE_DESTROY_DUMB, &dreq);
> ++  }
> ++
> ++  close (fd);
> ++}
> ++
> ++static void
> ++gst_drm_allocator_finalize (GObject * obj)
> ++{
> ++  GstDRMAllocator *self = GST_DRM_ALLOCATOR (obj);
> ++  GST_LOG_OBJECT (obj, "DRM Allocator finalize");
> ++
> ++  close (self->DrmDeviceFD);
> ++  self->DrmDeviceFD = INVALID_DRM_FD;
> ++
> ++  G_OBJECT_CLASS (parent_class)->finalize (obj);
> ++}
> ++
> ++static void
> ++gst_drm_allocator_class_init (GstDRMAllocatorClass * klass)
> ++{
> ++  GstAllocatorClass *drm_alloc = (GstAllocatorClass *) klass;
> ++
> ++  drm_alloc->alloc = GST_DEBUG_FUNCPTR (gst_drm_allocator_alloc);
> ++  drm_alloc->free = GST_DEBUG_FUNCPTR (gst_drm_allocator_free);
> ++  GST_DEBUG_CATEGORY_INIT (drmallocator_debug, "drmallocator", 0,
> ++    "GstDRMAllocator debug");
> ++
> ++}
> ++
> ++static void
> ++gst_drm_allocator_init (GstDRMAllocator * self)
> ++{
> ++  GstAllocator *alloc = GST_ALLOCATOR_CAST (self);
> ++  GObjectClass *object_class = G_OBJECT_CLASS (GST_DRM_ALLOCATOR_GET_CLASS(self));
> ++
> ++  if (self->DrmDeviceFD <= 0) {
> ++    self->DrmDeviceFD = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
> ++    if (self->DrmDeviceFD < 0) {
> ++      GST_ERROR_OBJECT (self, "Failed to open DRM device");
> ++    } else {
> ++      drmDropMaster (self->DrmDeviceFD);
> ++    }
> ++  }
> ++
> ++  alloc->mem_type = GST_ALLOCATOR_DMABUF;
> ++
> ++  object_class->finalize = gst_drm_allocator_finalize;
> ++
> ++  GST_OBJECT_FLAG_UNSET (self, GST_ALLOCATOR_FLAG_CUSTOM_ALLOC);
> ++}
> ++
> ++void
> ++gst_drm_allocator_register (void)
> ++{
> ++  gst_allocator_register (GST_ALLOCATOR_DRM,
> ++      g_object_new (GST_TYPE_DRM_ALLOCATOR, NULL));
> ++}
> ++
> ++GstAllocator *
> ++gst_drm_allocator_get (void)
> ++{
> ++  GstAllocator *alloc;
> ++  alloc = gst_allocator_find (GST_ALLOCATOR_DRM);
> ++  if (!alloc) {
> ++    gst_drm_allocator_register();
> ++    alloc = gst_allocator_find (GST_ALLOCATOR_DRM);
> ++  }
> ++  return alloc;
> ++}
> ++
> ++gboolean
> ++gst_is_drm_memory (GstMemory * mem)
> ++{
> ++  return gst_memory_is_type (mem, GST_ALLOCATOR_DMABUF);
> ++}
> +diff --git a/gst-libs/gst/drm/gstdrmallocator.h b/gst-libs/gst/drm/gstdrmallocator.h
> +new file mode 100644
> +index 0000000..3199b92
> +--- /dev/null
> ++++ b/gst-libs/gst/drm/gstdrmallocator.h
> +@@ -0,0 +1,77 @@
> ++/*
> ++ * GStreamer
> ++ *
> ++ * Copyright (C) 2012 Texas Instruments
> ++ *
> ++ * Authors:
> ++ *  Pooja Prajod <poojaprajod@ti.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Lesser General Public
> ++ * License as published by the Free Software Foundation
> ++ * version 2.1 of the License.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> ++ * Lesser General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General Public
> ++ * License along with this library; if not, write to the Free Software
> ++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
> ++ */
> ++
> ++/**
> ++ * SECTION:GstDRMAllocator
> ++ * @short_description: GStreamer DRM allocator support
> ++ *
> ++ * Since: 1.6.3
> ++ */
> ++
> ++#ifndef __GSTDRMALLOCATOR_H__
> ++#define __GSTDRMALLOCATOR_H__
> ++
> ++#include <gst/gst.h>
> ++#include <gst/video/video.h>
> ++#include <gst/allocators/allocators.h>
> ++#include <stdint.h>
> ++
> ++#include <xf86drm.h>
> ++#include <xf86drmMode.h>
> ++#include <fcntl.h>
> ++
> ++G_BEGIN_DECLS
> ++
> ++#define GST_TYPE_DRM_ALLOCATOR                  (gst_drm_allocator_get_type ())
> ++#define GST_DRM_ALLOCATOR(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_DRM_ALLOCATOR, GstDRMAllocator))
> ++#define GST_IS_DRM_ALLOCATOR(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_DRM_ALLOCATOR))
> ++#define GST_DRM_ALLOCATOR_CLASS(klass)          (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_DRM_ALLOCATOR, GstDRMAllocatorClass))
> ++#define GST_IS_DRM_ALLOCATOR_CLASS(klass)       (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_DRM_ALLOCATOR))
> ++#define GST_DRM_ALLOCATOR_GET_CLASS(obj)        (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_DRM_ALLOCATOR, GstDRMAllocatorClass))
> ++
> ++#define GST_ALLOCATOR_DRM "DRM"
> ++
> ++typedef struct _GstDRMAllocator GstDRMAllocator;
> ++typedef struct _GstDRMAllocatorClass GstDRMAllocatorClass;
> ++
> ++struct _GstDRMAllocator
> ++{
> ++  GstFdAllocator parent;
> ++  int DrmDeviceFD;
> ++};
> ++
> ++struct _GstDRMAllocatorClass
> ++{
> ++  GstFdAllocatorClass parent_class;
> ++};
> ++
> ++GST_EXPORT void gst_drm_allocator_register (void);
> ++GST_EXPORT GstAllocator * gst_drm_allocator_get (void);
> ++
> ++GST_EXPORT gboolean gst_is_drm_memory (GstMemory * mem);
> ++
> ++GST_EXPORT GType gst_drm_allocator_get_type (void);
> ++
> ++G_END_DECLS
> ++
> ++#endif /* __GSTDRMALLOCATOR_H__ */
> +diff --git a/gst-libs/gst/drm/meson.build b/gst-libs/gst/drm/meson.build
> +new file mode 100644
> +index 0000000..8b51ba6
> +--- /dev/null
> ++++ b/gst-libs/gst/drm/meson.build
> +@@ -0,0 +1,26 @@
> ++gstdrm_sources = [
> ++  'gstdrmallocator.c',
> ++]
> ++gstdrm_headers = [
> ++  'gstdrmallocator.h',
> ++]
> ++install_headers(gstdrm_headers, subdir : 'gstreamer-1.0/gst/drm')
> ++
> ++libdrm_dep = dependency('libdrm', version: '>= 2.4.55')
> ++if libdrm_dep.found()
> ++  gstdrm = library('gstdrm-' + api_version,
> ++    gstdrm_sources,
> ++    c_args : gst_plugins_bad_args + ['-DGST_USE_UNSTABLE_API'],
> ++    include_directories : [configinc, libsinc],
> ++    version : libversion,
> ++    soversion : soversion,
> ++    darwin_versions : osxversion,
> ++    install : true,
> ++    dependencies : [gstbase_dep, gstallocators_dep, libdrm_dep],
> ++  )
> ++
> ++  gstdrm_dep = declare_dependency(link_with : gstdrm,
> ++    include_directories : [libsinc],
> ++    dependencies : [gstbase_dep, gstallocators_dep, libdrm_dep])
> ++endif
> ++
> +diff --git a/gst-libs/gst/meson.build b/gst-libs/gst/meson.build
> +index 77dadcf..b47cf2d 100644
> +--- a/gst-libs/gst/meson.build
> ++++ b/gst-libs/gst/meson.build
> +@@ -4,6 +4,7 @@ subdir('adaptivedemux')
> + subdir('audio')
> + subdir('basecamerabinsrc')
> + subdir('codecparsers')
> ++subdir('drm')
> + subdir('codecs')
> + subdir('d3d11')
> + subdir('insertbin')
> +--
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
> new file mode 100644
> index 00000000..be925228
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
> @@ -0,0 +1,160 @@
> +From db00b3c06c0dac755f22cb72123a29ccee204990 Mon Sep 17 00:00:00 2001
> +From: Sinthu Raja <sinthu.raja@ti.com>
> +Date: Thu, 7 Sep 2023 17:50:57 +0530
> +Subject: [PATCH 2/2] kmssink: Add omapdrm and tidss in the list of drivers
> +
> +In gstreamer-bad kmssink plugin is available but
> +omapdrm and tidss drivers are not added in the
> +list of driver modules.
> +
> +Added support for DRM buffer importing. Without
> +this addition, there will be frame-copy happens
> +and slows down the playback.
> +
> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> +---
> + sys/kms/gstkmssink.c | 100 ++++++++++++++++++++++++++++++++++++++++++-
> + sys/kms/meson.build  |   2 +-
> + 2 files changed, 100 insertions(+), 2 deletions(-)
> +
> +diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
> +index 788cefc..33a3150 100644
> +--- a/sys/kms/gstkmssink.c
> ++++ b/sys/kms/gstkmssink.c
> +@@ -178,7 +178,7 @@ kms_open (gchar ** driver)
> +   static const char *drivers[] = { "i915", "radeon", "nouveau", "vmwgfx",
> +     "exynos", "amdgpu", "imx-drm", "rockchip", "atmel-hlcdc", "msm",
> +     "xlnx", "vc4", "meson", "sun4i-drm", "mxsfb-drm", "tegra",
> +-    "xilinx_drm",               /* DEPRECATED. Replaced by xlnx */
> ++    "xilinx_drm", "omapdrm", "tidss",              /* DEPRECATED. Replaced by xlnx */
> +   };
> +   int i, fd = -1;
> +
> +@@ -1333,6 +1333,101 @@ event_failed:
> +   }
> + }
> +
> ++static gboolean
> ++gst_kms_sink_import_drmbuf (GstKMSSink * self, GstBuffer * inbuf,
> ++    GstBuffer ** outbuf)
> ++{
> ++  gint prime_fds[GST_VIDEO_MAX_PLANES] = { 0, };
> ++  GstVideoMeta *meta;
> ++  guint i, n_mem, n_planes;
> ++  GstKMSMemory *kmsmem;
> ++  guint mems_idx[GST_VIDEO_MAX_PLANES];
> ++  gsize mems_skip[GST_VIDEO_MAX_PLANES];
> ++  GstMemory *mems[GST_VIDEO_MAX_PLANES];
> ++
> ++  if (!self->has_prime_import)
> ++    return FALSE;
> ++
> ++  /* This will eliminate most non-dmabuf out there */
> ++  if (!gst_is_drm_memory (gst_buffer_peek_memory (inbuf, 0)))
> ++    return FALSE;
> ++
> ++  n_planes = GST_VIDEO_INFO_N_PLANES (&self->vinfo);
> ++  n_mem = gst_buffer_n_memory (inbuf);
> ++  meta = gst_buffer_get_video_meta (inbuf);
> ++
> ++  GST_TRACE_OBJECT (self, "Found a drmbuf with %u planes and %u memories",
> ++      n_planes, n_mem);
> ++
> ++  /* We cannot have multiple dmabuf per plane */
> ++  if (n_mem > n_planes)
> ++    return FALSE;
> ++  g_assert (n_planes != 0);
> ++
> ++  /* Update video info based on video meta */
> ++  if (meta) {
> ++    GST_VIDEO_INFO_WIDTH (&self->vinfo) = meta->width;
> ++    GST_VIDEO_INFO_HEIGHT (&self->vinfo) = meta->height;
> ++
> ++    for (i = 0; i < meta->n_planes; i++) {
> ++      GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i) = meta->offset[i];
> ++      GST_VIDEO_INFO_PLANE_STRIDE (&self->vinfo, i) = meta->stride[i];
> ++    }
> ++  }
> ++
> ++  /* Find and validate all memories */
> ++  for (i = 0; i < n_planes; i++) {
> ++    guint length;
> ++
> ++    if (!gst_buffer_find_memory (inbuf,
> ++            GST_VIDEO_INFO_PLANE_OFFSET (&self->vinfo, i), 1,
> ++            &mems_idx[i], &length, &mems_skip[i]))
> ++      return FALSE;
> ++
> ++    mems[i] = gst_buffer_peek_memory (inbuf, mems_idx[i]);
> ++
> ++    /* adjust for memory offset, in case data does not
> ++     * start from byte 0 in the dmabuf fd */
> ++    mems_skip[i] += mems[i]->offset;
> ++
> ++    /* And all memory found must be dmabuf */
> ++    if (!gst_is_drm_memory (mems[i]))
> ++      return FALSE;
> ++  }
> ++  kmsmem = (GstKMSMemory *) gst_kms_allocator_get_cached (mems[0]);
> ++  if (kmsmem) {
> ++    GST_LOG_OBJECT (self, "found KMS mem %p in DMABuf mem %p with fb id = %d",
> ++        kmsmem, mems[0], kmsmem->fb_id);
> ++    goto wrap_mem;
> ++  }
> ++
> ++  for (i = 0; i < n_planes; i++)
> ++    prime_fds[i] = gst_fd_memory_get_fd (mems[i]);
> ++
> ++  GST_LOG_OBJECT (self, "found these prime ids: %d, %d, %d, %d", prime_fds[0],
> ++      prime_fds[1], prime_fds[2], prime_fds[3]);
> ++
> ++  kmsmem = gst_kms_allocator_dmabuf_import (self->allocator, prime_fds,
> ++      n_planes, mems_skip, &self->vinfo);
> ++  if (!kmsmem)
> ++    return FALSE;
> ++
> ++  GST_LOG_OBJECT (self, "setting KMS mem %p to DMABuf mem %p with fb id = %d",
> ++      kmsmem, mems[0], kmsmem->fb_id);
> ++  gst_kms_allocator_cache (self->allocator, mems[0], GST_MEMORY_CAST (kmsmem));
> ++
> ++wrap_mem:
> ++  *outbuf = gst_buffer_new ();
> ++  if (!*outbuf)
> ++    return FALSE;
> ++  gst_buffer_append_memory (*outbuf, gst_memory_ref (GST_MEMORY_CAST (kmsmem)));
> ++  gst_buffer_add_parent_buffer_meta (*outbuf, inbuf);
> ++
> ++  return TRUE;
> ++}
> ++
> ++
> ++
> + static gboolean
> + gst_kms_sink_import_dmabuf (GstKMSSink * self, GstBuffer * inbuf,
> +     GstBuffer ** outbuf)
> +@@ -1546,6 +1641,9 @@ gst_kms_sink_get_input_buffer (GstKMSSink * self, GstBuffer * inbuf)
> +   if (gst_is_kms_memory (mem))
> +     return gst_buffer_ref (inbuf);
> +
> ++    if (gst_kms_sink_import_drmbuf (self, inbuf, &buf))
> ++    goto done;
> ++
> +   if (gst_kms_sink_import_dmabuf (self, inbuf, &buf))
> +     goto done;
> +
> +diff --git a/sys/kms/meson.build b/sys/kms/meson.build
> +index 20298b6..d4dcb27 100644
> +--- a/sys/kms/meson.build
> ++++ b/sys/kms/meson.build
> +@@ -17,7 +17,7 @@ if libdrm_dep.found()
> +     kmssink_sources,
> +     c_args : gst_plugins_bad_args,
> +     include_directories : [configinc],
> +-    dependencies : [gstbase_dep, gstvideo_dep, gstallocators_dep, libdrm_dep],
> ++    dependencies : [gstbase_dep, gstvideo_dep, gstallocators_dep, gstdrm_dep, libdrm_dep],
> +     install : true,
> +     install_dir : plugins_install_dir,
> +   )
> +--
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend
> new file mode 100644
> index 00000000..c2f140a8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend
> @@ -0,0 +1,15 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +PACKAGECONFIG:append = " faad kms"
> +
> +GSTDRM_WAYLANDSINK_PATCHES = " \
> +        file://0001-gstdrmallocator-Add-DRM-allocator-support.patch \
> +        file://0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch \
> +"
> +
> +SRC_URI:append:omap-a15 = " \
> +    ${GSTDRM_WAYLANDSINK_PATCHES} \
> +"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PR:append = ".arago0"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17426): https://lists.yoctoproject.org/g/meta-ti/message/17426
> Mute This Topic: https://lists.yoctoproject.org/mt/104029525/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

