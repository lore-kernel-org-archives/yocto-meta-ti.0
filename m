Return-Path: <blake.lapum@spindance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63902EE499E
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 22:57:04 +0000 (UTC)
Subject: beaglebone: root=PARTUUID=${uuid} not expanding in extlinux.conf
To: meta-ti@lists.yoctoproject.org
From: blake.lapum@spindance.com
X-Originating-Location: South Haven, Michigan, US (24.128.128.79)
X-Originating-Platform: Linux Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 18 Aug 2023 15:56:56 -0700
Message-ID: <oEDO.1692399416443479492.aIOL@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Aug 2023 22:57:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16879

Hello and thank you for any help in advance:

I am working with Yocto/poky for the first time. I am able to successfully =
build the `core-image-base` for the `beaglebone` machine using the followin=
g layers:

- meta-arm: origin/kirkstone (c39bb4ce3b60b73d35c5fb06af012432e70d6b38)
    - "meta-arm-toolchain" layer
    - "meta-arm" layer
- meta-ti: origin/kirkstone (7e1a048bc0f116842a6076cd284d80dc0eae01f8)
    - "meta-ti-bsp" layer
- poky: origin/kirkstone (d6b8790370500b99ca11f0d8a05c39b661ab2ba6)
    - "meta" layer
    - "meta-poky" layer

I did not modify any layers, the layers have been added successfully to BBL=
AYERS, and I am simply adding MACHINE ?=3D "beaglebone" and IMAGE_FSTYPES +=
=3D "wic" to my local.conf.=20

However, after flashing (sudo dd if=3D$IMAGE of=3D$DEVICE status=3Dprogress=
 conv=3Dfsync) the generated .wic image, there is a kernel panic due to inv=
alid an PARTUUID:

[    5.458363] VFS: PARTUUID=3D is invalid.
[    5.458363] Expected PARTUUID=3D<valid-uuid-id>[/PARTNROFF=3D%d]
[    5.468094] Disabling rootwait; root=3D is invalid.
[    5.473129] VFS: Cannot open root device "PARTUUID=3D" or unknown-block(=
0,0): error -6
[    5.481011] Please append a correct "root=3D" boot option; here are the =
available partitions:
[    5.489480] b300         3735552 mmcblk1=20
[    5.489488]  driver: mmcblk
[    5.496351]   b301         3731456 mmcblk1p1 d0be457f-01
[    5.496356]=20
[    5.503209] 0b3:00300   61798400 mmcblk0=20
[    5.503215]  driver: mmcblk
[    5.510078]   0b3:00301     131072 mmcblk0p1 e9fc2e52-01
[    5.510083]=20
[    5.516943]   0b3:00302     267378 mmcblk0p2 e9fc2e52-02
[    5.516948]=20
[    5.523795] Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(0,0)
[    5.532120] ---[ end Kernel panic - not syncing: VFS: Unable to mount ro=
ot fs on unknown-block(0,0) ]---

I see that the generated extlinux/extlinux.conf file sets "root=3DPARTUUID=
=3D${uuid}". I thought this variable was to be replaced when preparing the =
wic image, but I also validated that $uuid is unset in the u-boot environme=
nt.=20

I am able to get around this issue if I hardcode my PARTUUID (root=3DPARTUU=
ID=3D<blkid PARTUUID of my root partition>) in the extlinux.conf. This may =
be a naive question, but is this expected - is it standard practice to set =
the correct root=3DPARTUUID=3D${uuid} after the extlinux.conf is generated?=
 I am assuming not, but I have not been able to find a workaround without p=
atching meta-ti/meta-ti-bsp/conf/machine/include/ti33x.inc (UBOOT_EXTLINUX_=
ROOT =3D "root=3D/dev/mmcblk0p2") or hardcoding my PARTUUID.=20

Any direction is appreciated, and again, I thank you in advance for any rep=
lies.=20

