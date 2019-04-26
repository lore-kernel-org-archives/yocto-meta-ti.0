Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90765E00D1E; Fri, 26 Apr 2019 15:33:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AEB8E00B58
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2019 15:33:25 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3QMXP5t014620
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2019 17:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556318005;
	bh=iydP33clKO46htVDp0RrBv7XfQcMxo0+5pbNLLv2q9Y=;
	h=From:To:Subject:Date;
	b=Xg+EAf4rX9Qq+C6Ckafc6iPyheN9TYXbkH+Kb/m4suCJQxUr8qDNhp8EjhhQDKAJE
	hGJU7DWO3IJii7eO+SfFmsSqBgbBB2QSwGM/0/EETBLS+PB6hvX7XAc+yWHk/VK2fp
	n5ASf+YiuWWE0lRi20xQ323+jTlVB/lWM6n2X+kM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3QMXPP7123630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2019 17:33:25 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 26 Apr 2019 17:33:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 26 Apr 2019 17:33:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3QMXOYm003095
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2019 17:33:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 26 Apr 2019 18:33:12 -0400
Message-ID: <1556317992-39388-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-ndk: Upgrade to 3.60.00.13
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2019 22:33:26 -0000
Content-Type: text/plain

The checksum changed due to version & year. The license itself remains
unchanged
---
 recipes-ti/ndk/{ti-ndk_3.40.01.01.bb => ti-ndk_3.60.00.13.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/ndk/{ti-ndk_3.40.01.01.bb => ti-ndk_3.60.00.13.bb} (31%)

diff --git a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb b/recipes-ti/ndk/ti-ndk_3.60.00.13.bb
similarity index 31%
rename from recipes-ti/ndk/ti-ndk_3.40.01.01.bb
rename to recipes-ti/ndk/ti-ndk_3.60.00.13.bb
index 4a494b1..20bc7c0 100644
--- a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
+++ b/recipes-ti/ndk/ti-ndk_3.60.00.13.bb
@@ -1,12 +1,12 @@
 require ti-ndk.inc
 
-PV = "3_40_01_01"
+PV = "3_60_00_13"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=9ddeee8ab01c13f593e6d085cca46b6a"
+LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=6d1d16547344a4418e565586fa45b458"
 
-SRC_URI[ndkzip.md5sum] = "bbbef445f2d2f84f9bee5d297f77d397"
-SRC_URI[ndkzip.sha256sum] = "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f77304f14f0359cbc7b3f4b8"
+SRC_URI[ndkzip.md5sum] = "cc1bbe67b46bd02c4a423814360a4e00"
+SRC_URI[ndkzip.sha256sum] = "86407d4b423419e020b38a44d1a61705fdec0ae0d5e35eb07b99fcfe5ceee7dd"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


