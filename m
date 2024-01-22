Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD10FC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 19:19:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1313.1705951147242735728
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 11:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41F6A40C2E;
	Mon, 22 Jan 2024 19:19:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDpITtxxbpm8; Mon, 22 Jan 2024 19:19:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6FFE40BE6;
	Mon, 22 Jan 2024 19:19:03 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3B25B163DD7;
	Mon, 22 Jan 2024 14:19:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH] optee-os: restore libgcc-sysroot patch with newer version
Date: Mon, 22 Jan 2024 14:19:02 -0500
Message-Id: <20240122191902.1561510-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jan 2024 19:19:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17408

From: Denys Dmytriyenko <denys@konsulko.com>

The patch was dropped with 3.17 update:

https://git.yoctoproject.org/meta-ti/commit/?h=3Ddunfell&id=3Df8182afdcfe=
427865707077d353359827f1ff6bf

But the patch is still needed for internal OE-built toolchain to pass
sysroot, otherwise libgcc.a cannot be found:

| aarch64-oe-linux-ld.bfd: cannot find libgcc.a: No such file or director=
y

The older version from meta-arm/dunfell no longer applies, so copy a newe=
r
version of the patch locally.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 +++++++++++++++++++
 recipes-security/optee/optee-os_%.bbappend    |  6 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 recipes-security/optee/optee-os/0006-allow-setting-sy=
sroot-for-libgcc-lookup.patch

diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-f=
or-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow-setti=
ng-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..17005396
--- /dev/null
+++ b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libg=
cc-lookup.patch
@@ -0,0 +1,34 @@
+From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
+for the compiler libraries as there's no easy way to reliably pass --sys=
root
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
+ 			-print-file-name=3Dinclude 2> /dev/null)
+=20
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
+=20
+ # Define these to something to discover accidental use
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-securit=
y/optee/optee-os_%.bbappend
index ddfc76f1..ebcf584d 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,6 +1,10 @@
+FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
+
 PV_ti-soc =3D "3.20.0+git${SRCPV}"
 SRCREV_ti-soc =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
-SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3Dhttp=
s"
+SRC_URI_ti-soc =3D "git://github.com/OP-TEE/optee_os.git;protocol=3Dhttp=
s \
+file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+"
=20
 DEPENDS_append_ti-soc =3D " python3-cryptography-native"
=20
--=20
2.25.1


