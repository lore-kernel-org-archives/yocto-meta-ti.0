Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EED49E00855; Mon, 30 Nov 2015 13:46:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D65CE00985
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 13:46:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E844A52AA4; Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151130214620.E844A52AA4@arago-project.org>
Date: Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : mmap-lld: mark as compatible with all Keystone
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
X-List-Received-Date: Mon, 30 Nov 2015 21:46:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6cbe8dcb5f5807d2ac9c9ad7604009122788a2f4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6cbe8dcb5f5807d2ac9c9ad7604009122788a2f4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec  1 00:18:41 2015 +0000

mmap-lld: mark as compatible with all Keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 3dfc93c..9a6a4a5 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 
-COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm"
+COMPATIBLE_MACHINE = "keystone"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
@@ -17,6 +17,6 @@ SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${
 SRCREV = "${MMAP_LLD_SRCREV}"
 
 PV = "2.0.0.4"
-INC_PR = "r3"
+INC_PR = "r4"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"


