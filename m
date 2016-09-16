Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2ABBDE00CC1; Fri, 16 Sep 2016 09:19:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA9DFE00CB2
	for <meta-ti@yoctoproject.org>; Fri, 16 Sep 2016 09:19:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DD37352991; Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160916161910.DD37352991@arago-project.org>
Date: Fri, 16 Sep 2016 16:19:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ajay Jayaraj : openmp-rtos: Updated version to 2.04.00.00
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
X-List-Received-Date: Fri, 16 Sep 2016 16:19:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: fd44670b877ae670cac6a9d4d59e08815f0b50a8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fd44670b877ae670cac6a9d4d59e08815f0b50a8

Author: Ajay Jayaraj <ajayj@ti.com>
Date:   Thu Sep 15 00:13:09 2016 +0000

openmp-rtos: Updated version to 2.04.00.00

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/openmp-rtos/openmp-rtos_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 6893179..2984da3 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_03_01_00"
+PV = "2_04_00_00"
 PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
@@ -15,7 +15,7 @@ BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
 SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
 "
 
-SRCREV = "a73b7b5a79a6ca9390388079b09a1cf5795bd7fc"
+SRCREV = "2a657d3a38c507287ac84ef6771c27d38f0024f7"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 


