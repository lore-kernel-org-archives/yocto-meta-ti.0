Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.876.1585263207926462493
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2020 15:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DmuB6f7Z;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F9FBE018E2; Thu, 26 Mar 2020 15:53:27 -0700 (PDT)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A80A7E018AB
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2020 15:53:26 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02QMrPvY078376
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2020 17:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585263205;
	bh=aj97ll65GAMqsPodvNISPFSDtb3GlttDnRAhQbotqW8=;
	h=From:To:Subject:Date;
	b=DmuB6f7Zhwhe8WcfjE9y+EEx0i4h1ELDFEYLBxlTwJey/R74Vf6mQjnHkmmqTtJ//
	 60ZJ/1I5LbxJUzQCiYQ1QITpd61LaEyPqXs1paDgpskSc4J5OPVDYW8koUa5w9trON
	 s58UNJyGG/j3lAdGNtm9ysfzgOLFk8J9kjLTw3Do=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02QMrPj5129480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2020 17:53:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 26
 Mar 2020 17:53:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 26 Mar 2020 17:53:25 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02QMrPCW085690
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2020 17:53:25 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/master][PATCH v2] sciclient-rtos: Specifying HS_BUILD=yes for am65xx-evm-hs targets
Date: Thu, 26 Mar 2020 18:53:23 -0400
Message-ID: <20200326225323.54647-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index d14c4a12..74a64c1c 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -25,6 +25,10 @@ SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
 export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
 
+BUILD_HS = ""
+BUILD_HS_am65xx-hs-evm = "yes"
+export BUILD_HS
+
 # Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
 TI_PDK_LIMIT_CORES_append_am65xx = " mcu1_1"
 
-- 
2.17.1

