Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.5.1583433901458330806
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2020 10:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LQzMLOkS;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: tmannan@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E036E017D2; Thu,  5 Mar 2020 10:45:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 131C5E017CF
	for <meta-ti@yoctoproject.org>; Thu,  5 Mar 2020 10:44:58 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025IiwhQ130553
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:44:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583433898;
	bh=Wl2e+0BGopvjCD4YWU3tBnBEkCRC9pqFN8gRfYeeg54=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LQzMLOkSgeQ6hwAVJdIpgj2jJehQZIo7nkSi4EXIiaLZ+ByTeVqdiP0O8dJhy/XEJ
	 p30qMosV7OdbFHLqoBlhkpFozHvZFFRUV6BzHWgZa8jbgspUEBsxZpf8P7jmbu0G3b
	 mXLg+KQOX3BeuexZxl9n8FjrBvIYLyz1F3/slBBo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025IiwDK014449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:44:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 12:44:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 12:44:58 -0600
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025IitSi116317
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:44:58 -0600
From: "Tinku Mannan" <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 1/2] icss-emac-lld: Adding k3 to COMPATIBLE_MACHINE list
Date: Thu, 5 Mar 2020 13:44:51 -0500
Message-ID: <1583433892-6323-2-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583433892-6323-1-git-send-email-tmannan@ti.com>
References: <1583433892-6323-1-git-send-email-tmannan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index 4809e1f..db205a9 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=76cafd87d8495b42c2355f7681de15a2"
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit ti-pdk-fetch
@@ -10,5 +10,5 @@ TI_PDK_COMP = "ti.drv.icss_emac"
 
 PE = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
-- 
2.7.4

