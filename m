Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBB1AE00803; Thu, 28 Jan 2016 10:43:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53098E00852
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1F64F529B5; Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184350.1F64F529B5@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : mmap-lld: Upgrade to version 2.0.0.6
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7432f5d70273bc74aeecc644d62e001f72affdcc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7432f5d70273bc74aeecc644d62e001f72affdcc

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:05 2016 +0000

mmap-lld: Upgrade to version 2.0.0.6

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index 9a6a4a5..37bd0bd 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -9,14 +9,14 @@ MMAP_LLD_GIT_PROTOCOL = "git"
 MMAP_LLD_GIT_BRANCH = "master"
 MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
 
-# Commit correspond to DEV.MMAP.02.00.00.04
-MMAP_LLD_SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
+# Commit correspond to DEV.MMAP.02.00.00.06
+MMAP_LLD_SRCREV = "70c10fbce809a3ed1cd67c9da2e2a47d3de8f832"
 
 BRANCH="${MMAP_LLD_GIT_BRANCH}"
 SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${MMAP_LLD_SRCREV}"
 
-PV = "2.0.0.4"
-INC_PR = "r4"
+PV = "2.0.0.6"
+INC_PR = "r0"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"


