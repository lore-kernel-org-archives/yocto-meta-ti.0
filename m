Return-Path: <sebastian.krahl@lacon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72761C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:52:20 +0000 (UTC)
Subject: Postinstall scriptlets of ['ti-sgx-ddk-um'] have failed.
To: meta-ti@lists.yoctoproject.org
From: "Sebastian" <sebastian.krahl@lacon.de>
X-Originating-Location: Bernau bei Berlin, Brandenburg, DE (79.140.115.69)
X-Originating-Platform: Windows Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Mar 2025 07:52:15 -0700
Message-ID: <vr9P.1743087135909863464.R6f8@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 14:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18423

Hey there,

actually I'm frustrated, I don't know where I'm going wrong.

My setup:
Build Configuration:
BB_VERSION           =3D "2.0.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-poky-linux-gnueabi"
MACHINE              =3D "beaglebone"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "4.0.25"
TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           =3D "hard"
meta
meta-poky            =3D "kirkstone:b210ed67de098a78a577baf464fae569d020de6=
2"
meta-arm-toolchain
meta-arm             =3D "kirkstone:936c02ec13661bd86a05f7f90e1b920d5092d67=
0"
meta-ti-bsp
meta-ti-extras       =3D "kirkstone:98c5c3d732334a26d57cb3534230e858d96db0c=
6"
meta-oe              =3D "kirkstone:7e18b3fc774b7efabf9a20ae3cd6abd0e0715b5=
9"

I want to build the core-image-sato but it fails with:
ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-sgx=
-ddk-um'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /home/lacon/yocto/build/tmp/work/beaglebone-p=
oky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.
ERROR: Logfile of failure stored in: /home/lacon/yocto/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.23534
ERROR: Task (/home/lacon/yocto/poky/meta/recipes-sato/images/core-image-sat=
o.bb:do_rootfs) failed with exit code '1'

Can anyone help to progress further?

Regards,

Sebastian

