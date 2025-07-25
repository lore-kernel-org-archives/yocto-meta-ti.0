Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38724C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 20:48:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.29180.1753476519743746405
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 13:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3087540CC0;
	Fri, 25 Jul 2025 20:48:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtX5atHS_-OG; Fri, 25 Jul 2025 20:48:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F47240CC2;
	Fri, 25 Jul 2025 20:48:38 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D8C0216CE33;
	Fri, 25 Jul 2025 16:48:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 3/3] meta-ti-bsp: convert DTB prefix matching into class
Date: Fri, 25 Jul 2025 16:48:36 -0400
Message-Id: <20250725204836.2549216-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250725204836.2549216-1-denis@denix.org>
References: <20250725204836.2549216-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Jul 2025 20:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18830

From: Denys Dmytriyenko <denys@konsulko.com>

Convert devicetree prefix matching functionality into a generic
class that can be used by the kernel and wic images. That way
dynamically generated KERNEL_DEVICETREE list will be the same
when populating /boot dir of rootfs and/or FAT boot partition
of a wic image.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-devicetree-prefix.bbclass}                         | 7 +++++--
 meta-ti-bsp/conf/machine/include/ti-soc.inc               | 8 ++++++++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb     | 2 --
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 1 -
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb  | 1 -
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb    | 2 +-
 6 files changed, 14 insertions(+), 7 deletions(-)
 rename meta-ti-bsp/{recipes-kernel/linux/ti-kernel-devicetree-prefix.inc=
 =3D> classes/ti-devicetree-prefix.bbclass} (87%)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix=
.inc b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
similarity index 87%
rename from meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.=
inc
rename to meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
index 2d7be280..5858cc65 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-devicetree-prefix.inc
+++ b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
@@ -1,3 +1,4 @@
+# Generate list of DTBs from the kernel source
 def get_dtbs_from_kernel(dts_dir, dts_prefix):
     import os
     import glob
@@ -17,6 +18,8 @@ def get_dtbs_from_kernel(dts_dir, dts_prefix):
             matches.append(filename)
     return ' '.join(matches)
=20
+# Generate list of "merged" DTBs from the kernel source
+# It is TI custom feature to merge DTB overlays into a single DTB
 def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
     import os
     matches =3D []
@@ -32,9 +35,9 @@ def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
                     matches.append(pattern)
     return ' '.join(matches)
=20
-KERNEL_DEVICETREE_DTBMERGE ?=3D ""
-
 KERNEL_DEVICETREE =3D " \
     ${@get_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts=
/', '${KERNEL_DEVICETREE_PREFIX}')} \
     ${@get_merge_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/bo=
ot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
 "
+
+do_image_wic[depends] +=3D "virtual/kernel:do_shared_workdir"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/co=
nf/machine/include/ti-soc.inc
index e605d14b..3f11e31d 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -22,3 +22,11 @@ KERNEL_DTBVENDORED =3D "1"
=20
 # Also build a non-vendored list w/o dir structure
 DEVICETREE_FILES =3D "${@' '.join([os.path.basename(f) for f in d.getVar=
("KERNEL_DEVICETREE").split()])}"
+
+KERNEL_DEVICETREE_DTBMERGE ?=3D ""
+
+# Dynamically build DTBs list based on prefix matching
+CLASS_DEVICETREE_PREFIX =3D "${@ 'ti-devicetree-prefix' if d.getVar('KER=
NEL_DEVICETREE_PREFIX') else ''}"
+
+KERNEL_CLASSES +=3D "${CLASS_DEVICETREE_PREFIX}"
+IMAGE_CLASSES +=3D "${CLASS_DEVICETREE_PREFIX}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta=
-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index 1feb7564..60b647f1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -2,8 +2,6 @@ require linux-ti-mainline_git.bb
=20
 SUMMARY =3D "Linux-next kernel for TI devices"
=20
-include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
-
 # 6.6.0-rc3+ version
 SRCREV =3D "6465e260f48790807eef06b583b38ca9789b6072"
 PV =3D "6.6.0-rc3+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 40742fe6..db180e11 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -7,7 +7,6 @@ inherit ${KERNEL_BASE_CLASS}
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
-include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS'=
) else ''}
=20
 DEPENDS +=3D "gmp-native libmpc-native"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index d550a031..321cdcbb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -7,7 +7,6 @@ inherit ${KERNEL_BASE_CLASS}
=20
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
-include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS'=
) else ''}
=20
 DEPENDS +=3D "gmp-native libmpc-native"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/met=
a-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
index fc20b713..cc90d390 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -7,6 +7,6 @@ require recipes-kernel/linux/linux-yocto-fitimage.bb
=20
 inherit ti-secdev
=20
-include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.=
getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+inherit ${@ 'ti-devicetree-prefix' if d.getVar('KERNEL_DEVICETREE_PREFIX=
') else ''}
=20
 do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
--=20
2.25.1


