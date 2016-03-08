Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7250E008F1; Mon,  7 Mar 2016 17:30:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91F29E008F1
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 17:30:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A672452B01; Tue,  8 Mar 2016 01:30:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308013012.A672452B01@arago-project.org>
Date: Tue,  8 Mar 2016 01:30:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-sysbios: Update to 6.45.01.29
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
X-List-Received-Date: Tue, 08 Mar 2016 01:30:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ffbd040e0d8fb0e6f8b048df867bf5e2f97a95fa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ffbd040e0d8fb0e6f8b048df867bf5e2f97a95fa

Author: Justin Sobota <jsobota@ti.com>
Date:   Tue Mar  8 01:58:45 2016 +0000

ti-sysbios: Update to 6.45.01.29

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-sysbios_6.42.02.29.bb |   12 ------------
 recipes-ti/bios/ti-sysbios_6.45.01.29.bb |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/bios/ti-sysbios_6.42.02.29.bb b/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
deleted file mode 100644
index 1abb496..0000000
--- a/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-sysbios.inc
-
-PV = "6_42_02_29"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=ab905941085d55ea207fcb4cdab4f9c3"
-
-SRC_URI[sysbiosbin.md5sum] = "ba470b69d1ffa4a34fd05645f240216c"
-SRC_URI[sysbiosbin.sha256sum] = "eb070642e8ee8e742525599f53ef1547d6f5dded557987550c710ad193d0de31"
-
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
new file mode 100644
index 0000000..6ab4e27
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
@@ -0,0 +1,12 @@
+require recipes-ti/bios/ti-sysbios.inc
+
+PV = "6_45_01_29"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
+
+SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
+SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
+
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"


