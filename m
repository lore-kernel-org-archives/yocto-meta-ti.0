Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517F9CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:30:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18600.1697131818088757445
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tCHsyHdu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CHUHPp050801
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697131817;
	bh=9aYZ73k2zirb1qzOr2kZFNOcVFqRMcq6vGNkXT+XlR4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tCHsyHdunbWG9/BncJNPED8JWHXAsooUVfu7owzkhIBZCWhrd+OR82iHplV9d+RNB
	 LqP0rQh6Ffsrpysp7pDls/zxvw+CXfYgk+jEfnpY/3u9ce6X0Dx+e1k4sQHCuFoqHs
	 l/DQW5kx4vL6WJz+q3MmMHGuk5MUzNMkZ7thLark=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CHUHxa113027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:30:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 12:30:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 12:30:17 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CHU545065173;
	Thu, 12 Oct 2023 12:30:15 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <d-gole@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <vigneshr@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove COMPATIBLE_MACHINE and extend recipe to k3 machines
Date: Thu, 12 Oct 2023 22:59:46 +0530
Message-ID: <20231012172947.1359231-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012172947.1359231-1-a-limaye@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:30:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17097

Revert ebcf15bf0f31208e87ce60a4696e585940b46777 :
  "recipes-bsp:ti-sci-fw: Add k3r5 as COMPATIBLE_MACHINE"

Extend recipe to k3 machines too, to provide ti-fs-stub-* firmware
for u-boot aarch64 build.

Update do_deploy() to allow multiconfig builds for k3 machines

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 801c8768..2ad93a5d 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -4,7 +4,6 @@ inherit deploy
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-COMPATIBLE_MACHINE = "k3r5"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CFLAGS[unexport] = "1"
@@ -26,7 +25,10 @@ do_install() {
 
 FILES:${PN} = "${nonarch_base_libdir}/firmware"
 
-do_deploy() {
+do_deploy(){
+}
+
+do_deploy:k3r5() {
 	install -d ${DEPLOYDIR}/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${DEPLOYDIR}/ti-sysfw
 	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${DEPLOYDIR}/ti-sysfw
-- 
2.34.1


