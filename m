Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 235A6E00C81; Mon, 19 Dec 2016 15:19:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 407B9E00C59
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:19:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 583B352AAA; Mon, 19 Dec 2016 23:19:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161219231929.583B352AAA@arago-project.org>
Date: Mon, 19 Dec 2016 23:19:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 2.0.3
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
X-List-Received-Date: Mon, 19 Dec 2016 23:19:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1a61032eaaf32393dcb97ba7027df8dcd55c6405
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1a61032eaaf32393dcb97ba7027df8dcd55c6405

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Dec 17 04:41:09 2016 +0000

mpm-transport: Update to new version 2.0.3

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index ee28f2f..0690807 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -15,11 +15,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.02.00A
-SRCREV = "7284e75d36b265ef8535d2e2ee54d1f2c700e862"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.03.00
+SRCREV = "ba53217c5db1a6f9d21a0c8f50e9e30a6efa8be8"
 
-PV = "2.0.2.0"
-PR = "r1"
+PV = "2.0.3.0"
+PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"


