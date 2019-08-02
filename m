Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6248E00EBE; Fri,  2 Aug 2019 11:00:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51723E00EB9
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 11:00:47 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72I0kAC033177
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564768846;
	bh=eRkkuF4rX3vd8vkfdR3a30Bharg972xeEkee2CRFxXg=;
	h=From:To:Subject:Date;
	b=IAKvZRFHmfBO8m/svtlQBMuoatj2dfqwQGQsS2+7XBg3RLVRbUrKFcgyp4Xa0XpDN
	JK1V1c/NMeYBOgXxOuqA+wdEFhjZNtEde+ZBBJ35dSLDO9u4XGmbHe+r3ElQC4il/M
	musrBC8wWkh44C9G4e+r0NP7tj8Ptq/MvimG+AT0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72I0kOQ114097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:00:46 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 13:00:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 13:00:46 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72I0kpf049981
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 13:00:46 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Aug 2019 14:00:43 -0400
Message-ID: <1564768843-22172-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-ndk: Update to 3.61.01.01
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
X-List-Received-Date: Fri, 02 Aug 2019 18:00:47 -0000
Content-Type: text/plain

Please note that the LIC_CHECKSUM due to date and version.
The License itself has not changed

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ndk/{ti-ndk_3.60.00.13.bb => ti-ndk_3.61.01.01.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/ndk/{ti-ndk_3.60.00.13.bb => ti-ndk_3.61.01.01.bb} (40%)

diff --git a/recipes-ti/ndk/ti-ndk_3.60.00.13.bb b/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
similarity index 40%
rename from recipes-ti/ndk/ti-ndk_3.60.00.13.bb
rename to recipes-ti/ndk/ti-ndk_3.61.01.01.bb
index 700ad7d..f120f2f 100644
--- a/recipes-ti/ndk/ti-ndk_3.60.00.13.bb
+++ b/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
@@ -1,12 +1,12 @@
 require ti-ndk.inc
 
-PV = "3_60_00_13"
+PV = "3_61_01_01"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=6d1d16547344a4418e565586fa45b458"
+LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=871c716abcf52bac5a7c23154eaba3b6"
 
-SRC_URI[ndkzip.md5sum] = "cc1bbe67b46bd02c4a423814360a4e00"
-SRC_URI[ndkzip.sha256sum] = "86407d4b423419e020b38a44d1a61705fdec0ae0d5e35eb07b99fcfe5ceee7dd"
+SRC_URI[ndkzip.md5sum] = "87f0494c9faee344fe93ae68e71ca189"
+SRC_URI[ndkzip.sha256sum] = "3bfca50367432603ebc1d53d9185302bb4fa4558ac766696f086dc7a5a2ccd29"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


