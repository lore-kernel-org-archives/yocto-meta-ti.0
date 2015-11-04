Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F6B6E00C14; Wed,  4 Nov 2015 07:04:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A3CFE00BE9
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1F76C52A94; Wed,  4 Nov 2015 15:03:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150354.1F76C52A94@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : traceframework: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7776cbe00f887948839f5b03af653c1c2fdcc613
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7776cbe00f887948839f5b03af653c1c2fdcc613

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:32 2015 +0000

traceframework: Clean up recipes

* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 50989af..6ca9b9a 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -2,12 +2,20 @@ DESCRIPTION = "TI Trace Framework library"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/instrumentation/traceframework/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/traceframework.git;destsuffix=git/ti/instrumentation/traceframework;protocol=git;branch=${BRANCH}"
+TRACEFRAMEWORK_GIT_URI = "git://git.ti.com/keystone-rtos/traceframework.git"
+TRACEFRAMEWORK_GIT_PROTOCOL = "git"
+TRACEFRAMEWORK_GIT_BRANCH = "master"
+TRACEFRAMEWORK_GIT_DESTSUFFIX = "git/ti/instrumentation/traceframework"
 
 # Below commit ID corresponds to DEV.TFWK-01.01.01.07
-SRCREV = "8d9c0e3a5bcb43aad98a794c31f42b652c6b3b53"
+TRACEFRAMEWORK_SRCREV = "8d9c0e3a5bcb43aad98a794c31f42b652c6b3b53"
+
+BRANCH="${TRACEFRAMEWORK_GIT_BRANCH}"
+SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX};protocol=${TRACEFRAMEWORK_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${TRACEFRAMEWORK_SRCREV}"
+
 PV = "01.01.01.07"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 DEPENDS = "cuia"


