Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A76D1E00992; Mon,  1 Jun 2015 07:43:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2160BE00992
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:43:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B44A152A14; Mon,  1 Jun 2015 14:43:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601144323.B44A152A14@arago-project.org>
Date: Mon,  1 Jun 2015 14:43:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-framework-components: Move LIC_FILES_CHKSUM into recipe .
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
X-List-Received-Date: Mon, 01 Jun 2015 14:43:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 90de37337cd9f5b50b8f601bafff8c490a5b653b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=90de37337cd9f5b50b8f601bafff8c490a5b653b

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 18:15:45 2015 +0000

ti-framework-components: Move LIC_FILES_CHKSUM into recipe.

* This is version specific, so it should not be in a version-agnostic
  include file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../ti-framework-components.inc                    |    4 ----
 .../ti-framework-components_2.26.00.01.bb          |    3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/framework-components/ti-framework-components.inc b/recipes-ti/framework-components/ti-framework-components.inc
index f2244db..46f6cfd 100644
--- a/recipes-ti/framework-components/ti-framework-components.inc
+++ b/recipes-ti/framework-components/ti-framework-components.inc
@@ -3,13 +3,9 @@ HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/f
 SECTION = "devel"
 LICENSE = "BSD"
 
-LIC_FILES_CHKSUM = "file://framework_components_2_26_00_01_manifest.html;md5=3250f9da7ee72284c07f8dd840400c75"
-
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r1"
-
 S = "${WORKDIR}/framework_components_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/${PV}/exports/framework_components_${PV},lite.tar.gz;name=fctarball"
diff --git a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
index 7abe793..9570678 100644
--- a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
+++ b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
@@ -1,6 +1,9 @@
 require ti-framework-components.inc
 
 PV = "2_26_00_01"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://framework_components_2_26_00_01_manifest.html;md5=3250f9da7ee72284c07f8dd840400c75"
 
 SRC_URI[fctarball.md5sum] = "40b51cade2f9ae6e6f6dca73c17065af"
 SRC_URI[fctarball.sha256sum] = "3f7a12a51dfe87310828a31518d7ef8f9039e59269c0ca24f74a68433c235048"


