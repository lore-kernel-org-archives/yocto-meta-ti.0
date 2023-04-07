Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7804C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:51:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5444.1680868284243717656
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 04:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YdKpnS5a;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 337BpN1o014415
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680868283;
	bh=ug6LJWEsmqxNQKqiEZAypGkFMYY+CMrAVvPbDu8jkuo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YdKpnS5aooPNsdecQIVLZQ8ji8olpXGp8Rss6yJMnPszJ//Wq/Bm/9CKjzcYlriM6
	 yrIl0zvk5wZT2GTgb2CkoKUBccnVRzTz2GvydQ5SvPbteUN4DEhfoUqR4Y/SwINDXv
	 Y0qXp8+1XFkxjEL8hqPhTMbpf7ZPDOTKk5lJvRLs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 337BpNLK018245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 7
 Apr 2023 06:51:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 7 Apr 2023 06:51:23 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 337BpDVe035857;
	Fri, 7 Apr 2023 06:51:22 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH 4/4] meta-ti-bsp: conf: machine: j7200: Update def config
Date: Fri, 7 Apr 2023 17:21:07 +0530
Message-ID: <20230407115107.839204-5-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407115107.839204-1-u-kumar1@ti.com>
References: <20230407115107.839204-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 11:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16324

u-boot 2023.04 merged def configs for HS and GP EVM into one.
This patch updates config for J7200 HS EVM for both A72 and R5.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
index a4d51904..58cd92c4 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
@@ -8,4 +8,4 @@ SYSFW_SOC = "j721s2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-UBOOT_MACHINE = "j721s2_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 7ce5000a..7d2d6271 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -15,7 +15,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
-UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
+UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
-- 
2.34.1


