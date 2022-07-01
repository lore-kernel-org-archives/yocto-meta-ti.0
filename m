Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ACACCA47F
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 22:02:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.44379.1656712952405733715
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 15:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pKOtSJ63;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261M2VN6053418;
	Fri, 1 Jul 2022 17:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656712951;
	bh=qn+vEtShnQj+KA1SuUEx04j/+OoUhYMj6hd0gv4xh3Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pKOtSJ63YHFgEW1+AsWMyg/i+b+n9uQDhAaTQ2yBMF7aJJgHcLUXUL2hs/n6VLtxg
	 qQN2DXqLjwL6hi+kD4a8cOlurzfpmXszhki+01V4wRm+SjG7mfg0q3ulCptSGeilR+
	 FHWvJauTN+Tq6n+bwiNXA3oB3mpox2pHdxyBVJ5E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261M2V4Q017553
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 17:02:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 17:02:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 17:02:31 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261M2SS9029974;
	Fri, 1 Jul 2022 17:02:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][RFC 6/6] ti-sci-fw: Deploy GP version of
 tiboot3.bin with HS SDK
Date: Fri, 1 Jul 2022 17:02:28 -0500
Message-ID: <20220701220228.5449-7-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701220228.5449-1-afd@ti.com>
References: <20220701220228.5449-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Jul 2022 22:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14864

This allows users of the HS SDK to run on GP EVMs. This file
can be used instead of the HS default.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-hs-evm.conf        |  2 ++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index ebbe2e62..85c5325b 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -18,4 +18,6 @@ SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
 
+IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
+
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 1b2ea184..c96078e6 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -69,6 +69,11 @@ do_compile() {
 	oe_runmake
 }
 
+do_compile_prepend_am64xx-hs-evm-k3r5() {
+	cd ${WORKDIR}/imggen/
+	oe_runmake SOC_TYPE=gp
+}
+
 do_install() {
 	install -d ${D}/boot
 
@@ -86,6 +91,10 @@ do_install() {
 	fi
 }
 
+do_install_append_am64xx-hs-evm-k3r5() {
+	install -m 644 ${WORKDIR}/imggen/tiboot3-${SYSFW_SOC}-gp-${SYSFW_CONFIG}.bin ${D}/boot/tiboot3-${SYSFW_SOC}-gp-${SYSFW_CONFIG}.bin
+}
+
 FILES_${PN} = "/boot"
 
 inherit deploy
@@ -109,4 +118,8 @@ do_deploy () {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_deploy_append_am64xx-hs-evm-k3r5() {
+	install -m 644 ${WORKDIR}/imggen/tiboot3-${SYSFW_SOC}-gp-${SYSFW_CONFIG}.bin ${DEPLOYDIR}/tiboot3-${SYSFW_SOC}-gp-${SYSFW_CONFIG}.bin
+}
+
 addtask deploy before do_build after do_compile
-- 
2.36.1


