Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93E2BE009A4; Fri, 10 Apr 2015 15:09:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAE3DE009A4
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:09:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5EACD52A6D; Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150410220932.5EACD52A6D@arago-project.org>
Date: Fri, 10 Apr 2015 22:09:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : rm-lld: Update to new version 2.1.0.8
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
X-List-Received-Date: Fri, 10 Apr 2015 22:09:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a6302b4f09c98c3490836fe0b2024b3e3df1fc53
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a6302b4f09c98c3490836fe0b2024b3e3df1fc53

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Apr 11 03:56:58 2015 +0000

rm-lld: Update to new version 2.1.0.8

- Updated test files

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rm-lld/rm-lld_git.bb |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/rm-lld/rm-lld_git.bb b/recipes-bsp/rm-lld/rm-lld_git.bb
index ed34478..beac927 100644
--- a/recipes-bsp/rm-lld/rm-lld_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld_git.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=dc61631b6536
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-rtos/rm-lld.git;destsuffix=git/ti/drv/rm;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.RM_LLD.02.01.00.06
-SRCREV = "dc0dba4a6b0358efcb861d50b3dae21beb5281a8"
-PV = "02.01.00.06"
-PR = "r0"
+# Below commit ID corresponds to DEV.RM_LLD.02.01.00.08
+SRCREV = "7873d22076b4cb865365bbce20a244121414bb44"
+PV = "02.01.00.08"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone"
 
@@ -15,8 +15,9 @@ DEPENDS = "ti-ipc libdaemon"
 
 PACKAGES =+ "${PN}-test"
 
-FILES_${PN}-test = "${bindir}/rmDspClientTest_*.out \
-                    ${bindir}/rmLinuxClientTest_*.out \
+FILES_${PN}-test = "${bindir}/rmDspClientTest.out \
+                    ${bindir}/rmLinuxClientTest.out \
+                    ${bindir}/rmLinuxMtClientTest.out \
                     ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
 
 CHOICELIST = "yes no"


