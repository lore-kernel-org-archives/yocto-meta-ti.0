Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEFFEC8722
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 12:51:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12076.1694091102379370540
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=V/wPVNIz;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so10728675e9.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 07 Sep 2023 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694091101; x=1694695901; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDcwwiJ3dksdpKeIS3kKgkaBaEJlDdF434twdZATMp4=;
        b=V/wPVNIzcACWwZcc+0MslmqU5TGLtjuG3pdMcRXWYAb6stN4thlts759c0yiAP8ghY
         IdsV+5YggklwSLneQ5VfXEKJF8M/OeUaHDnwHEMFCg2eKDW64dbf4qxAj3M7BJXB9Bo2
         nRX/2zWWZkHuZAZsbfYARJRt19uClN0VpDdTY3ustzLke/8lHIP4cRtp616QGyfe3L/c
         2a/PAxMTsPPTH2IrP0Xg75U7XArgt/yw7stSSeD454D/lVZVKdtmy75hResMaxyA6Mxa
         C++MC4DiVJrmYXLVh2rIMOQWfGEN5ABBxsNmzxTDuyoxpINEmY4lrMePQrttAh9gjCd0
         3ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694091101; x=1694695901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDcwwiJ3dksdpKeIS3kKgkaBaEJlDdF434twdZATMp4=;
        b=GvdijwHFk1/yv+YVJzw4OU0YMTP9lBTUtvXVFBNHVRIwKJKP4jBrlW1NbuH5JigTZv
         Jc+qp2bnlCnYk714aroPxzqarmvb8oxrJUMEtUEv7DYAH50l2O1PllFLBtWC/n+CI3ku
         gZb4rV+Dq+2XqZRqq0Un+00aiWmSnBIL6q162/oMB3Yekbxrirzy4b5l39dzWLiiyFfB
         dsnp3vlUOggpJ7XnCWB6drvx53MpIb+QUQjkJdGgZJKqjzKbfBbuGqRQjdWQbK5nkQgr
         8CrfTCh5mtTIPAeXAJgbMH2T+Q460uv48F2ASb7rANt9ZgTX74vFmnb7LtC8ZCwhyNiU
         n5Sg==
X-Gm-Message-State: AOJu0Yzdo7P7hI3r5wTvfmYQDtkfX9sba3PryFVykW9yCOoL0PH9+q5j
	E9lbnc/0At3lwkZyLUQiQ46R80UpvMdqGW8TPVM=
X-Google-Smtp-Source: AGHT+IEi1T4QJIxN0Ma5W+QLRD0dxvvwE6u6oPk6DsELjVsKfPsOo1HMpssOfJZd1w6rAJOSw4I/aPsvcYtU4IjEHCY=
X-Received: by 2002:adf:ef83:0:b0:31d:1833:4130 with SMTP id
 d3-20020adfef83000000b0031d18334130mr4799838wro.71.1694091100353; Thu, 07 Sep
 2023 05:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230906152257.2362602-1-max.oss.09@gmail.com> <e59adfac-e7f1-4a41-936d-95776a33c761@ti.com>
In-Reply-To: <e59adfac-e7f1-4a41-936d-95776a33c761@ti.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 7 Sep 2023 14:51:29 +0200
Message-ID: <CAEHkU3Vu_V6x7RCsnc62Bdo7Ai7AnFp3fiVgdeTpw6PVYHD76w@mail.gmail.com>
Subject: Re: [meta-ti] AM62, GPU driver on OE master
To: rs@ti.com
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Sep 2023 12:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16929

Hi Randolph

On Wed, Sep 6, 2023 at 6:18=E2=80=AFPM Randolph Sapp via
lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
>
> On 9/6/23 10:22, Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > Hi
> >
> > I'm trying to build and run latest OE master for a AM62 based machine
> > All builds fine.
> > I don't have the GPU working at runtime while the GPU works fine
> > using the 'same' configuration with kirkstone branches.
> > Apart from the GPU I did not (yet) see any regression as compared
> > with kirkstone. Note that the kernel is based on
> > ti-linux-6.1.y, 09.00.00.008.
> >
> >
> > First issue found is the shared objects in ti-img-rogue-umlibs are not
> > versioned shared objects, but the *.so files are packaged into the
> > ti-img-rogue-umlibs-dev package and thus not installed by default:
> >
> > In that state OpenGL falls back to software rendering which works,
> > albeit slowly.
> >
> > ```
> > $ glmark2-es2-wayland
> > LoadLib: Couldn't load libpvr_dri_support.so: libpvr_dri_support.so: ca=
nnot open shared object file: No such file or directory
> > libEGL warning: egl: failed to create dri2 screen
> > warning: queue 0xaaab104ebc90 destroyed while proxies still attached:
> >    wl_display@1 still attached
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >      glmark2 2023.01
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >      OpenGL Information
> >      GL_VENDOR:      Mesa/X.org
> >      GL_RENDERER:    softpipe
> >      GL_VERSION:     OpenGL ES 3.1 Mesa 22.3.5 (git-54fd9d7dea)
> >      Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D32 stenci=
l=3D0 samples=3D0
> >      Surface Size:   800x600 windowed
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > ```
> >
> > Creating the symlinks makes the dynamic linker happy, however then
> > OpenGL refuses to work at all:
> >
> > ```
> > $ cd /usr/lib
> > $ ln -s libpvr_dri_support.so.23.1.6404501 libpvr_dri_support.so
> > $ ln -s libsrv_um.so.23.1.6404501 libsrv_um.so
> > $ ln -s libPVRScopeServices.so.23.1.6404501 libPVRScopeServices.so
> > $ ln -sf libglslcompiler.so.23.1.6404501 libglslcompiler.so
> > $ ln -sf libsutu_display.so.23.1.6404501 libsutu_display.so
> > $ ln -sf libufwriter.so.23.1.6404501 libufwriter.so
> > $ ln -sf libusc.so.23.1.6404501 libusc.so
> >
> > $ glmark2-es2-wayland
> > [  724.820263] PVR_K:  749: RGX Firmware image 'rgx.fw.33.15.11.3' load=
ed
> > [  724.834927] PVR_K:  749: Shader binary image 'rgx.sh.33.15.11.3' loa=
ded
> > Error: Failed to find suitable EGL config
> > Error: Error: Couldn't get GL visual config!
> > Error: main: Could not initialize canvas
> > warning: queue 0xaaaab953ac90 destroyed while proxies still attached:
> >    wl_display@1 still attached
> > ```
> >
> > Is this supposed to work in current master?
> > Did anyone see that working?
> > Any hints on a way forward?
> >
> > Thanks for any input.
> > Regards
> > Max
> >
> > Some info about the system:
> >
> > ```
> > $ uname -a
> > Linux verdin-am62-15133520 6.1.46-0.0.0-devel+git.c5be551ae9b5 #1 SMP P=
REEMPT Wed Aug 30 09:00:03 UTC 2023 aarch64 GNU/Linux
> >
> > $ lsmod | grep pvr
> > pvrsrvkm             1208320  0
> > drm                   557056  9 tc358768,drm_kms_helper,drm_dma_helper,=
display_connector,pvrsrvkm,lontium_lt8912b,tidss
> >
> > $ dmesg | grep -i pvr
> > [   11.670759] pvrsrvkm: loading out-of-tree module taints kernel.
> > [   12.284051] PVR_K:  215: Device: fd00000.gpu
> > [   12.313793] PVR_K:  215: Read BVNC 33.15.11.3 from HW device registe=
rs
> > [   12.321810] PVR_K:  215: RGX Device registered with BVNC 33.15.11.3
> > [   12.363975] [drm] Initialized pvr 23.1.6404501 20170530 for fd00000.=
gpu on minor 1
> > [  156.175084] PVR_K:  769: RGX Firmware image 'rgx.fw.33.15.11.3' load=
ed
> > [  156.190080] PVR_K:  769: Shader binary image 'rgx.sh.33.15.11.3' loa=
ded
> >
> > $ opkg list-installed | grep -E "(pvr|img|mesa)"
> > kernel-module-pvrsrvkm-6.1.46-0.0.0-devel+git.c5be551ae9b5 - 23.1.64045=
01-r0b
> > libegl-mesa - 2:22.3.5-r0
> > libgl-mesa - 2:22.3.5-r0
> > libgles2-mesa - 2:22.3.5-r0
> > mesa-megadriver - 2:22.3.5-r0
> > mesa-vulkan-drivers - 2:22.3.5-r0
> > ti-img-rogue-driver - 23.1.6404501-r0b
> > ti-img-rogue-umlibs - 23.1.6404501-r2
> > ti-img-rogue-umlibs-firmware - 23.1.6404501-r2
> > ti-img-rogue-umlibs-tools - 23.1.6404501-r2
> > ```
> >
> >
> >
> >
> >
>
> Hey Max, thanks for the update. Unfortunately I haven't had any time to
> verify the master branch lately. I'll kick up a build later today if I
> get time and see if I can unblock you.
>
> We should be skipping the dev-so check and shipping the required links
> regardless, but I know upstream has been having some fun with the binary
> package class so I may need to move this recipe to something more stable.

Thanks for looking into this in your setup, I'm curious how it looks
on your side.

I noticed this when setting up our CI to also build OE master, I'm not
blocked in
any way by the issue.

Regards
Max

>
> Regards,
> Randolph
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16924): https://lists.yoctoproject.org/g/meta-ti/mess=
age/16924
> Mute This Topic: https://lists.yoctoproject.org/mt/101195159/3617484
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [max.oss.09@g=
mail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

