Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67BEC7EE2C
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:42:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.26996.1684255348127782235
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XWGIvDrI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgQMs067634;
	Tue, 16 May 2023 11:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255346;
	bh=/JlqHjhp06Ndx1reINUK0idhn4L7api5vAM2Vv3t3dY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XWGIvDrIVmKJ8nrUAS1hu4aUnLshBFyiBVdiZl7lLa/vllrdctqSYAcffA8naVo0S
	 SycoITb3bo0bqUu1eGfMlqSUr4WqarfQ6fn0REa1+6VjGbKrh7AxRjXXjTdD4YPaai
	 Murtk9WWxIkKVEjAsx2mj1s/7xfIetpS/7AHMTzI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGgQQc007071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:42:26 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:42:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:42:25 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgP55031084;
	Tue, 16 May 2023 11:42:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxkn-0003DW-NX; Tue, 16 May 2023 11:42:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 2/8] meta-ti-bsp: conf: machine: j721s2: Update def config
Date: Tue, 16 May 2023 11:42:19 -0500
Message-ID: <20230516164225.12311-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164225.12311-1-reatmon@ti.com>
References: <20230516164225.12311-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 16:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16540

From: Udit Kumar <u-kumar1@ti.com>

u-boot 2023.04 merged def configs for HS and GP EVM into one.
This patch updates config for J721S2 HS EVM for both A72 and R5.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
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
index 190810ce..6a58a687 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -17,7 +17,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
 "
 
-UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
+UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
-- 
2.17.1


