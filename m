Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70DF8E008DB; Mon,  7 Mar 2016 17:30:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 927DEE0090E
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 17:30:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B933052B02; Tue,  8 Mar 2016 01:30:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308013012.B933052B02@arago-project.org>
Date: Tue,  8 Mar 2016 01:30:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-xdctools: Update to verion 3.32.00.06
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
X-List-Received-Date: Tue, 08 Mar 2016 01:30:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 10d7fc9f0d22166cd912f913d42b5a78a85e6745
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=10d7fc9f0d22166cd912f913d42b5a78a85e6745

Author: Justin Sobota <jsobota@ti.com>
Date:   Tue Mar  8 01:58:46 2016 +0000

ti-xdctools: Update to verion 3.32.00.06

License checksum calculation now ignores generation date

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb |    9 ---------
 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

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
index 0000000..19bbe5d
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -0,0 +1,9 @@
+require recipes-ti/devtools/ti-xdctools-core.inc
+
+PV = "3_32_00_06"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
+
+SRC_URI[xdczip.md5sum] = "93127f4c2f35d94b6c8e5a52b79c38ae"
+SRC_URI[xdczip.sha256sum] = "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f348e214a725d1e849bd39c7"


