Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.559.1603906571814818763
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 10:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Mjzc88Jo;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id B491838C09B7
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 10:36:10 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SHaA11079083
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 12:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603906570;
	bh=fPD94e1ip7GwWildJ8T/5Lfks1CzqaWQxsdxUiPvack=;
	h=From:To:CC:Subject:Date;
	b=Mjzc88Jof/lGy8ujB8w3O5dS9aWu6kOdV8o9RB1JJt9jyrHYzb7idJODAyLrRmYJd
	 Qy2+tPs7AUKomMGoWqCYjs/0gLDoIJVTBMzz9bGUTq52QZa8O/zF6wG/LkTnFWaNE5
	 EQ+zb+UDsBr+g4eO5IBGcpGpPVaH+9InRq9sIt4k=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SHaAIM119661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 12:36:10 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 12:36:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 12:36:09 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SHa96t032313;
	Wed, 28 Oct 2020 12:36:09 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com [128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09SHa9a7121640;
	Wed, 28 Oct 2020 12:36:09 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Dan Murphy <dmurphy@ti.com>,
        Denys Dmytriyenko
	<denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull general toolchain support
Date: Wed, 28 Oct 2020 12:36:08 -0500
Message-ID: <20201028173608.10421-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The patch for supporting the general toolchain is pulled into the repo.
Removing it here from the recipe.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2: fix email in signoff

 .../0001-km-support-general-toolchain.patch   | 56 -------------------
 .../ti-img-rogue-driver_1.10.5371573.bb       |  9 ++-
 2 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-=
km-support-general-toolchain.patch

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-supp=
ort-general-toolchain.patch b/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver/0001-km-support-general-toolchain.patch
deleted file mode 100644
index 4dc219cd..00000000
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-gen=
eral-toolchain.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From dbdbd9309a58ee723fc827ef5fd45c28347cf61f Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 7 May 2019 17:06:09 -0400
-Subject: [PATCH] km: support general toolchain
-
-This is a patch from IMG to support general toolchains such as
-aarch64-oe-linux-gnu, aarch64-poky-linux-gnu, arm-none-linux-gnueabi
-per IMG ticket 122059
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- build/linux/config/compiler.mk        | 12 +++++++++++-
- .../build/linux/config/compilers/arm-linux-gnueabi.mk       |  6 ++++++
- 2 files changed, 17 insertions(+), 1 deletion(-)
- create mode 100644 build/linux/config/compilers/arm-linux-gnueabi.mk
-
-diff --git a/build/linux/config/compiler.mk b/build/linux/config/compile=
r.mk
-index 82c9d44..dead2f9 100644
---- a/build/linux/config/compiler.mk
-+++ b/build/linux/config/compiler.mk
-@@ -48,13 +48,14 @@ define calculate-compiler-preferred-target
-  ifeq ($(2),qcc)
-   $(1)_compiler_preferred_target :=3D qcc
-  else
--  $(1)_compiler_preferred_target :=3D $$(subst --,-,$$(shell $(2) -dump=
machine))
-+  $(1)_compiler_preferred_target :=3D $$(subst --,-,$$(subst unknown,,$=
$(shell $(2) -dumpmachine)))
-   ifeq ($$($(1)_compiler_preferred_target),)
-    $$(warning No output from '$(2) -dumpmachine')
-    $$(warning Check that the compiler is in your PATH and CROSS_COMPILE=
 is)
-    $$(warning set correctly.)
-    $$(error Unable to run compiler '$(2)')
-   endif
-+  $$(warning $(1) $(2))
-   ifneq ($$(filter %-w64-mingw32,$$($(1)_compiler_preferred_target)),)
-    # Use the compiler target name.
-   else
-@@ -64,6 +65,15 @@ define calculate-compiler-preferred-target
-    ifneq ($$(filter arm-linux-android,$$($(1)_compiler_preferred_target=
)),)
-     $(1)_compiler_preferred_target :=3D arm-linux-androideabi
-    endif
-+  ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
-+   $(1)_compiler_preferred_target :=3D aarch64-linux-gnu
-+  endif
-+  ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-redh=
at-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
-+   $(1)_compiler_preferred_target :=3D arm-linux-gnueabi
-+  endif
-+  ifneq ($$(filter arm-%-gnueabihf,$$($(1)_compiler_preferred_target)),=
)
-+   $(1)_compiler_preferred_target :=3D arm-linux-gnueabihf
-+  endif
-    ifneq ($$(filter clang%,$(2)),)
-     ifeq ($(1),target)
-      ifeq (arm-linux-gnueabihf,$$(CROSS_TRIPLE))
---=20
-2.7.4
-
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573=
.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index da4ec6e6..e0632a18 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -7,7 +7,7 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-MACHINE_KERNEL_PR_append =3D "f"
+MACHINE_KERNEL_PR_append =3D "g"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
@@ -19,12 +19,11 @@ PROVIDES =3D "virtual/gpudriver"
=20
 BRANCH =3D "linuxws/zeus/k5.4/${PV}"
=20
-SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D=
${BRANCH} \
-    file://0001-km-support-general-toolchain.patch \
-"
+SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D=
${BRANCH}"
+
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "e0bc128ee5098e30c9fb096634ba6bec01b5fc17"
+SRCREV =3D "f58bea1084c5004f129943a53b94ee1446e9c3a7"
=20
 PVR_SOC =3D "j721e_linux"
 PVR_BVNC =3D "22.104.208.318"
--=20
2.29.0

