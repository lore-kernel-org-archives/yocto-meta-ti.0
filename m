Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AED2CE007B7; Tue,  2 Aug 2016 09:07:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8064FE006D8
	for <meta-ti@yoctoproject.org>; Tue,  2 Aug 2016 09:07:49 -0700 (PDT)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBA000W1I4KYK80@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 02 Aug 2016 11:07:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=kdhGTYdCFMt_r4zlUX4A:9
Received: by 100.15.86.14 with SMTP id 2710b503; Tue, 02 Aug 2016 16:07:33 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id ACFB31620CC;	Tue,  2 Aug 2016 12:07:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 02 Aug 2016 12:07:31 -0400
Message-id: <1470154051-25155-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] edma3-lld-rtos, ti-ipc-rtos, multiprocmgr-rtos: remove sneaked in sourceipk calls
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
X-List-Received-Date: Tue, 02 Aug 2016 16:07:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

There's no sourceipk functionality in meta-ti.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb      | 1 -
 recipes-ti/ipc/ti-ipc-rtos_git.bb                | 4 ----
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 1 -
 3 files changed, 6 deletions(-)

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
-- 
2.7.4


