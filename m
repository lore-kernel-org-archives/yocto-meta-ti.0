Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D306E00CA4; Mon, 21 Mar 2016 08:44:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7506E00CA4
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:44:36 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A51F52AB2; Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160321154434.3A51F52AB2@arago-project.org>
Date: Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : openmp-rtos: Bump version for hotfix
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
X-List-Received-Date: Mon, 21 Mar 2016 15:44:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ef1e62144978aac07f220721868032fe12aed448
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ef1e62144978aac07f220721868032fe12aed448

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Mar 21 20:51:13 2016 +0000

openmp-rtos: Bump version for hotfix

* fix am57x NOLOAD auto-init and omp atomic race bugs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/openmp-rtos/openmp-rtos_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index 0a16233..38e33c8 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "2_02_01_02"
+PV = "2_02_01_03"
 PR = "r0"
 
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
@@ -15,7 +15,7 @@ BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
 SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
 "
 
-SRCREV = "7003ab350544f98006914d7a5cf834f3e82f5f88"
+SRCREV = "9bf371e9618297f8783113bff05995800535c27d"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 


