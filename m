Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0591BE00C4D; Wed,  4 Nov 2015 07:04:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76D54E00C02
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 37F1F52AB3; Wed,  4 Nov 2015 15:03:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150354.37F1F52AB3@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : traceframework: Only build binaries relevent to the machine
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 489224afdc22cd949fcc3b4215fe1bb2110d6b98
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=489224afdc22cd949fcc3b4215fe1bb2110d6b98

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:33 2015 +0000

traceframework: Only build binaries relevent to the machine

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 6ca9b9a..7a40291 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -15,14 +15,17 @@ SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX}
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
 
 PV = "01.01.01.07"
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "cuia"
 
 DEVICELIST = ""
 DEVICELIST_append_tci6614-evm = "c6614"
-DEVICELIST_append_keystone    = "k2k k2h k2e k2l"
+DEVICELIST_append_k2hk-evm    = "k2k k2h"
+DEVICELIST_append_k2e-evm     = "k2e"
+DEVICELIST_append_k2l-evm     = "k2l"
 
 PACKAGES =+ "${PN}-test"
 


