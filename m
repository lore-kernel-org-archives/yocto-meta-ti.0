Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04E2BE008E3; Thu, 19 Feb 2015 13:46:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7069E008BF
	for <meta-ti@yoctoproject.org>; Thu, 19 Feb 2015 13:46:16 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C58A452093; Thu, 19 Feb 2015 21:46:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150219214614.C58A452093@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : iqn2-lld: Add recipe for iqn2 lld test code
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
X-List-Received-Date: Thu, 19 Feb 2015 21:46:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: df7956e71e04f21b6b1be64ed2de0621a7582868
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=df7956e71e04f21b6b1be64ed2de0621a7582868

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 03:28:10 2015 +0000

iqn2-lld: Add recipe for iqn2 lld test code

- Adds test code for iqn2 peripheral low level driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
new file mode 100644
index 0000000..f1aa9e4
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "TI IQN2 peripheral module low level driver test binaries"
+
+DEPENDS = "common-csl-ip iqn2-lld dfe-lld"
+
+include iqn2-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} IQN2_SRC_DIR=${WORKDIR}/git"
+
+do_compile () {
+	oe_runmake clean DEVICE=k2l
+	oe_runmake tests DEVICE=k2l
+}
+
+do_install () {
+	oe_runmake installbin DEVICE=k2l IQN2_SRC_DIR=${WORKDIR}/git INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}


