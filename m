Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BBEBE0088B; Mon,  7 Mar 2016 10:36:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCF04E00833
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 10:36:19 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u27IaIjF000700
	for <meta-ti@yoctoproject.org>; Mon, 7 Mar 2016 12:36:18 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27IaILt015639
	for <meta-ti@yoctoproject.org>; Mon, 7 Mar 2016 12:36:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Mar 2016 12:36:18 -0600
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u27IaGDe028029;	Mon, 7 Mar 2016 12:36:18 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 7 Mar 2016 13:36:14 -0500
Message-ID: <1457375774-27214-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1457375774-27214-1-git-send-email-jsobota@ti.com>
References: <1457375774-27214-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] ti-xdctools: Update to verion 3.32.00.06
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
X-List-Received-Date: Mon, 07 Mar 2016 18:36:21 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
V2 Changes: Removed old version and submitted with -C01 so new version is detected as copy of old

 .../{ti-xdctools_3.31.02.38.bb => ti-xdctools_3.32.00.06.bb} |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.31.02.38.bb => ti-xdctools_3.32.00.06.bb} (22%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
similarity index 22%
rename from recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
rename to recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
index 5e970ee..fb0c123 100644
--- a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -1,9 +1,9 @@
-require ti-xdctools-core.inc
+require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_31_02_38"
+PV = "3_32_00_06"
 PR = "r0"
 
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=9dbb0095cdb8b35508b344aa4f1de333"
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=732d986a63b648562f3e658b1df43036"
 
-SRC_URI[xdczip.md5sum] = "c76b3d90c3e25d199765557e393d165b"
-SRC_URI[xdczip.sha256sum] = "c0e1f6911f2294bfb76471fac1a0ceac3e89c7eb1300f84d2571bf78cb62a7d2"
+SRC_URI[xdczip.md5sum] = "93127f4c2f35d94b6c8e5a52b79c38ae"
+SRC_URI[xdczip.sha256sum] = "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f348e214a725d1e849bd39c7"
-- 
1.7.10.4


