Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BC06E008BF; Thu, 19 Feb 2015 13:46:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC9F9E008CA
	for <meta-ti@yoctoproject.org>; Thu, 19 Feb 2015 13:46:16 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BD9A352AB7; Thu, 19 Feb 2015 21:46:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150219214614.BD9A352AB7@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : dfe-lld: Add recipe for dfe test code
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
Commit: 290512343741efe1b0043aae64ff6df1d943be07
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=290512343741efe1b0043aae64ff6df1d943be07

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 03:28:09 2015 +0000

dfe-lld: Add recipe for dfe test code

- Adds test code for Digital front end low level driver

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dfe-lld/dfe-lld-test_git.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/dfe-lld/dfe-lld-test_git.bb b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
new file mode 100644
index 0000000..acaaf63
--- /dev/null
+++ b/recipes-bsp/dfe-lld/dfe-lld-test_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "TI Digital Radio Front End lld test application"
+
+DEPENDS = "common-csl-ip dfe-lld iqn2-lld"
+
+include dfe-lld.inc
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} DFE_SRC_DIR=${S}"
+
+do_compile () {
+#   Now build the lld in the updated directory
+	oe_runmake clean DEVICE=k2l
+	oe_runmake tests DEVICE=k2l
+	oe_runmake tests DEVICE=k2l USEDYNAMIC_LIB=yes
+}
+
+do_install () {
+	oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}/${bindir}
+}


