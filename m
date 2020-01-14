Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2474.1579030231496167496
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jan 2020 11:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MM+qpP1C;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 113A5E014DC; Tue, 14 Jan 2020 11:30:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D376CE014DB
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2020 11:30:27 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00EJURrp074080
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2020 13:30:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579030227;
	bh=Fare15emEcj4u6rewcAqaklDlUi5nVDnbycaz8O+k6M=;
	h=From:To:Subject:Date;
	b=MM+qpP1Ct8OEoh7GlaGq32bSMJPzcshiZy5/E/qZgLufIDkzU7m9znn7Bw8v2m1Jl
	 EQFHT4+pQNmHEOVm+iz8Aul/bfH0lBtVJyMIEeoyct0SlOhRRzi94ewnMLTddfwZsx
	 E3210gvmnRXRkpdQmzoBF1gsxVWnYsfHKCEkOWcc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00EJURLA045814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2020 13:30:27 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 14
 Jan 2020 13:30:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 14 Jan 2020 13:30:26 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00EJUQ8H040259
	for <meta-ti@yoctoproject.org>; Tue, 14 Jan 2020 13:30:26 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH] ti-sysbiois: Sysbiois update to 6.76.04.02
Date: Tue, 14 Jan 2020 14:30:24 -0500
Message-ID: <1579030224-30728-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

---
 .../bios/{ti-sysbios_6.76.03.01.bb => ti-sysbios_6.76.04.02.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.76.03.01.bb => ti-sysbios_6.76.04.02.bb} (68%)

diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bios/ti-sysbios_6.76.04.02.bb
similarity index 68%
rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to recipes-ti/bios/ti-sysbios_6.76.04.02.bb
index 8ebe2f3..e7b85e5 100644
--- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/recipes-ti/bios/ti-sysbios_6.76.04.02.bb
@@ -1,12 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_76_03_01"
+PV = "6_76_04_02"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
 
-SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
-SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
+SRC_URI[sysbiosbin.md5sum] = "9766b12ea6dd4b3a035cdb6be54c5071"
+SRC_URI[sysbiosbin.sha256sum] = "d68ca3ba862f8f83a5bf7084af326ffa9fcb64e39c866f98384d87c0ceca29be"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.9.1

