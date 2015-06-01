Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8809FE00A6C; Mon,  1 Jun 2015 07:43:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39554E00A54
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:43:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DFCAC52A3F; Mon,  1 Jun 2015 14:43:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601144329.DFCAC52A3F@arago-project.org>
Date: Mon,  1 Jun 2015 14:43:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-framework-components: Add all files to the main package .
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
X-List-Received-Date: Mon, 01 Jun 2015 14:43:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: fab4605d9e3dcf95021b0708b534ecc3cbe10816
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fab4605d9e3dcf95021b0708b534ecc3cbe10816

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 18:15:46 2015 +0000

ti-framework-components: Add all files to the main package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-framework-components.inc                    |    3 +++
 .../ti-framework-components_2.26.00.01.bb          |    4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/recipes-ti/framework-components/ti-framework-components.inc
index 46f6cfd..b8d3f7c 100644
--- a/recipes-ti/framework-components/ti-framework-components.inc
+++ b/recipes-ti/framework-components/ti-framework-components.inc
@@ -15,3 +15,6 @@ do_install() {
     cp -pPrf ${S}/* ${D}${FC_INSTALL_DIR_RECIPE}
 }
 
+INSANE_SKIP_${PN} = "ldflags"
+
+FILES_${PN} += "${FC_INSTALL_DIR_RECIPE}"
diff --git a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
index 9570678..1ec10b1 100644
--- a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
+++ b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
@@ -1,11 +1,9 @@
 require ti-framework-components.inc
 
 PV = "2_26_00_01"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://framework_components_2_26_00_01_manifest.html;md5=3250f9da7ee72284c07f8dd840400c75"
 
 SRC_URI[fctarball.md5sum] = "40b51cade2f9ae6e6f6dca73c17065af"
 SRC_URI[fctarball.sha256sum] = "3f7a12a51dfe87310828a31518d7ef8f9039e59269c0ca24f74a68433c235048"
-
-INSANE_SKIP_${PN} = "installed-vs-shipped"


