Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D849EE14AC
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 15:23:11 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1227.1694013786543479088
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 08:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=q0CbhM0t;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-986d8332f50so597637566b.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694013785; x=1694618585; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXalPhBwPN6NYs3TXPyCfmdeF5azBU+2U719HtMwHhk=;
        b=q0CbhM0toEnpB5DZNGyfsmQZp8V3ysbEMk2vmpwjVa/6a5Co1kSBuj4grCilBGlP/p
         6/PNGCa3YHr3ufuCqfLYwqnCXVmqR0J1esF21CX88FmYeT2jB4JE0Z/mGPRFJ600DMsk
         ysE7dfkKZHGAXOjqLahEjBDSeNXXHAy+9WgrajhvZc8EXR98ypjrMUmKqbQ4cSidweyU
         QOPj2RJEsAYg/QR5p4p6kzcECuC5DWmOPSrUiBAcrVcTedvxsEw8UpizqV/RmHGg0hcE
         /T4d8jytV4ZWPmvTRyRkr+cR5r0rUcoU4H6hAZQ73hOiY5hjbn7dH+8Jfw7RSDnnni47
         NDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694013785; x=1694618585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXalPhBwPN6NYs3TXPyCfmdeF5azBU+2U719HtMwHhk=;
        b=N0WDhWxpFqnOxzEcMKT/lRpQBw/typFT9sgxWHFjjab7+OfYaUUwwMoWfUhU0F985h
         cCDIx/pUMliwqyY6dm4ej3XSOIdb185IWVKaMJeGZJDj3Am2/eAcslWItfWX9h8wfYMh
         VGQs9GMtwUfywbxrzuRazwtXlNrdBTa9Yqe5eB5LFKsehGZLhZv3lmgHcX+7Xj7x+dGa
         g5RjCulZipA8gqyRrwkagoQ28rp5R1hZslSBkPq/vp/RzNqI1rhS4aXmC3g6soVZnOAS
         vyLCTsne3K20MKiuMDRQcVJT31I2H21vp1INYRIYLyhWzD9rAvPu15UHwdu1sSPmQ8bN
         99Dg==
X-Gm-Message-State: AOJu0YymOGF+HVN5Wal7sy7/6EfNRueFWYy51aBl23zbrFjSs8EFC59D
	FWc91i7SNIDUG4oo8FsJWQv0kb4+urM=
X-Google-Smtp-Source: AGHT+IEBYg59l3RBDfsqgn3iG8COjeP0WMSLmIvF5uXhUqFqDRUpalADwFQmkrIBnylEBrwsb4omLw==
X-Received: by 2002:a17:906:768f:b0:9a1:d67c:b4eb with SMTP id o15-20020a170906768f00b009a1d67cb4ebmr2486915ejm.48.1694013784624;
        Wed, 06 Sep 2023 08:23:04 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id r10-20020a170906c28a00b0099297782aa9sm9084622ejz.49.2023.09.06.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 08:23:04 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: AM62, GPU driver on OE master
Date: Wed,  6 Sep 2023 12:22:57 -0300
Message-Id: <20230906152257.2362602-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 15:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16923

From: Max Krummenacher <max.krummenacher@toradex.com>

Hi

I'm trying to build and run latest OE master for a AM62 based machine
All builds fine.
I don't have the GPU working at runtime while the GPU works fine
using the 'same' configuration with kirkstone branches.
Apart from the GPU I did not (yet) see any regression as compared
with kirkstone. Note that the kernel is based on
ti-linux-6.1.y, 09.00.00.008.


First issue found is the shared objects in ti-img-rogue-umlibs are not
versioned shared objects, but the *.so files are packaged into the
ti-img-rogue-umlibs-dev package and thus not installed by default:

In that state OpenGL falls back to software rendering which works,
albeit slowly.

```
$ glmark2-es2-wayland 
LoadLib: Couldn't load libpvr_dri_support.so: libpvr_dri_support.so: cannot open shared object file: No such file or directory
libEGL warning: egl: failed to create dri2 screen
warning: queue 0xaaab104ebc90 destroyed while proxies still attached:
  wl_display@1 still attached
=======================================================
    glmark2 2023.01
=======================================================
    OpenGL Information
    GL_VENDOR:      Mesa/X.org
    GL_RENDERER:    softpipe
    GL_VERSION:     OpenGL ES 3.1 Mesa 22.3.5 (git-54fd9d7dea)
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=32 stencil=0 samples=0
    Surface Size:   800x600 windowed
=======================================================
```

Creating the symlinks makes the dynamic linker happy, however then
OpenGL refuses to work at all:

```
$ cd /usr/lib
$ ln -s libpvr_dri_support.so.23.1.6404501 libpvr_dri_support.so
$ ln -s libsrv_um.so.23.1.6404501 libsrv_um.so
$ ln -s libPVRScopeServices.so.23.1.6404501 libPVRScopeServices.so
$ ln -sf libglslcompiler.so.23.1.6404501 libglslcompiler.so
$ ln -sf libsutu_display.so.23.1.6404501 libsutu_display.so
$ ln -sf libufwriter.so.23.1.6404501 libufwriter.so
$ ln -sf libusc.so.23.1.6404501 libusc.so

$ glmark2-es2-wayland                                                                                       
[  724.820263] PVR_K:  749: RGX Firmware image 'rgx.fw.33.15.11.3' loaded
[  724.834927] PVR_K:  749: Shader binary image 'rgx.sh.33.15.11.3' loaded
Error: Failed to find suitable EGL config
Error: Error: Couldn't get GL visual config!
Error: main: Could not initialize canvas
warning: queue 0xaaaab953ac90 destroyed while proxies still attached:
  wl_display@1 still attached
```

Is this supposed to work in current master?
Did anyone see that working?
Any hints on a way forward?

Thanks for any input.
Regards
Max

Some info about the system:

```
$ uname -a 
Linux verdin-am62-15133520 6.1.46-0.0.0-devel+git.c5be551ae9b5 #1 SMP PREEMPT Wed Aug 30 09:00:03 UTC 2023 aarch64 GNU/Linux

$ lsmod | grep pvr
pvrsrvkm             1208320  0
drm                   557056  9 tc358768,drm_kms_helper,drm_dma_helper,display_connector,pvrsrvkm,lontium_lt8912b,tidss

$ dmesg | grep -i pvr                                                                                       
[   11.670759] pvrsrvkm: loading out-of-tree module taints kernel.
[   12.284051] PVR_K:  215: Device: fd00000.gpu
[   12.313793] PVR_K:  215: Read BVNC 33.15.11.3 from HW device registers
[   12.321810] PVR_K:  215: RGX Device registered with BVNC 33.15.11.3
[   12.363975] [drm] Initialized pvr 23.1.6404501 20170530 for fd00000.gpu on minor 1
[  156.175084] PVR_K:  769: RGX Firmware image 'rgx.fw.33.15.11.3' loaded
[  156.190080] PVR_K:  769: Shader binary image 'rgx.sh.33.15.11.3' loaded

$ opkg list-installed | grep -E "(pvr|img|mesa)"
kernel-module-pvrsrvkm-6.1.46-0.0.0-devel+git.c5be551ae9b5 - 23.1.6404501-r0b
libegl-mesa - 2:22.3.5-r0
libgl-mesa - 2:22.3.5-r0
libgles2-mesa - 2:22.3.5-r0
mesa-megadriver - 2:22.3.5-r0
mesa-vulkan-drivers - 2:22.3.5-r0
ti-img-rogue-driver - 23.1.6404501-r0b
ti-img-rogue-umlibs - 23.1.6404501-r2
ti-img-rogue-umlibs-firmware - 23.1.6404501-r2
ti-img-rogue-umlibs-tools - 23.1.6404501-r2
```

