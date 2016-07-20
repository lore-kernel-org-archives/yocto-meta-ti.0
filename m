Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D212E00CE5; Tue, 19 Jul 2016 18:42:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA459E00CE9
	for <meta-ti@yoctoproject.org>; Tue, 19 Jul 2016 18:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 06DA052AC9; Wed, 20 Jul 2016 01:42:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160720014225.06DA052AC9@arago-project.org>
Date: Wed, 20 Jul 2016 01:42:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : vlib-c66x: prevent stripping of binaries due to differnt arch/format
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
X-List-Received-Date: Wed, 20 Jul 2016 01:42:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 730d197144ed18c75dcf85f8f8ba2953ea30bc5c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=730d197144ed18c75dcf85f8f8ba2953ea30bc5c

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Jul 12 20:19:18 2016 +0000

vlib-c66x: prevent stripping of binaries due to differnt arch/format

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/vlib/vlib-c66x.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/vlib/vlib-c66x.inc b/recipes-ti/vlib/vlib-c66x.inc
index 2e57347..ed35c7f 100644
--- a/recipes-ti/vlib/vlib-c66x.inc
+++ b/recipes-ti/vlib/vlib-c66x.inc
@@ -25,4 +25,7 @@ do_install() {
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${VLIB_C66_INSTALL_DIR_RECIPE}"
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN}-dev = "installed-vs-shipped arch"


