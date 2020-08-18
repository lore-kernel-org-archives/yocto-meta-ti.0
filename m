Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.65773.1597756209956726158
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 06:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RFJoqVqx;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F390E02031; Tue, 18 Aug 2020 06:10:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41D8BE01FC9
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 06:10:08 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IDA7Sj046113
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 08:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597756207;
	bh=ll/ACuuBo3G1ihz5UvublEasU3oOIOUFvkAFPK9yEAg=;
	h=From:To:CC:Subject:Date;
	b=RFJoqVqxzhh8bxWj4ARCxRCbdmdPfmWni9ZgiknIN6txPeQajZqI+v8bpnNYu7w7Z
	 GeKVADdrEkbrgj7O//hxZFyBifS3L+T64Wum/h+dnFjxzSc91kINfBihF3pRaKxO70
	 H4Lb9uAtLNCfRJiWEF3qUwYulvT3S4mg3M/Q3PG8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IDA75o067095
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 08:10:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 08:10:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 08:10:07 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IDA45n080652;
	Tue, 18 Aug 2020 08:10:05 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Add support for machine j7200-evm
Date: Tue, 18 Aug 2020 18:40:00 +0530
Message-ID: <20200818131000.11917-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Initialize the cell names and console for the j7200-evm machine

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 8f5e50b6..1011f286 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -47,14 +47,17 @@ JH_CELL_FILES_k3 ?= "k3-*.cell"
 JH_INMATE_DTB ?= ""
 JH_INMATE_DTB_am65xx ?= "inmate-k3-am654-idk.dtb"
 JH_INMATE_DTB_j7 ?= "inmate-k3-j721e-evm.dtb"
+JH_INMATE_DTB_j7200-evm ?= "inmate-k3-j7200-evm.dtb"
 
 JH_LINUX_DEMO_CELL ?= ""
 JH_LINUX_DEMO_CELL_am65xx ?= "k3-am654-idk-linux-demo.cell"
 JH_LINUX_DEMO_CELL_j7 ?= "k3-j721e-evm-linux-demo.cell"
+JH_LINUX_DEMO_CELL_j7200-evm ?= "k3-j7200-evm-linux-demo.cell"
 
 JH_SYSCONFIG_CELL ?= ""
 JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
 JH_SYSCONFIG_CELL_j7 ?= "k3-j721e-evm.cell"
+JH_SYSCONFIG_CELL_j7200-evm ?= "k3-j7200-evm.cell"
 
 INITRAMFS_IMAGE ?= ""
 JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
@@ -62,6 +65,7 @@ JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
 JH_CMDLINE ?= ""
 JH_CMDLINE_am65xx ?= "console=ttyS1,115200n8"
 JH_CMDLINE_j7 ?= "console=ttyS3,115200n8"
+JH_CMDLINE_j7200-evm ?= "console=ttyS3,115200n8"
 
 do_configure() {
 	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
-- 
2.17.1

