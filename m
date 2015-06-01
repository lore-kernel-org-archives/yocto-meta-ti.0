Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 659FCE00A28; Mon,  1 Jun 2015 07:43:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29A8BE009E1
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:43:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 07188529B8; Mon,  1 Jun 2015 14:43:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601144319.07188529B8@arago-project.org>
Date: Mon,  1 Jun 2015 14:43:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-framework-components: Add version 3.40.00.02.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:43:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 362b3ae6e64b64c220836dbb58f76cbfc3ef158a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=362b3ae6e64b64c220836dbb58f76cbfc3ef158a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 18:15:47 2015 +0000

ti-framework-components: Add version 3.40.00.02.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-framework-components_3.40.00.02.bb          |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
new file mode 100644
index 0000000..2dd8548
--- /dev/null
+++ b/recipes-ti/framework-components/ti-framework-components_3.40.00.02.bb
@@ -0,0 +1,9 @@
+require ti-framework-components.inc
+
+PV = "3_40_00_02"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://framework_components_${PV}_Manifest.html;md5=e3ce0b3e17175b7200f346d0c6dbbcc6"
+
+SRC_URI[fctarball.md5sum] = "f66cb201582e1f407b92501d64738047"
+SRC_URI[fctarball.sha256sum] = "91b0e571b8760e51e4683b44ce13ff3d2f6deb39b204e09894c30514f10c60db"


