Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28051E00E3F; Thu, 21 Dec 2017 09:16:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81F59E00E14
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 09:16:07 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBLHG6o9015150
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:16:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513876566;
	bh=gSffXDPgKEE1cmTT7yH0aFRC5UkpL1jzF2IqBO7gL/A=;
	h=From:To:Subject:Date;
	b=Icj//slOqdbp7s88EJzfYj3L5atLsLjoYkuP6eYuKk9K7khw/j7369YUpmTD/iJ5A
	FJ15WN/df79QGJFVAoWp3M2du3uJ/simxUcfuYXZR7VnqwFIyaLWWvGNa+LuCY5ppr
	rGq8zC2YVTg9IQ6WuXyfSsNgM/Zrx5WDZXMmbF8w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLHG6bm019448
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:16:06 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 21 Dec 2017 11:16:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 21 Dec 2017 11:16:04 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLHG4UT016910
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:16:04 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Dec 2017 12:15:59 -0500
Message-ID: <1513876559-10855-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2] ti-ndk: Updating to version 2.26.00.08
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
X-List-Received-Date: Thu, 21 Dec 2017 17:16:08 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Re-submitting the patch with -M -C01 option

 recipes-ti/ndk/{ti-ndk_2.25.01.11.bb => ti-ndk_2.26.00.08.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-ti/ndk/{ti-ndk_2.25.01.11.bb => ti-ndk_2.26.00.08.bb} (31%)

diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
similarity index 31%
rename from recipes-ti/ndk/ti-ndk_2.25.01.11.bb
rename to recipes-ti/ndk/ti-ndk_2.26.00.08.bb
index d5d926b..e587bf9 100644
--- a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
+++ b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
@@ -1,12 +1,12 @@
 require ti-ndk.inc
 
-PV = "2_25_01_11"
+PV = "2_26_00_08"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=80a8d9b76cf700929d3f5b6df09052d6"
+LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=e2a7d40cf1e7207ac3dd6d993d71ee8c"
 
-SRC_URI[ndkzip.md5sum] = "e42bfcc8c3a6d183d60f26ec01ccc79b"
-SRC_URI[ndkzip.sha256sum] = "a15bc9b570dc0628dd8b8c3665037a162610a6f86c5f17ebb6a329d3db60f071"
+SRC_URI[ndkzip.md5sum] = "09c7ffaff305f3083d15c0a0db73d781"
+SRC_URI[ndkzip.sha256sum] = "5b22c6b8bfbf3a22c53f52bf880d5cf49daf386716942a4202569521bb30f4a8"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.9.1


