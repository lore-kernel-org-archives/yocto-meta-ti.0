Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21100E00951; Tue,  8 Mar 2016 15:44:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E30AE00973
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E408352AD0; Tue,  8 Mar 2016 23:44:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234429.E408352AD0@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld-rtos: Point TMS470_CGTOOLS to correct toolchain
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 83e6205c854f2c9034a988e23a2929169319dac2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=83e6205c854f2c9034a988e23a2929169319dac2

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Mar  8 23:58:09 2016 +0000

edma3-lld-rtos: Point TMS470_CGTOOLS to correct toolchain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index dc39fee..0195173 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -2,7 +2,7 @@ require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "ti-sysbios ti-xdctools"
 
@@ -67,7 +67,7 @@ export CGTOOLS = "${XDCCGROOT}"
 export CGTOOLS_ELF = "${XDCCGROOT}"
 export CODEGEN_PATH_DSP = "${XDCCGROOT}"
 export CODEGEN_PATH_DSPELF = "${XDCCGROOT}"
-export TMS470_CGTOOLS = "${XDCCGROOT}"
+export TMS470_CGTOOLS = "${M4_TOOLCHAIN_INSTALL_DIR}"
 export UTILS_INSTALL_DIR = "${XDC_INSTALL_DIR}"
 export XDCPATH = "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
 export PATH := "${XDC_INSTALL_DIR}:${PATH}"


