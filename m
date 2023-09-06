Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E4BEE14AE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:18:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3018.1694017120497819678
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 09:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y18T0R8C;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 386GId0b027906
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Sep 2023 11:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694017119;
	bh=p9hSv0/OOKyplLnlhMkGeTFMmqqrvTGR30SOB2uanbc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=y18T0R8CkI3umCx+zrW/KCS0l1EKX2mFKjuPEH/h/qQJsG72YevJ2RPdLdm7mjqXc
	 uBJrf2HchOVC+gKhE+PNLBk0mzP1rKL0EpOoVe5QRe9AOdWLscTUyApb/5OoCfA524
	 kGyrL8EJs7/Nc7KL9iRksNuDcyhbyHsfo8Oa30qc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 386GIdgc100576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Sep 2023 11:18:39 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Sep 2023 11:18:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Sep 2023 11:18:38 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 386GIcbw020838
	for <meta-ti@lists.yoctoproject.org>; Wed, 6 Sep 2023 11:18:38 -0500
Message-ID: <e59adfac-e7f1-4a41-936d-95776a33c761@ti.com>
Date: Wed, 6 Sep 2023 11:18:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] AM62, GPU driver on OE master
To: <meta-ti@lists.yoctoproject.org>
References: <20230906152257.2362602-1-max.oss.09@gmail.com>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230906152257.2362602-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 16:18:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16924

On 9/6/23 10:22, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Hi
> 
> I'm trying to build and run latest OE master for a AM62 based machine
> All builds fine.
> I don't have the GPU working at runtime while the GPU works fine
> using the 'same' configuration with kirkstone branches.
> Apart from the GPU I did not (yet) see any regression as compared
> with kirkstone. Note that the kernel is based on
> ti-linux-6.1.y, 09.00.00.008.
> 
> 
> First issue found is the shared objects in ti-img-rogue-umlibs are not
> versioned shared objects, but the *.so files are packaged into the
> ti-img-rogue-umlibs-dev package and thus not installed by default:
> 
> In that state OpenGL falls back to software rendering which works,
> albeit slowly.
> 
> ```
> $ glmark2-es2-wayland
> LoadLib: Couldn't load libpvr_dri_support.so: libpvr_dri_support.so: cannot open shared object file: No such file or directory
> libEGL warning: egl: failed to create dri2 screen
> warning: queue 0xaaab104ebc90 destroyed while proxies still attached:
>    wl_display@1 still attached
> =======================================================
>      glmark2 2023.01
> =======================================================
>      OpenGL Information
>      GL_VENDOR:      Mesa/X.org
>      GL_RENDERER:    softpipe
>      GL_VERSION:     OpenGL ES 3.1 Mesa 22.3.5 (git-54fd9d7dea)
>      Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=32 stencil=0 samples=0
>      Surface Size:   800x600 windowed
> =======================================================
> ```
> 
> Creating the symlinks makes the dynamic linker happy, however then
> OpenGL refuses to work at all:
> 
> ```
> $ cd /usr/lib
> $ ln -s libpvr_dri_support.so.23.1.6404501 libpvr_dri_support.so
> $ ln -s libsrv_um.so.23.1.6404501 libsrv_um.so
> $ ln -s libPVRScopeServices.so.23.1.6404501 libPVRScopeServices.so
> $ ln -sf libglslcompiler.so.23.1.6404501 libglslcompiler.so
> $ ln -sf libsutu_display.so.23.1.6404501 libsutu_display.so
> $ ln -sf libufwriter.so.23.1.6404501 libufwriter.so
> $ ln -sf libusc.so.23.1.6404501 libusc.so
> 
> $ glmark2-es2-wayland
> [  724.820263] PVR_K:  749: RGX Firmware image 'rgx.fw.33.15.11.3' loaded
> [  724.834927] PVR_K:  749: Shader binary image 'rgx.sh.33.15.11.3' loaded
> Error: Failed to find suitable EGL config
> Error: Error: Couldn't get GL visual config!
> Error: main: Could not initialize canvas
> warning: queue 0xaaaab953ac90 destroyed while proxies still attached:
>    wl_display@1 still attached
> ```
> 
> Is this supposed to work in current master?
> Did anyone see that working?
> Any hints on a way forward?
> 
> Thanks for any input.
> Regards
> Max
> 
> Some info about the system:
> 
> ```
> $ uname -a
> Linux verdin-am62-15133520 6.1.46-0.0.0-devel+git.c5be551ae9b5 #1 SMP PREEMPT Wed Aug 30 09:00:03 UTC 2023 aarch64 GNU/Linux
> 
> $ lsmod | grep pvr
> pvrsrvkm             1208320  0
> drm                   557056  9 tc358768,drm_kms_helper,drm_dma_helper,display_connector,pvrsrvkm,lontium_lt8912b,tidss
> 
> $ dmesg | grep -i pvr
> [   11.670759] pvrsrvkm: loading out-of-tree module taints kernel.
> [   12.284051] PVR_K:  215: Device: fd00000.gpu
> [   12.313793] PVR_K:  215: Read BVNC 33.15.11.3 from HW device registers
> [   12.321810] PVR_K:  215: RGX Device registered with BVNC 33.15.11.3
> [   12.363975] [drm] Initialized pvr 23.1.6404501 20170530 for fd00000.gpu on minor 1
> [  156.175084] PVR_K:  769: RGX Firmware image 'rgx.fw.33.15.11.3' loaded
> [  156.190080] PVR_K:  769: Shader binary image 'rgx.sh.33.15.11.3' loaded
> 
> $ opkg list-installed | grep -E "(pvr|img|mesa)"
> kernel-module-pvrsrvkm-6.1.46-0.0.0-devel+git.c5be551ae9b5 - 23.1.6404501-r0b
> libegl-mesa - 2:22.3.5-r0
> libgl-mesa - 2:22.3.5-r0
> libgles2-mesa - 2:22.3.5-r0
> mesa-megadriver - 2:22.3.5-r0
> mesa-vulkan-drivers - 2:22.3.5-r0
> ti-img-rogue-driver - 23.1.6404501-r0b
> ti-img-rogue-umlibs - 23.1.6404501-r2
> ti-img-rogue-umlibs-firmware - 23.1.6404501-r2
> ti-img-rogue-umlibs-tools - 23.1.6404501-r2
> ```
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16923): https://lists.yoctoproject.org/g/meta-ti/message/16923
> Mute This Topic: https://lists.yoctoproject.org/mt/101195159/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Hey Max, thanks for the update. Unfortunately I haven't had any time to 
verify the master branch lately. I'll kick up a build later today if I 
get time and see if I can unblock you.

We should be skipping the dev-so check and shipping the required links 
regardless, but I know upstream has been having some fun with the binary 
package class so I may need to move this recipe to something more stable.

Regards,
Randolph

