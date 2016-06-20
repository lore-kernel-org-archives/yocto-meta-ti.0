Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CED6BE00C22; Mon, 20 Jun 2016 13:57:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EC4AE00AD8
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:56:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDA2552AC4; Mon, 20 Jun 2016 20:56:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160620205653.CDA2552AC4@arago-project.org>
Date: Mon, 20 Jun 2016 20:56:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 2.0.1.2
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
X-List-Received-Date: Mon, 20 Jun 2016 20:57:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: df454f2fe74bd869c8a92ee65ace3e7039347e8a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=df454f2fe74bd869c8a92ee65ace3e7039347e8a

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Jun 21 02:04:13 2016 +0000

mpm-transport: Update to new version 2.0.1.2

- Adapts to API change in uio-module-drv

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 473de20..280a5e1 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -15,11 +15,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
 BRANCH = "master"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.01
-SRCREV = "489b669540c5545125ab5d9f3f2cdb5ec5fc09dd"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.01.02
+SRCREV = "5c1f177b8d5802227dfe7e86fc026620e1e10189"
 
-PV = "2.0.0.1"
-PR = "r1"
+PV = "2.0.1.2"
+PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"


