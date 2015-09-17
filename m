Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FBE7E00D5E; Wed, 16 Sep 2015 18:32:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2557CE00D70
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 18:31:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3022952AB2; Thu, 17 Sep 2015 01:31:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150917013156.3022952AB2@arago-project.org>
Date: Thu, 17 Sep 2015 01:31:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-sysbios: Bump version to 6.42.02.29
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
X-List-Received-Date: Thu, 17 Sep 2015 01:32:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7228cbefffbf070bf121b524ccc0dab6c8dd7587
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7228cbefffbf070bf121b524ccc0dab6c8dd7587

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Sep 16 18:15:05 2015 +0000

ti-sysbios: Bump version to 6.42.02.29

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-sysbios_6.41.04.54.bb |   12 ------------
 recipes-ti/bios/ti-sysbios_6.42.02.29.bb |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-ti/bios/ti-sysbios_6.41.04.54.bb b/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
deleted file mode 100644
index 1e24fe1..0000000
--- a/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-sysbios.inc
-
-PV = "6_41_04_54"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=95c3c6050fb23f2755ab75bf76805190"
-
-SRC_URI[sysbiosbin.md5sum] = "cbc53f2b15c2f70e2eaa05c1ed90b8db"
-SRC_URI[sysbiosbin.sha256sum] = "2b4fcb85af4c0abc46dadc925312b2a28906ec34db9b1500f0c484ee3fcb58cf"
-
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
diff --git a/recipes-ti/bios/ti-sysbios_6.42.02.29.bb b/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
new file mode 100644
index 0000000..1abb496
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.42.02.29.bb
@@ -0,0 +1,12 @@
+require ti-sysbios.inc
+
+PV = "6_42_02_29"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=ab905941085d55ea207fcb4cdab4f9c3"
+
+SRC_URI[sysbiosbin.md5sum] = "ba470b69d1ffa4a34fd05645f240216c"
+SRC_URI[sysbiosbin.sha256sum] = "eb070642e8ee8e742525599f53ef1547d6f5dded557987550c710ad193d0de31"
+
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"


