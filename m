Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43DFECDFA1
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 04:43:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3432.1666413801592361960
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 21:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BD41C40DEF;
	Sat, 22 Oct 2022 04:43:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlpHAVEy5K2w; Sat, 22 Oct 2022 04:43:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A16E640DDD;
	Sat, 22 Oct 2022 04:43:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A709B174A39;
	Sat, 22 Oct 2022 00:43:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/2] linux: drop 5.4 kernel
Date: Sat, 22 Oct 2022 04:43:06 +0000
Message-Id: <20221022044307.3385136-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 22 Oct 2022 04:43:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15193

From: Denys Dmytriyenko <denys@konsulko.com>

Deprecated in favor of 5.10

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../linux/linux-ti-staging-5.4/defconfig      |  1 -
 .../linux-ti-staging-5.4/dra7xx/defconfig     |  1 -
 .../linux/linux-ti-staging-5.4/k3/defconfig   |  1 -
 .../linux-ti-staging-5.4/omapl138/defconfig   |  1 -
 .../linux-ti-staging-5.4/ti33x/defconfig      |  1 -
 .../linux-ti-staging-5.4/ti43x/defconfig      |  1 -
 .../linux/linux-ti-staging-rt-5.4/defconfig   |  1 -
 .../linux-ti-staging-rt-5.4/dra7xx/defconfig  |  1 -
 .../linux-ti-staging-rt-5.4/k3/defconfig      |  1 -
 .../linux-ti-staging-rt-5.4/ti33x/defconfig   |  1 -
 .../linux-ti-staging-rt-5.4/ti43x/defconfig   |  1 -
 .../linux/linux-ti-staging-rt_5.4.bb          | 10 -----
 .../linux-ti-staging-systest-5.4/defconfig    |  1 -
 .../dra7xx/defconfig                          |  1 -
 .../linux-ti-staging-systest-5.4/k3/defconfig |  1 -
 .../omapl138/defconfig                        |  1 -
 .../ti33x/defconfig                           |  1 -
 .../ti43x/defconfig                           |  1 -
 .../linux/linux-ti-staging-systest_5.4.bb     |  5 ---
 .../linux/linux-ti-staging_5.4.bb             | 43 -------------------
 20 files changed, 75 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4=
/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4=
/dra7xx/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4=
/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4=
/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4=
/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4=
/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
5.4/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
5.4/dra7xx/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
5.4/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
5.4/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-=
5.4/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_=
5.4.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/dra7xx/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/k3/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/omapl138/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/ti33x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/ti43x/defconfig
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test_5.4.bb
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4=
.bb

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/defcon=
fig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/defconfig
deleted file mode 100644
index d083d182..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_omap2_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx=
/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx=
/defconfig
deleted file mode 100644
index dcb53bab..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/dra7xx/defcon=
fig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_dra7x_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/k3/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/k3/defconf=
ig
deleted file mode 100644
index b9bc6137..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/k3/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_arm64_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/omapl1=
38/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/omap=
l138/defconfig
deleted file mode 100644
index b3467853..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/omapl138/defc=
onfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_omapl138_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/d=
efconfig
deleted file mode 100644
index 88f80fa9..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti33x/defconf=
ig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_am3x_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/d=
efconfig
deleted file mode 100644
index 4b9daaf9..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-5.4/ti43x/defconf=
ig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_am4x_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/def=
config b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/defconf=
ig
deleted file mode 100644
index f0b8bab0..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_omap2_rt_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/dra=
7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/=
dra7xx/defconfig
deleted file mode 100644
index 47e3d04a..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/dra7xx/def=
config
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_dra7x_rt_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/=
defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/d=
efconfig
deleted file mode 100644
index cc10bfda..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/k3/defconf=
ig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_arm64_rt_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti3=
3x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/t=
i33x/defconfig
deleted file mode 100644
index 0a4fbac2..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti33x/defc=
onfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_am3x_rt_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti4=
3x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/t=
i43x/defconfig
deleted file mode 100644
index 99594c81..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-5.4/ti43x/defc=
onfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_am4x_rt_release
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb =
b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
deleted file mode 100644
index 8a0c0eaf..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require linux-ti-staging_5.4.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.4:"
-
-BRANCH =3D "ti-rt-linux-5.4.y"
-
-SRCREV =3D "519667b0d81d74a6e55105dcd6072ae550352599"
-PV =3D "5.4.106+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.=
4/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5=
.4/defconfig
deleted file mode 100644
index 5d051bd1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/defco=
nfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_omap2_debug
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.=
4/dra7xx/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sy=
stest-5.4/dra7xx/defconfig
deleted file mode 100644
index 2b3635c3..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/dra7x=
x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_dra7x_debug
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.=
4/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systes=
t-5.4/k3/defconfig
deleted file mode 100644
index 56cf9302..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/k3/de=
fconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_arm64_debug
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.=
4/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-=
systest-5.4/omapl138/defconfig
deleted file mode 100644
index 95b61168..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/omapl=
138/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_omapl138_debug
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.=
4/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/ti33x/defconfig
deleted file mode 100644
index 9ab6733c..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti33x=
/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_am3x_debug
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.=
4/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-sys=
test-5.4/ti43x/defconfig
deleted file mode 100644
index 825c31cd..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-5.4/ti43x=
/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=3Dti_sdk_am4x_debug
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.=
4.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
deleted file mode 100644
index 7a9a148b..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_5.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require linux-ti-staging_5.4.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.4:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
deleted file mode 100644
index 9b2d1be1..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SECTION =3D "kernel"
-SUMMARY =3D "Linux kernel for TI devices"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
-
-inherit kernel
-
-DEFCONFIG_BUILDER =3D "${S}/ti_config_fragments/defconfig_builder.sh"
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/cmem.inc
-require recipes-kernel/linux/ti-uio.inc
-require recipes-kernel/linux/bundle-devicetree.inc
-require recipes-kernel/linux/kernel-rdepends.inc
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.4:"
-
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
-
-S =3D "${WORKDIR}/git"
-
-BRANCH =3D "ti-linux-5.4.y"
-
-SRCREV =3D "023faefa70274929bff92dc41167b007f7523792"
-PV =3D "5.4.106+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
-MACHINE_KERNEL_PR:append =3D "a"
-PR =3D "${MACHINE_KERNEL_PR}"
-
-KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git=
"
-KERNEL_GIT_PROTOCOL =3D "git"
-SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH} \
-            file://defconfig"
-
-FILES:${KERNEL_PACKAGE_NAME}-devicetree +=3D "/${KERNEL_IMAGEDEST}/*.itb=
"
-
-# Special configuration for remoteproc/rpmsg IPC modules
-module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
-module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: vi=
rtio_rpmsg_bus"
-module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: =
virtio_rpmsg_bus"
-KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti=
_k3_dsp_remoteproc"
-KERNEL_MODULE_AUTOLOAD:append:j7 =3D " rpmsg_kdrv_switch"
--=20
2.25.1


