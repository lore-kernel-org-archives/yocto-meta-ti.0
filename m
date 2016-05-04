Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4F96E008B8; Wed,  4 May 2016 10:41:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D35EAE00791
	for <meta-ti@yoctoproject.org>; Wed,  4 May 2016 10:40:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8E5C752A98; Wed,  4 May 2016 17:40:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160504174058.8E5C752A98@arago-project.org>
Date: Wed,  4 May 2016 17:40:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : openmp-rtos: Add zip-native as a dependency
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
X-List-Received-Date: Wed, 04 May 2016 17:41:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c1eecb62f2699c9bbfefb8db1b0f762d4967a2c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c1eecb62f2699c9bbfefb8db1b0f762d4967a2c7

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May  4 23:12:05 2016 +0000

openmp-rtos: Add zip-native as a dependency

* The openmp-rtos build procedure uses zip to create the release
  package and is therefore the native zip is required as a dependency

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/openmp-rtos/openmp-rtos_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 38e33c8..7c781a2 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 require recipes-ti/includes/ti-paths.inc
 
 PV = "2_02_01_03"
-PR = "r0"
+PR = "r1"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
 OPENMP_RTOS_GIT_PROTOCOL = "git"
@@ -19,7 +19,7 @@ SRCREV = "9bf371e9618297f8783113bff05995800535c27d"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm"
+DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-cgt6x-native libulm zip-native"
 DEPENDS_append_k2hk-evm = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2e-evm = " qmss-lld-rtos cppi-lld-rtos"
 DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"


