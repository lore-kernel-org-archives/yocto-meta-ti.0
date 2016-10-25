Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6ECFEE00C18; Tue, 25 Oct 2016 16:49:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 332AFE00B93
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 16:49:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PNnWq2025074
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 18:49:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PNnWaH014979
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 18:49:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 18:49:31 -0500
Received: from uda0868762.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9PNnUDQ023571;	Tue, 25 Oct 2016 18:49:31 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Oct 2016 18:49:20 -0500
Message-ID: <1477439360-19677-2-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1477439360-19677-1-git-send-email-i-pang@ti.com>
References: <1477439360-19677-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-xdctools: updated version to 3.32.1.22
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
X-List-Received-Date: Tue, 25 Oct 2016 23:49:36 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb | 9 ---------
 recipes-ti/devtools/ti-xdctools_3.32.01.22.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.32.01.22.bb

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
deleted file mode 100644
index 19bbe5d..0000000
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-ti/devtools/ti-xdctools-core.inc
-
-PV = "3_32_00_06"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
-
-SRC_URI[xdczip.md5sum] = "93127f4c2f35d94b6c8e5a52b79c38ae"
-SRC_URI[xdczip.sha256sum] = "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f348e214a725d1e849bd39c7"
diff --git a/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
new file mode 100644
index 0000000..5f379c1
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
@@ -0,0 +1,9 @@
+require recipes-ti/devtools/ti-xdctools-core.inc
+
+PV = "3_32_01_22"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
+
+SRC_URI[xdczip.md5sum] = "ddae5b765ca62783c1e804c75c463c38"
+SRC_URI[xdczip.sha256sum] = "b1c6620ef0b8eac45ef6a587f93b3238bdcf3b02dfd7e4b40d872a45c02c5cdc"
-- 
1.9.1


