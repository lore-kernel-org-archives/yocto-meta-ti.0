Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1BFCE00A21; Mon, 19 Dec 2016 15:15:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73B6FE009BA
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:15:42 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DB9FF52A3D; Mon, 19 Dec 2016 23:15:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231541.DB9FF52A3D@arago-project.org>
Date: Mon, 19 Dec 2016 23:15:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ti-sysbios: Upstream version 6.46.01.38
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
X-List-Received-Date: Mon, 19 Dec 2016 23:15:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0ea39b13219d6506ef4bcc88a3170a88853a4e3b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0ea39b13219d6506ef4bcc88a3170a88853a4e3b

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 15 21:54:33 2016 +0000

ti-sysbios: Upstream version 6.46.01.38

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-sysbios_6.45.01.29.bb |   12 ------------
 recipes-ti/bios/ti-sysbios_6.46.01.38.bb |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
deleted file mode 100644
index 6ab4e27..0000000
--- a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-ti/bios/ti-sysbios.inc
-
-PV = "6_45_01_29"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
-
-SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
-SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
-
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
new file mode 100644
index 0000000..407b3b4
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
@@ -0,0 +1,12 @@
+require recipes-ti/bios/ti-sysbios.inc
+
+PV = "6_46_01_38"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
+
+SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
+SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
+
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"


