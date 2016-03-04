Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BA8CE00BEA; Fri,  4 Mar 2016 12:52:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC807E00BE2
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 12:52:15 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24KqEJc030000
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 14:52:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24KqEuX003869
	for <meta-ti@yoctoproject.org>; Fri, 4 Mar 2016 14:52:14 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 14:52:14 -0600
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u24KqDd4005449;	Fri, 4 Mar 2016 14:52:14 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 4 Mar 2016 15:52:11 -0500
Message-ID: <1457124731-13125-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1457124731-13125-1-git-send-email-jsobota@ti.com>
References: <1457124731-13125-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-xdctools: Update to verion 3.32.00.06
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
X-List-Received-Date: Fri, 04 Mar 2016 20:52:17 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb |    9 ---------
 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb

diff --git a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb b/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
deleted file mode 100644
index 5e970ee..0000000
--- a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-xdctools-core.inc
-
-PV = "3_31_02_38"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=9dbb0095cdb8b35508b344aa4f1de333"
-
-SRC_URI[xdczip.md5sum] = "c76b3d90c3e25d199765557e393d165b"
-SRC_URI[xdczip.sha256sum] = "c0e1f6911f2294bfb76471fac1a0ceac3e89c7eb1300f84d2571bf78cb62a7d2"
diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
new file mode 100644
index 0000000..fb0c123
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -0,0 +1,9 @@
+require recipes-ti/devtools/ti-xdctools-core.inc
+
+PV = "3_32_00_06"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=732d986a63b648562f3e658b1df43036"
+
+SRC_URI[xdczip.md5sum] = "93127f4c2f35d94b6c8e5a52b79c38ae"
+SRC_URI[xdczip.sha256sum] = "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f348e214a725d1e849bd39c7"
-- 
1.7.10.4


