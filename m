Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3211E00BC6; Wed, 16 Dec 2015 12:00:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7320E00BB6
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 12:00:08 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBGK07YT017448
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 14:00:07 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBGK06bH005620
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 14:00:07 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Dec 2015 14:00:06 -0600
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBGK06lX011937;	Wed, 16 Dec 2015 14:00:06 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 16 Dec 2015 14:59:48 -0500
Message-ID: <1450295989-29695-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2] ipc-transport-qmss: Update to new version 2.0.0.1
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
X-List-Received-Date: Wed, 16 Dec 2015 20:00:14 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb |    6 +++++-
 recipes-ti/ipc/ipc-transport-qmss.inc         |    6 +++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
index 34d3708..e7c827e 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-test_git.bb
@@ -1,12 +1,16 @@
 include ipc-transport-qmss.inc
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 DEPENDS = "ipc-transport-qmss ti-ipc"
 
 #FILES_${PN}-test = "${bindir}/multiProcessTest_*.out"
 
 CHOICELIST = "yes no"
 
-DEVICELIST = "k2h k2k k2e k2l"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2e-evm  = "k2e"
+DEVICELIST_k2l-evm  = "k2l"
 
 do_compile () {
 #   Now build the test code
diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
index 64692f2..4b74eec 100644
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.00
-SRCREV = "e0f99ae7bf3efc8f6a7c415af513b7c4323c5271"
-PV = "02.00.00.00"
+# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
+SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
+PV = "02.00.00.01"
 
 COMPATIBLE_MACHINE = "keystone"
 
-- 
1.7.10.4


