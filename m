Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D0DDE00C7C; Thu,  7 Apr 2016 22:50:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E858E00C76
	for <meta-ti@yoctoproject.org>; Thu,  7 Apr 2016 22:50:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B84D952982; Fri,  8 Apr 2016 05:50:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160408055013.B84D952982@arago-project.org>
Date: Fri,  8 Apr 2016 05:50:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : bios: prevent any stripping of binaries due to different arch/format
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
X-List-Received-Date: Fri, 08 Apr 2016 05:50:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 66e481c2d84a07153a55aa79d2f461f0d60ebb58
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=66e481c2d84a07153a55aa79d2f461f0d60ebb58

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Apr  8 10:57:42 2016 +0000

bios: prevent any stripping of binaries due to different arch/format

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-sysbios.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.inc
index c44fec3..408be78 100644
--- a/recipes-ti/bios/ti-sysbios.inc
+++ b/recipes-ti/bios/ti-sysbios.inc
@@ -22,4 +22,7 @@ do_install() {
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${SYSBIOS_INSTALL_DIR_RECIPE}"
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"


