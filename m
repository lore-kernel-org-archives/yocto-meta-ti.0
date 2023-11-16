Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1EFC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 09:33:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3451.1700127226902842683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Nov 2023 01:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XqqS8Lcz;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-32db188e254so410379f8f.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 16 Nov 2023 01:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700127225; x=1700732025; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SffUWHPMK1qqhjhET7nneAWIasqBiGmJlscsFd97M+E=;
        b=XqqS8LczQttRIJjn3D2+w5NrzXHwEf7h1gPD92+RpsKlUWDOO+owtGh24FgR8uZp8P
         Sl82TwLY240/6UQ5StwGqevfT7r9O+QKnMRRTq8CV50TsWTQKHeXhN9m+SbO/9TuRCEg
         H7LCOYLrhaFubiHOse6mJ/KGP8TEVWW3LeoDbG3pCO19Mx+H7lhkjN065iZZ18zTedZ6
         hEjZPJFZlJn15bI5jAKbFpgHH7qWxlfQkeWKrvkkvhwnMlPeJQ9YqhnFjNUc+AgkvMrP
         o/UtUM2djpCjEbAxwRwOUmOMzHS91MZXRq9lXlsdnYsmkwWMPEvzZbPe1plzobPuqD13
         +84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127225; x=1700732025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SffUWHPMK1qqhjhET7nneAWIasqBiGmJlscsFd97M+E=;
        b=pW4hcjRjSCe7WYNzzevWmtzy9bQ37MPZQdOrdPJ/19zfbsok2lX4DzmBvOhDVZoFUe
         mKiovlkhtOD6ZPQKORxuyik1Utw5/5h5fetTiH4aK4C4Dkvxq5Rp5j4YucZufPam1m6k
         SH7ydj722799HlQ6pWEiS9Pbq7s5mwc+H7XXnRcvME5m18aQTPQTS8EuE85udk2LyT2a
         B/0HoVcaNYzQhZqW2S6stGFZ3uItozpPWA/PkbSyam/RzDyNdHQC4eDKZ+2vwOPi8RLy
         dx8Op3TWm3Dar0hOmJZjMBp52e1jCTAjqXrqAmR/dltHpc13y7W4JXTGpVywf0y1AmbS
         Umkw==
X-Gm-Message-State: AOJu0Ywb7ePljGS3wRvHtRK4W8HmLzAM5Onc1WvgkmLHvNFYl8wYDz6+
	XhCvkU0jWFnPQM672/pXnvJtJkHBDsy4zTpuIWM=
X-Google-Smtp-Source: AGHT+IEWA0ba1/75Q2nU52/M9keVAeHQPJ7heqwMdPgoUMwKw8iXcqLeUiNTAtxAH3sWlgcmRUeY8HdFxEBodobX4V4=
X-Received: by 2002:a05:6000:186b:b0:32f:ba72:e80b with SMTP id
 d11-20020a056000186b00b0032fba72e80bmr15792798wri.54.1700127225083; Thu, 16
 Nov 2023 01:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20231023161538.1798206-1-max.oss.09@gmail.com>
 <ZVOdgoK/6uaA76cH@francesco-nb.int.toradex.com> <62161039-d848-4e58-a829-b866689754df@ti.com>
In-Reply-To: <62161039-d848-4e58-a829-b866689754df@ti.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 16 Nov 2023 10:33:33 +0100
Message-ID: <CAEHkU3WGDxnz9w+Fz1D_kvysQn8+7AgzzRbDetHpH_EqKnwiYA@mail.gmail.com>
Subject: Re: [meta-ti][kirkstone] regression with rogue gpu
To: reatmon@ti.com
Cc: Francesco Dolcini <francesco@dolcini.it>, Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org, 
	max.krummenacher@toradex.com, Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Nov 2023 09:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17304

Hi Ryan

On Tue, Nov 14, 2023 at 6:37=E2=80=AFPM Ryan Eatmon via lists.yoctoproject.=
org
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>
> On 11/14/2023 10:17 AM, Francesco Dolcini wrote:
> > Hello Randolph,
> >
> > On Mon, Oct 23, 2023 at 01:15:38PM -0300, Max Krummenacher wrote:
> >> On our weekly CI build we see glmark segfaulting on our AM625 based So=
M.
> >>
> >> Reverting commit 9b6bce2c ("mesa-pvr: bump srcrev for sgx support") on
> >> top of meta-ti @ 59edb4e8 ("linux-ti-staging_6.1: CI/CD Auto-Merger: c=
icd.kirkstone.202310191725")
> >> fixes the segfault and glmark shows similar performance as before.
> >>
> >> It looks like the addition of the SGX GPU introduced a regression with
> >> the Rogue GPU.
> >
> > any feedback on this report? We would need to update meta-ti to get a
> > fix on the DM firmware, however we are blocked because of this
> > regression on the GPU.
> >
> > Can you help figure out what's going on? Is there any dependency on the
> > Linux kernel from your downstream branch we need to cherry-pick? Is thi=
s
> > working on TI SK AM62?
>
> I believe that this issue was fixed by this commit:
>
> https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Dkirkstone&id=3D=
00de85a06e252fa17ce004635ba30d055166aa5d
>
> This is on the main kirkstone branch.  Please test it to make sure it
> does fix the issue.
>

Actually the issue persists.

I tested our setup with meta-ti in a version containing commit
00de85a06 with the same result as before that commit.
When using the GPU, i.e. by starting glmark-es2-wayland or
weston-simple-egl the process segfaults.

I did setup arago and built the tisdk-default-image for
am62xx-evm to exclude that our setup somehow messes with the
GPU or we need to merge stuff into our U-Boot / Kernel trees.
Running that image on SK-AM62 shows the same segfault when
using the GPU.

Regards
Max


root@am62xx-evm:~# glmark2-es2-wayland
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2021.12
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     Imagination Technologies
    GL_RENDERER:   PowerVR A-Series AXE-1-16M
    GL_VERSION:    OpenGL ES 3.1 build 23.2@6460340
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse:[   26.004288] kauditd_printk_skb: 1 callbacks supp=
ressed
[   26.004317] audit: type=3D1701 audit(1651169516.600:15):
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D726
comm=3D"glmark2-es2-way"
exe=3D"/usr/bin/glmark2-es2-wayland" sig=3D11 res=3D1
[   26.071116] audit: type=3D1334 audit(1651169516.664:16): prog-id=3D13 op=
=3DLOAD
[   26.078085] audit: type=3D1334 audit(1651169516.672:17): prog-id=3D14 op=
=3DLOAD
Segmentation fault (core dumped)
root@am62xx-evm:~# [   27.111672] audit: type=3D1334
audit(1651169517.708:18): prog-id=3D14 op=3DUNLOAD
[   27.119012] audit: type=3D1334 audit(1651169517.708:19): prog-id=3D13 op=
=3DUNLOAD

root@am62xx-evm:~# weston-simple-egl
has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
[   38.378006] audit: type=3D1701 audit(1651169528.972:20):
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D733
comm=3D"weston-simple-e"
exe=3D"/usr/bin/weston-simple-egl" sig=3D11 res=3D1
[   38.406617] audit: type=3D1334 audit(1651169529.000:21): prog-id=3D15 op=
=3DLOAD
[   38.413536] audit: type=3D1334 audit(1651169529.008:22): prog-id=3D16 op=
=3DLOAD
Segmentation fault (core dumped)
root@am62xx-evm:~# [   39.179515] audit: type=3D1334
audit(1651169529.776:23): prog-id=3D16 op=3DUNLOAD
[   39.186626] audit: type=3D1334 audit(1651169529.776:24): prog-id=3D15 op=
=3DUNLOAD

root@am62xx-evm:~#


Used layer hashes:

Build Configuration (mc:default):
BB_VERSION           =3D "2.0.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "fedora-38"
TARGET_SYS           =3D "aarch64-oe-linux"
MACHINE              =3D "am62xx-evm"
DISTRO               =3D "arago"
DISTRO_VERSION       =3D "2023.10"
TUNE_FEATURES        =3D "aarch64"
TARGET_FPU           =3D ""
meta-arago-distro
meta-arago-extras
meta-arago-demos
meta-arago-test      =3D "kirkstone:1bbf7db62c15977004217f83fb72fdf165597ba=
d"
meta-qt5             =3D "kirkstone:ae8a97f79364bed1abc297636f7933d0e35f22b=
e"
meta-virtualization  =3D "kirkstone:478a91800c4a95c7410dc8ef52e229a81be24b4=
e"
meta-networking
meta-python
meta-oe
meta-gnome
meta-filesystems     =3D "kirkstone:7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca=
0"
meta-ti-extras
meta-ti-bsp          =3D "kirkstone:9efb0c6fc4f5089f4f2a305c2823dba31150548=
7"
meta-arm
meta-arm-toolchain   =3D "kirkstone:b187fb9232ca0a6b5f8f90b4715958546fc41d7=
3"
meta                 =3D "kirkstone:4bb6373e5f4a1330a063d1afe855d6c24d5461e=
7"

>
>
> > Thanks for your support,
> > Francesco
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17297): https://lists.yoctoproject.org/g/meta-ti/mess=
age/17297
> Mute This Topic: https://lists.yoctoproject.org/mt/102138831/3617484
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11972926/3617=
484/839770832/xyzzy [max.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

