Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4.1583433901620014292
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2020 10:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pBxUOKpN;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: tmannan@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 745FEE017D0; Thu,  5 Mar 2020 10:45:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC2C1E017CE
	for <meta-ti@yoctoproject.org>; Thu,  5 Mar 2020 10:45:00 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025Ij0Z4055345
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:45:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583433900;
	bh=UP6OpRFrmfQTpkJJgypwNd7IEzOn//cVarnb+G9bcoQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pBxUOKpN7WTpa/7AmMgHamVh1r8NtIqigJzDnS6kcoiGTJ0KwB3dRDUtb0d1j13fT
	 qcF6Q81x806UK48aWy6b9R0+u0OerTEBNI81d674q3Bwfj1wfY6N7tn+KO4XZENGtT
	 Hd34pxKdWfGH3bfTzkm6shA9nAJJCq48QbUSoBm0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025Ij02v014468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:45:00 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 12:45:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 12:45:00 -0600
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025IitSj116317
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:45:00 -0600
From: "Tinku Mannan" <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 2/2] nimu-icss: Adding k3 to COMPATIBLE_MACHINE list
Date: Thu, 5 Mar 2020 13:44:52 -0500
Message-ID: <1583433892-6323-3-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583433892-6323-1-git-send-email-tmannan@ti.com>
References: <1583433892-6323-1-git-send-email-tmannan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

---
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
index 02ddc47..7400adf 100644
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510be24d8a89d9d08b930994c"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1|k3"
 
 DEPENDS_append = " ti-ndk \
                    pruss-lld-rtos \
-- 
2.7.4

