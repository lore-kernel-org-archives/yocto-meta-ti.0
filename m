Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C32FBE00D93; Wed, 29 Jun 2016 14:12:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83AE3E00D93
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:11:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5AE8F52ACC; Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160629211156.5AE8F52ACC@arago-project.org>
Date: Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : openmp-rtos: bump SRCREV to version 2.3.1.0
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
X-List-Received-Date: Wed, 29 Jun 2016 21:12:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: f175c88c0143b0b47ea5afeaaa2982eb3d38948d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f175c88c0143b0b47ea5afeaaa2982eb3d38948d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Jun 28 23:48:34 2016 +0000

openmp-rtos: bump SRCREV to version 2.3.1.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/openmp-rtos/openmp-rtos_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 7c781a2..6893179 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_02_01_03"
-PR = "r1"
+PV = "2_03_01_00"
+PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
 OPENMP_RTOS_GIT_PROTOCOL = "git"
@@ -15,7 +15,7 @@ BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
 SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
 "
 
-SRCREV = "9bf371e9618297f8783113bff05995800535c27d"
+SRCREV = "a73b7b5a79a6ca9390388079b09a1cf5795bd7fc"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 


