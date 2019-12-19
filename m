Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.10925.1576769685823687884
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2019 07:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jDXH1KqN;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69841E0091A; Thu, 19 Dec 2019 07:34:45 -0800 (PST)
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
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A87BBE0078F
	for <meta-ti@yoctoproject.org>; Thu, 19 Dec 2019 07:34:44 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJFYiTZ008328
	for <meta-ti@yoctoproject.org>; Thu, 19 Dec 2019 09:34:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576769684;
	bh=FW/jGDonlKTHvp/gtQpFODGdwYy2NDb/fTSxD60cNHQ=;
	h=From:To:Subject:Date;
	b=jDXH1KqN+9RUKkdfyX9v/Nb84QtGZ1DMmDPZFjpXKLrKjIRBs2WOX3LxlvUALABy9
	 y601LvbdYCbKwuykH+15yj4M1i3AriLqbpqUUQN2q5ZBQC+IYJBNReYg0YIkrBVPjR
	 gyFaxXXMWBbpkHiKtPdBn6Pmp5863sWkuL1DVZkg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJFYiPA080300
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 19 Dec 2019 09:34:44 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 09:34:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 09:34:42 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJFYgh2041085
	for <meta-ti@yoctoproject.org>; Thu, 19 Dec 2019 09:34:42 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH] ti-sysbios: Sysbios update to 6.76.03.01
Date: Thu, 19 Dec 2019 10:34:40 -0500
Message-ID: <1576769680-34227-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.76.02.02.bb                  | 15 ---------------
 ...{ti-sysbios_6.75.02.00.bb => ti-sysbios_6.76.03.01.bb} |  6 +++---
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-sysbios_6.76.02.02.bb
 rename recipes-ti/bios/{ti-sysbios_6.75.02.00.bb => ti-sysbios_6.76.03.01.bb} (68%)

diff --git a/recipes-ti/bios/ti-sysbios_6.76.02.02.bb b/recipes-ti/bios/ti-sysbios_6.76.02.02.bb
deleted file mode 100644
index c7acf8e..0000000
--- a/recipes-ti/bios/ti-sysbios_6.76.02.02.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require recipes-ti/bios/ti-sysbios.inc
-
-PV = "6_76_02_02"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
-
-SRC_URI[sysbiosbin.md5sum] = "7ae35f34179492913e40f02ec5ffb7dd"
-SRC_URI[sysbiosbin.sha256sum] = "029981f79ce61fe28241944f4f60c37b2c4b8c83fe1ee38ed400d58412b4fdb6"
-
-TI_BIN_UNPK_CMDS = ""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-
-BINFILE = "bios_${PV}.run"
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exports/${BINFILE};name=sysbiosbin"
diff --git a/recipes-ti/bios/ti-sysbios_6.75.02.00.bb b/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
similarity index 68%
rename from recipes-ti/bios/ti-sysbios_6.75.02.00.bb
rename to recipes-ti/bios/ti-sysbios_6.76.03.01.bb
index 553d43e..8ebe2f3 100644
--- a/recipes-ti/bios/ti-sysbios_6.75.02.00.bb
+++ b/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
@@ -1,12 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_75_02_00"
+PV = "6_76_03_01"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
 
-SRC_URI[sysbiosbin.md5sum] = "8bca751d3054e74b9edb510a0d099095"
-SRC_URI[sysbiosbin.sha256sum] = "c92cb72f86656b1e37454e238e9838f301eeeb4d711a0f4a84089ef80ccb6013"
+SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
+SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1

