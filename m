Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A11AAE00B4A; Wed,  4 Nov 2015 07:00:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB1D4E00B4A
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:02 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5C23052AB0; Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150002.5C23052AB0@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : pktlib: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8618a97a988637fecfc6dc53e58e0684134a42a2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8618a97a988637fecfc6dc53e58e0684134a42a2

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:24 2015 +0000

pktlib: Clean up recipes

* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pktlib/pktlib_git.bb |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index 17e5041..03399cf 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -5,12 +5,19 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fb
 DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld"
 COMPATIBLE_MACHINE = "keystone"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/pktlib.git;protocol=git;branch=${BRANCH}"
+PKTLIB_GIT_URI = "git://git.ti.com/keystone-rtos/pktlib.git"
+PKTLIB_GIT_PROTOCOL = "git"
+PKTLIB_GIT_BRANCH = "master"
 
 # Corresponds to DEV.PKTLIB.2.1.0.5
-SRCREV = "d757026f3d6a837711f4b44b5ffdefed761fc186"
+PKTLIB_SRCREV = "d757026f3d6a837711f4b44b5ffdefed761fc186"
+
+BRANCH = "${PKTLIB_GIT_BRANCH}"
+SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${PKTLIB_SRCREV}"
+
 PV = "2.1.0.5"
+PR = "r1"
 
 S = "${WORKDIR}/git/ti/runtime/pktlib"
 


