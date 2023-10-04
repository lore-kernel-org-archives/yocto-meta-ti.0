Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EB9E8FDD0
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 06:34:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12578.1696401294105641280
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 23:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iUQtXEbb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3946YrQU078602
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696401293;
	bh=CV4FAmOe0vhq8nX7kQgy8Q2CLDWth2BvfcxUFU4wvGM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iUQtXEbbdz+kMGo+clBK/PRkILpMBaLAQSDZCTNM5+TQzrYNhYn82GsJ++rlRoveJ
	 D9WYOkYwx2zOHsI1iNDCHd5Ie8WkI8CGkpz3ZLT2WEB5aWZfmmiSDn1nmMemy3rPex
	 HvZn2Uvt58BEs/o+GsgtYIQIWoWNlbH8vHYNkyGQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3946Yr9T009699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:34:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 01:34:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 01:34:52 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3946Yn19024388;
	Wed, 4 Oct 2023 01:34:51 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Deploy the fw binaries to the deploy directory
Date: Wed, 4 Oct 2023 12:04:29 +0530
Message-ID: <20231004063430.703304-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004063430.703304-1-a-limaye@ti.com>
References: <20231004063430.703304-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 06:34:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17048

Deploy the sysfw binaries to the DEPLOYDIR, to be picked up by the
tisdk-core-bundle... for the prebuilt binaries directory

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index ab9356b6..801c8768 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,5 +1,7 @@
 SUMMARY = "TI SYSFW/TIFS Firmware"
 
+inherit deploy
+
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 COMPATIBLE_MACHINE = "k3r5"
@@ -23,3 +25,12 @@ do_install() {
 }
 
 FILES:${PN} = "${nonarch_base_libdir}/firmware"
+
+do_deploy() {
+	install -d ${DEPLOYDIR}/ti-sysfw
+	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
+	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sysfw
+	install -m 644 ${S}/ti-sysfw/ti-fs-stub-firmware-* ${DEPLOYDIR}/ti-sysfw
+}
+
+addtask deploy before do_build after do_compile
-- 
2.34.1


