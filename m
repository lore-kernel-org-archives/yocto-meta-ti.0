Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 526CDE00B74; Tue, 20 Sep 2016 08:40:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1363E00B52
	for <meta-ti@yoctoproject.org>; Tue, 20 Sep 2016 08:40:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 32D5852A93; Tue, 20 Sep 2016 15:40:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160920154005.32D5852A93@arago-project.org>
Date: Tue, 20 Sep 2016 15:40:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : common-csl-ip-rtos: add support for k2e-hs-evm
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
X-List-Received-Date: Tue, 20 Sep 2016 15:40:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 24625003785159050c67116843bc4a3e34de8eeb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24625003785159050c67116843bc4a3e34de8eeb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 20 20:37:19 2016 +0000

common-csl-ip-rtos: add support for k2e-hs-evm

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 877b230..d5fb83e 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,5 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,6 +16,7 @@ LIMSOCS_omap-a15 = "am571x am572x"
 LIMSOCS_k2hk-evm = "k2h k2k"
 LIMSOCS_k2l-evm = "k2l"
 LIMSOCS_k2e-evm = "k2e"
+LIMSOCS_k2e-hs-evm = "k2e"
 LIMSOCS_k2g-evm = "k2g"
 
 export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"


