Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F22BC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 21:33:52 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.3218.1659735225901833866
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 14:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O26t6mJf;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 275LXh5H012230;
	Fri, 5 Aug 2022 16:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659735223;
	bh=jbPWvYpDgkv50JHsOWgruB+DIwAyTyjzj3D0FoE3mpA=;
	h=From:To:CC:Subject:Date;
	b=O26t6mJfCuMaGv1k+8tHvBJFsRHL50t7Ua/q2eM7EP2D+nYRqRB8tlEkPM0ymM8yW
	 364Qh/80o1bZuCaJ9KEEbb00iY4emTVbEvNO5MvyRfa/U8jW1TCeWJ/OdZTpnWsWFz
	 6Q0PqiE9uUSqkPmuY9+z8gc8ZsjAXMkAwJ/Rq4P8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 275LXhG3040403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Aug 2022 16:33:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Aug 2022 16:33:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Aug 2022 16:33:42 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 275LXgwZ130869;
	Fri, 5 Aug 2022 16:33:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Add extra
 machine to build GP SYSFW
Date: Fri, 5 Aug 2022 16:33:42 -0500
Message-ID: <20220805213342.26475-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 21:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14937

Use multiconfig to generate a GP SYSFW image. This allows the HS SDK
to be used on GP boards by simply switching out the SYSFW image:

$ cd /mnt/sd-card/boot
$ mv tiboot3-am64x-gp-evm.bin tiboot3.bin

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-hs-evm-k3r5-gp.conf | 16 ++++++++++++++++
 conf/machine/am64xx-hs-evm.conf         |  6 ++++++
 conf/multiconfig/k3r5-gp.conf           |  3 +++
 3 files changed, 25 insertions(+)
 create mode 100644 conf/machine/am64xx-hs-evm-k3r5-gp.conf
 create mode 100644 conf/multiconfig/k3r5-gp.conf

diff --git a/conf/machine/am64xx-hs-evm-k3r5-gp.conf b/conf/machine/am64xx-hs-evm-k3r5-gp.conf
new file mode 100644
index 00000000..b255dca8
--- /dev/null
+++ b/conf/machine/am64xx-hs-evm-k3r5-gp.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: AM64xx GP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx GP EVM (R5F core)
+
+# Booting GP requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/am64xx-hs-evm-k3r5.conf
+SOC_FAMILY_append = ":k3r5-gp"
+
+SYSFW_SUFFIX = "gp"
+SYSFW_TIBOOT3_SYMLINK = ""
+
+SPL_BINARY = ""
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index 614eba4b..1149d4c7 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -17,3 +17,9 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
+
+# Since default tiboot3.bin on AM64x is for HS, add a version for GP
+BBMULTICONFIG += "k3r5-gp"
+IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
diff --git a/conf/multiconfig/k3r5-gp.conf b/conf/multiconfig/k3r5-gp.conf
new file mode 100644
index 00000000..1d86dcc7
--- /dev/null
+++ b/conf/multiconfig/k3r5-gp.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE_append = "-gp"
-- 
2.36.1


