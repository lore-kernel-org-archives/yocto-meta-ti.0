Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC294E00C30; Thu, 12 Nov 2015 05:15:43 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2E93E00C30
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2015 05:15:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 388F452AC5; Thu, 12 Nov 2015 13:15:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151112131536.388F452AC5@arago-project.org>
Date: Thu, 12 Nov 2015 13:15:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc: update to 3.41.00.02-eng
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
X-List-Received-Date: Thu, 12 Nov 2015 13:15:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f5721982b14fefc337d227b1e9cb330a05f096f7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5721982b14fefc337d227b1e9cb330a05f096f7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov 12 08:04:39 2015 +0000

ti-ipc: update to 3.41.00.02-eng

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index ac899bf..e1432e0 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,15 +6,15 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.40.01.08"
+PV = "3.41.00.02"
 
-BRANCH = "3.40"
+BRANCH = "ipc-next"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            file://0001-Add-kernel-build-dir.patch \
            "
-# Commit corresponds to 3.40.01.08
-SRCREV = "239354b731b77e30a70230ebb54a31a83fc8b12f"
+# Commit corresponds to 3.41.00.02-eng
+SRCREV = "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
 
 S = "${WORKDIR}/git"
 


