Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E263C6FD18
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14448.1677233543162451836
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B692140C06
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPGLPwG-_sD0 for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9FD4740C88
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4D18B163762
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:11:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v8 0/6] Graphics rework attempt #8
Date: Fri, 24 Feb 2023 10:12:13 +0000
Message-Id: <20230224101219.4130589-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15949

From: Denys Dmytriyenko <denys@konsulko.com>

Previous v7 revision of this series had few minor comments. Even though i=
t
was marked for kirkstone only, it accidentally got merged to master and
caused breakage.

This v8 revision makes the same changes work in kirkstone and master,
addresses previous feedback and ties up loose ends.

Here's a very detailed cover letter for v7, which is still applicable her=
e:
https://lists.yoctoproject.org/g/meta-ti/message/15707

Denys Dmytriyenko (2):
  mesa: locally overlay 22.0-specific patches from oe-core/kirkstone
  conf/machine: fix use of screen and touchscreen machine features

Randolph Sapp (3):
  meta-ti-bsp: graphics: Resolve dependency chain
  meta-ti-bsp: machine: remove default preferences for egl,gles,gbm
  meta-ti-bsp: machine: set SGX display controller alias

Ryan Eatmon (1):
  conf: machine: Fallback to software rendering

 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |   2 -
 meta-ti-bsp/conf/machine/include/am62xx.inc   |   6 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc   |   2 -
 meta-ti-bsp/conf/machine/include/am65xx.inc   |   6 +-
 meta-ti-bsp/conf/machine/include/j721e.inc    |   6 +-
 meta-ti-bsp/conf/machine/include/j721s2.inc   |   6 +-
 meta-ti-bsp/conf/machine/include/j784s4.inc   |   6 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc |   9 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |   9 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |   9 +-
 ...bb =3D> ti-img-rogue-driver_1.18.6276027.bb} |  20 +--
 .../ti-sgx-ddk-km_1.17.4948957.bb             |   8 +-
 ...bb =3D> ti-img-rogue-umlibs_1.18.6276027.bb} |  68 ++------
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     |  30 +---
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 ++++++++++++++++++
 ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |  25 +++
 ...k-for-all-linux-host_os-combinations.patch |  43 +++++
 ...ormat-Check-for-NEON-before-using-it.patch |  47 ++++++
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 +++++++
 .../mesa/mesa-gl_22.%.bbappend                |   1 +
 .../recipes-graphics/mesa/mesa_22.%.bbappend  |   1 +
 .../recipes-graphics/mesa/pvr-mesa.inc        |  47 ++++++
 23 files changed, 468 insertions(+), 136 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.15=
.6133109.bb =3D> ti-img-rogue-driver_1.18.6276027.bb} (72%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.15.61=
33109.bb =3D> ti-img-rogue-umlibs_1.18.6276027.bb} (22%)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-e=
gl-wayland-deprecate-drm_handle_format-and-d.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-=
Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson-mi=
sdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-meson.bu=
ild-check-for-all-linux-host_os-combinations.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-util-for=
mat-Check-for-NEON-before-using-it.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.bu=
ild-make-TLS-ELF-optional.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappe=
nd
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

--=20
2.25.1


