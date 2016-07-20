Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9ADCFE00D07; Tue, 19 Jul 2016 18:42:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6636BE00D09
	for <meta-ti@yoctoproject.org>; Tue, 19 Jul 2016 18:42:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 68E2952ACF; Wed, 20 Jul 2016 01:42:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160720014225.68E2952ACF@arago-project.org>
Date: Wed, 20 Jul 2016 01:42:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-framework-components: update to version 3.40.02.07
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
X-List-Received-Date: Wed, 20 Jul 2016 01:42:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d12c6b3df98712302b486dc776fc44ab6f23d49e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d12c6b3df98712302b486dc776fc44ab6f23d49e

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Jul 12 19:38:50 2016 +0000

ti-framework-components: update to version 3.40.02.07

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-framework-components_3.40.01.04.bb          |    9 ---------
 .../ti-framework-components_3.40.02.07.bb          |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb b/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
deleted file mode 100644
index 61c5a98..0000000
--- a/recipes-ti/framework-components/ti-framework-components_3.40.01.04.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ti-framework-components.inc
-
-PV = "3_40_01_04"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=806c3e4afd3bfbf7e5dc400ed1a0cc3c"
-
-SRC_URI[fctarball.md5sum] = "0e6b61cb6e1ad8b249d64f041c872192"
-SRC_URI[fctarball.sha256sum] = "eb38002092a7fc8f704fe9ea9de7f29108bc2533ba95f184706b2936dd24711c"
diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb b/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
new file mode 100644
index 0000000..56c0028
--- /dev/null
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.02.07.bb
@@ -0,0 +1,9 @@
+require ti-framework-components.inc
+
+PV = "3_40_02_07"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=0dd131dd53300f517b14dba8824f8b0a"
+
+SRC_URI[fctarball.md5sum] = "36dd2312ea8d70aa2ae0a05a24dbf54e"
+SRC_URI[fctarball.sha256sum] = "69082a0f86d12c24b39a1293ec35cf8007b850479898d5ae485ec1e8cf2e8c72"


