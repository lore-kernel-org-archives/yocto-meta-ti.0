Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25367E00D76; Wed, 16 Sep 2015 18:32:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95C44E00D5E
	for <meta-ti@yoctoproject.org>; Wed, 16 Sep 2015 18:31:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AA70652A02; Thu, 17 Sep 2015 01:31:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150917013155.AA70652A02@arago-project.org>
Date: Thu, 17 Sep 2015 01:31:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-framework-components: Bump version to 3.40.01.04
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
X-List-Received-Date: Thu, 17 Sep 2015 01:32:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 2bd512cbf5ae58df6e3d5cd77e7b9ceebd8dd145
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2bd512cbf5ae58df6e3d5cd77e7b9ceebd8dd145

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Sep 16 18:15:06 2015 +0000

ti-framework-components: Bump version to 3.40.01.04

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-framework-components_3.40.00.02.bb          |    9 ---------
 .../ti-framework-components_3.40.01.04.bb          |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
deleted file mode 100644
index 78f764d..0000000
--- a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-framework-components.inc
-
-PV = "3_40_00_02"
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=e3ce0b3e17175b7200f346d0c6dbbcc6"
-
-SRC_URI[fctarball.md5sum] = "f66cb201582e1f407b92501d64738047"
-SRC_URI[fctarball.sha256sum] = "91b0e571b8760e51e4683b44ce13ff3d2f6deb39b204e09894c30514f10c60db"
diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb b/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
new file mode 100644
index 0000000..61c5a98
--- /dev/null
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
@@ -0,0 +1,9 @@
+require ti-framework-components.inc
+
+PV = "3_40_01_04"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=806c3e4afd3bfbf7e5dc400ed1a0cc3c"
+
+SRC_URI[fctarball.md5sum] = "0e6b61cb6e1ad8b249d64f041c872192"
+SRC_URI[fctarball.sha256sum] = "eb38002092a7fc8f704fe9ea9de7f29108bc2533ba95f184706b2936dd24711c"


