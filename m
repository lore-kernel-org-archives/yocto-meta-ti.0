Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EB3C04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 04:56:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3683.1666414592601113852
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 21:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF09040DF3;
	Sat, 22 Oct 2022 04:56:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUNqjJPtFb2x; Sat, 22 Oct 2022 04:56:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D31D640DEF;
	Sat, 22 Oct 2022 04:56:30 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CD49C174A3B;
	Sat, 22 Oct 2022 00:56:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] linux-ti-next: add recipe for building linux-next
Date: Sat, 22 Oct 2022 04:56:25 +0000
Message-Id: <20221022045625.3385830-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221022045625.3385830-1-denis@denix.org>
References: <20221022045625.3385830-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 22 Oct 2022 04:56:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15195

From: Denys Dmytriyenko <denys@konsulko.com>

Required for daily test plans. Can be enabled in local.conf or <distro>.c=
onf:

PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-next"
SRCREV:pn-linux-ti-next =3D "${AUTOREV}"

Only uses in-tree defconfigs, does not support config fragments, builds a=
nd
packages in-tree DTBs.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-ti-next_git.bb | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta=
-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
new file mode 100644
index 00000000..e2908951
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -0,0 +1,43 @@
+SECTION =3D "kernel"
+SUMMARY =3D "Linux-next kernel for TI devices"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+
+inherit kernel
+
+require recipes-kernel/linux/ti-kernel.inc
+
+DEPENDS +=3D "gmp-native libmpc-native"
+
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
+
+S =3D "${WORKDIR}/git"
+
+# 6.1.0-rc1+ version
+SRCREV =3D "4d48f589d294ddc5e01d3b0dc7cecc55324c05ca"
+PV =3D "6.1.0-rc1+git${SRCPV}"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git;protocol=3Dhttps;branch=3Dmaster"
+
+def list_dtbs(dts_dir, dts_subdir):
+    import os
+    import fnmatch
+    matches =3D []
+
+    for root,dirnames,filenames in os.walk(os.path.join(dts_dir, dts_sub=
dir)):
+        for filename in fnmatch.filter(filenames, '*.dtb'):
+            matches.append(os.path.join(dts_subdir, filename))
+        for filename in fnmatch.filter(filenames, '*.dtbo'):
+            matches.append(os.path.join(dts_subdir, filename))
+    return ' '.join(matches)
+
+DTS_SUBDIR =3D ""
+DTS_SUBDIR:k3 =3D "ti"
+KERNEL_DEVICETREE =3D "${@list_dtbs('${B}/arch/${ARCH}/boot/dts', '${DTS=
_SUBDIR}')}"
+DEFCONFIG_NAME =3D "multi_v7_defconfig"
+DEFCONFIG_NAME:k3 =3D "defconfig"
+KERNEL_CONFIG_COMMAND =3D "oe_runmake -C ${S} O=3D${B} ${DEFCONFIG_NAME}=
"
+
+kernel_do_compile:append() {
+	oe_runmake dtbs CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}" ${KE=
RNEL_EXTRA_ARGS}
+}
--=20
2.25.1


