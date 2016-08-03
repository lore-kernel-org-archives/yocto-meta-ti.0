Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5230E00CE7; Tue,  2 Aug 2016 18:43:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B286E00CD1
	for <meta-ti@yoctoproject.org>; Tue,  2 Aug 2016 18:43:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2D1C4529BF; Wed,  3 Aug 2016 01:43:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160803014356.2D1C4529BF@arago-project.org>
Date: Wed,  3 Aug 2016 01:43:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : edma3-lld-rtos, ti-ipc-rtos, multiprocmgr-rtos: remove sneaked in sourceipk calls
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
X-List-Received-Date: Wed, 03 Aug 2016 01:43:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: f088a6a6fd50d92e51aac7824ce017acfc52a2e3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f088a6a6fd50d92e51aac7824ce017acfc52a2e3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Aug  2 22:07:31 2016 +0000

edma3-lld-rtos, ti-ipc-rtos, multiprocmgr-rtos: remove sneaked in sourceipk calls

There's no sourceipk functionality in meta-ti.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb      |    1 -
 recipes-ti/ipc/ti-ipc-rtos_git.bb                |    4 ----
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb |    1 -
 3 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 1f1483e..6a01d0b 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -103,7 +103,6 @@ do_compile () {
             make PLATFORM=${p} TARGET=${t} FORMAT=${FORMAT}
         done
     done
-    sourceipk_do_create_srcipk
 }
 
 do_install () {
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index c9c4714..5b26436 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -123,10 +123,6 @@ do_compile() {
   fi
 }
 
-do_compile_append() {
-  sourceipk_do_create_srcipk
-}
-
 do_install() {
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
   # Copy docs and other meta files
diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
index 50e5049..061790b 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -14,7 +14,6 @@ export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
 do_compile() {
     make c66x
     make test_c66x
-    sourceipk_do_create_srcipk
 }
 
 do_install() {


