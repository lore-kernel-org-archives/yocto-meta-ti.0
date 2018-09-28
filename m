Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFD69E00A9A; Fri, 28 Sep 2018 09:26:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9182E009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQc6W058416
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151998;
	bh=UGrpROpESZgIM1u607Ep5OjJH6/UoTUym7QHDvGTQXw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kv0xvqnwGkw2m9B5pSrR8lb7S3tp6cMZp338wL3Bfks9Uxm31lN9O6mihnZNc7t6V
	/NhPG9ytdbbZfYowtPcLEzpPh1jHovnFwkvcj3Unhe3bg+2dqX4E2uoVGpiETUKEhL
	xfOYGkTGDzU+Kac0tLLkW9V3txFWn55H2Pjmj0hs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQcXo000761
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:38 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:38 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMd011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:38 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:28 -0400
Message-ID: <1538151990-44823-28-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 27/29] ti-ndk: Upgrading to 3.40.01.01
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ndk/{ti-ndk_2.26.00.08.bb => ti-ndk_3.40.01.01.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/ndk/{ti-ndk_2.26.00.08.bb => ti-ndk_3.40.01.01.bb} (31%)

diff --git a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
similarity index 31%
rename from recipes-ti/ndk/ti-ndk_2.26.00.08.bb
rename to recipes-ti/ndk/ti-ndk_3.40.01.01.bb
index e587bf9..4a494b1 100644
--- a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
+++ b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
@@ -1,12 +1,12 @@
 require ti-ndk.inc
 
-PV = "2_26_00_08"
+PV = "3_40_01_01"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=e2a7d40cf1e7207ac3dd6d993d71ee8c"
+LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=9ddeee8ab01c13f593e6d085cca46b6a"
 
-SRC_URI[ndkzip.md5sum] = "09c7ffaff305f3083d15c0a0db73d781"
-SRC_URI[ndkzip.sha256sum] = "5b22c6b8bfbf3a22c53f52bf880d5cf49daf386716942a4202569521bb30f4a8"
+SRC_URI[ndkzip.md5sum] = "bbbef445f2d2f84f9bee5d297f77d397"
+SRC_URI[ndkzip.sha256sum] = "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f77304f14f0359cbc7b3f4b8"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


