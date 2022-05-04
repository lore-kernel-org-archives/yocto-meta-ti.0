Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54920C43217
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 21:38:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3432.1651700328859437361
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 14:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pOvaBksD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244LcjXT033261;
	Wed, 4 May 2022 16:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651700325;
	bh=xhPSgMHfZBCQoNf24JQrKv/jFHYa5MZSYPpnTT+BByI=;
	h=From:To:Subject:Date;
	b=pOvaBksDvmzrw6tWSJ1cXTfAbnavRPBDG1ixHV87Qb49wx4hYXm8fzh5DcW4gMQjC
	 17+NzOPsDNvrSLpLAU6q95aR1CI/DspzBRQzxi8x3OoNdy7vzVohUFs7Zb30dyNZJe
	 Jz4v4NrxWzTvqAe23b0kPbqphQo1Po90FwQ8iPdM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244LcjB2051352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 16:38:45 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 16:38:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 16:38:44 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244Lcibm124513;
	Wed, 4 May 2022 16:38:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmMho-0005jO-G9; Wed, 04 May 2022 16:38:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] recipes-bsp: tifs-lpm-stub: Introduce new
 recipe
Date: Wed, 4 May 2022 16:38:44 -0500
Message-ID: <20220504213844.20764-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 21:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14692

This firmware stub is required by the TI foundational security
software while transitioning to low power mode.

Add a recipe for this compatible with am62xx-evm

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 24 +++++++++++++++++++
 recipes-kernel/linux/kernel-rdepends.inc      |  4 ++++
 3 files changed, 29 insertions(+)
 create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 3ebdae30..47e76347 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -18,6 +18,7 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
+TIFS_LPM_STUB_FW_VERSION = "08.03.02"
 
 TI_LINUX_FW_SRCREV ?= "917625c2721eef8677df9e47d919005b0d4f93aa"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
new file mode 100644
index 00000000..642a8d3a
--- /dev/null
+++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "TI Foundational security Low Power Management Stub"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${TIFS_LPM_STUB_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am62xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = "ti-fs-stub-firmware-am62x-gp-signed.bin"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-sysfw/
+	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${base_libdir}/firmware/ti-sysfw/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 522d9674..17aee4c2 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -45,3 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
 
 # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
+
+# Add run-time dependency for TIFS Low Power Module stub
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
+
-- 
2.17.1


