Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 027DDE00CD7; Fri,  4 Mar 2016 09:07:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18909E00CD7
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 09:07:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id BB6B752AC2; Fri,  4 Mar 2016 17:07:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160304170749.BB6B752AC2@arago-project.org>
Date: Fri,  4 Mar 2016 17:07:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : common-csl-ip-rtos: Add support for k2g-evm
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
X-List-Received-Date: Fri, 04 Mar 2016 17:07:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: d4b8e0a86f08d491890d795af89a7a9cd3196932
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d4b8e0a86f08d491890d795af89a7a9cd3196932

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri Mar  4 18:41:05 2016 +0000

common-csl-ip-rtos: Add support for k2g-evm

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 41a0d43..43ea2ed 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,5 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -13,6 +13,7 @@ XDCARGS_omap-a15 = "am571x am572x"
 XDCARGS_k2hk-evm = "k2h k2k"
 XDCARGS_k2l-evm = "k2l"
 XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2g-evm = "k2g"
 
 do_configure_append() {
     # Create empty makefile


