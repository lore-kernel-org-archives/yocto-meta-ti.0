Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E07C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:57:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.74.1665694635405998081
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XzbdXz08;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DKvEMi065319;
	Thu, 13 Oct 2022 15:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665694634;
	bh=ojn1WpLJiCkQZ7rYvFxCx4Wnzz9dlXv7mjU7KMQxiOM=;
	h=From:To:Subject:Date;
	b=XzbdXz08TiyHuLmT2WnwV+8JxMLPyIXBcTCjKG6InGQBJb0c760ovmY5CqxHLAwOq
	 2NXWYA9c/sFwgSoiq7gU45Fx+au3XWJjLfwDn4Ix0PSMKTEKo03fo6x+Rie9DdSAc9
	 7x7YPDsLhOVs/M1VU20s9UK/Mz+u/HBLhU1RSeU0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DKvE4q036302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 15:57:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 15:57:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 15:57:14 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DKvERm079684;
	Thu, 13 Oct 2022 15:57:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oj5GU-0007WR-1F; Thu, 13 Oct 2022 15:57:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3] trusted-firmware-a: work around RWX permission error on segment
Date: Thu, 13 Oct 2022 15:57:14 -0500
Message-ID: <20221013205714.28876-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:57:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15172

Binutils 2.39 now warns when a segment has RXW permissions[1]:

  aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX permissions

However, TF-A passes --fatal-warnings to LD, so this is a build failure.

There is a ticket filed upstream[2], so until that is resolved we can
disable this warning.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
[2] https://developer.trustedfirmware.org/T996

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>

Adapted from the above patch[3] in meta-arm, but we cannot use that patch as
we are on an older SRCREV and the Makefile has changed.

[3] https://git.yoctoproject.org/meta-arm/commit/meta-arm/recipes-bsp?id=977c5222d8c2f6f6c7e522e480a6e4cd40ba32d7

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Missing whitespace on append.
v2: Changed syntax on SRC_URI:append:k3 based on comments.


 .../files/rwx-segments-ti.patch               | 45 +++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
new file mode 100644
index 00000000..826a4b32
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments-ti.patch
@@ -0,0 +1,45 @@
+Binutils 2.39 now warns when a segment has RXW permissions[1]:
+
+aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
+permissions
+
+However, TF-A passes --fatal-warnings to LD, so this is a build failure.
+
+There is a ticket filed upstream[2], so until that is resolved just
+remove --fatal-warnings.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+[2] https://developer.trustedfirmware.org/T996
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+
+Adapted from the above patch in meta-arm, but we cannot use that patch as
+we are on an older SRCREV and the Makefile has changed.
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+
+
+diff --git a/Makefile b/Makefile
+index 3941f8698..13bbac348 100644
+--- a/Makefile
++++ b/Makefile
+@@ -421,7 +421,7 @@ TF_LDFLAGS		+=	$(TF_LDFLAGS_$(ARCH))
+ # LD = gcc (used when GCC LTO is enabled)
+ else ifneq ($(findstring gcc,$(notdir $(LD))),)
+ # Pass ld options with Wl or Xlinker switches
+-TF_LDFLAGS		+=	-Wl,--fatal-warnings -O1
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	-Wl,--gc-sections
+ ifeq ($(ENABLE_LTO),1)
+ 	ifeq (${ARCH},aarch64)
+@@ -439,7 +439,7 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ 
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=	--fatal-warnings -O1
++TF_LDFLAGS		+=	-O1
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 14463846..55fc3e29 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -6,6 +6,9 @@ TFA_BUILD_TARGET:k3 = "all"
 TFA_INSTALL_TARGET:k3 = "bl31"
 TFA_SPD:k3 = "opteed"
 
+SRC_URI:append:k3 = " file://rwx-segments-ti.patch"
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
-- 
2.17.1


