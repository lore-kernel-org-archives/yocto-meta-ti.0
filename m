Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1EFC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:27:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.6590.1751002021067357356
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 22:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qYhA4H1S;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: m-chawdhry@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55R5R0JX2635654
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 00:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751002020;
	bh=uhEXJ04ue1z1bmLWUsX2H0zbIt8qwBpYftnpbhYvxWw=;
	h=From:To:CC:Subject:Date;
	b=qYhA4H1SHgqsqyfjWi6Z5svW8No40y7wbNABc/UQapqR1WSOmjeXAdtj+E5cDRZtd
	 4U0V1c6xrOXn1QiwNtqU1ZFKWITVJTjTHyn3dzpSz40Oo9iEXcMvDDTQOlYfoGegne
	 B50xB0c/MN+z6Hc/iIr9Pxu46gV5ILDoj2WSeohE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55R5R0qY097535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 00:27:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 00:27:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 00:27:00 -0500
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.227.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55R5QufI2256095;
	Fri, 27 Jun 2025 00:26:57 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>, Bryan
 Brattlof <bb@ti.com>,
        Suman Anna <s-anna@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v3] Revert "conf: machine: k3: disable all fit signing for uboot"
Date: Fri, 27 Jun 2025 10:56:50 +0530
Message-ID: <20250627052650.883810-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 05:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18697

FIT signing was disabled in the past as it was interfering with multi
DTB usecase in binman, and it was thought that the binman signing being
done is equivalent to UBOOT_SIGN_ENABLE.

Though looking at the sources, UBOOT_SIGN_ENABLE is actually used to
sign the kernel FIT Image instead and the name UBOOT actually specifies
that it's used in tandom with U-boot. During the signing process, mkimage
from U-boot is used to pack the kernel FIT Image and along with that,
one DTB from U-boot is also passed to the mkimage command. The DTB that
gets passed gets the key embedded in it that is used to verify the
kernel FIT image at runtime.

Now this signed DTB is packed in U-boot by triggering a rebuild with
EXT_DTB argument in the U-boot build process. However, this failed as
there was a U-boot bug which was not looking at the packed sources
properly with the multi DTB usecase.

Now that a U-boot fix is available [0], revert that commit which
disabled the FIT signing.

This reverts commit 9656b79cb557a46d2611b67e7e51702f6da05594.

[0]: https://lore.kernel.org/all/20250626-b4-upstream-fix-icssg-fit-v1-1-95eff1c853a4@ti.com/

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
v3: Improve the commit more to be in sync with the commit being reverted.
v2: https://lore.kernel.org/yocto-meta-ti/20250627045748.876433-1-m-chawdhry@ti.com/T/#u

 meta-ti-bsp/conf/machine/include/k3.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 9b85f867c206..14d7db8a1184 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -25,6 +25,10 @@ SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME ?= "custMpk"
+UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
 FIT_HASH_ALG ?= "sha512"
 FIT_SIGN_ALG ?= "rsa4096"
 
-- 
2.34.1


