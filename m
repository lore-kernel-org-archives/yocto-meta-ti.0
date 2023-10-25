Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B71C25B6F
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:56:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.178849.1698252995901987809
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uvoBiPHL;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuY57024127;
	Wed, 25 Oct 2023 11:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698252994;
	bh=fV70rfmPuVlo0paj1hhRM/hUMA/w98iXoVL+dFJ+knA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uvoBiPHLr7HubYhNdeWLyKT6AvyUVcs8Uu/jIEjLmQN1IBUgBp++kiJoH9bkizmUm
	 CaiD2nkHk1kck2zjJpnA59SzK5qlN6qt9Y6wkne+2uy+dK0Zkga5ja8Ml7s8+5W22q
	 4/GfNw4NokmCF3b63aXUevGTsSKbqc88DS2FM5VQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGuYpT016786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:34 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:34 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVEU008415;
	Wed, 25 Oct 2023 11:56:34 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 7/8] recipes-bsp: Do not inherit deploy in recipes that do not deploy anything
Date: Wed, 25 Oct 2023 11:56:29 -0500
Message-ID: <20231025165630.2274889-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025165630.2274889-1-afd@ti.com>
References: <20231025165630.2274889-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:56:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17190

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb     | 1 -
 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 1 -
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb             | 1 -
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 3feca08c..5b1d8be1 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -2,7 +2,6 @@ SUMMARY = "Chips&Media codec firmware files"
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
-inherit deploy
 inherit update-alternatives
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index cf26eb2d..6e2996ce 100755
--- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
 PV = "6.2+git${SRCPV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit deploy
 inherit update-alternatives
 
 PROTOCOL = "https"
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index b844eb38..9532078b 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -9,7 +9,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-inherit deploy
 inherit update-alternatives
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index bde206f0..f1967f7f 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -9,7 +9,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-inherit deploy
 inherit update-alternatives
 
 PLAT_SFX = ""
-- 
2.39.2


