Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2C4EE00A7D; Sun, 15 Nov 2015 22:18:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_DYNIP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  0.4 TO_NO_BRKTS_DYNIP To: lacks brackets and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 638A7E007E1
	for <meta-ti@yoctoproject.org>; Sun, 15 Nov 2015 22:18:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0045E52A9F; Mon, 16 Nov 2015 06:18:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151116061841.0045E52A9F@arago-project.org>
Date: Mon, 16 Nov 2015 06:18:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : traceframework: overwrite instead of append to DEVICELIST var
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
X-List-Received-Date: Mon, 16 Nov 2015 06:18:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3bc6bb5302a4284297300e24437ce05a44a4397b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3bc6bb5302a4284297300e24437ce05a44a4397b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov 16 10:27:21 2015 +0000

traceframework: overwrite instead of append to DEVICELIST var

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/traceframework/traceframework_git.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index d6b5023..31818c6 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -15,17 +15,17 @@ SRC_URI = "${TRACEFRAMEWORK_GIT_URI};destsuffix=${TRACEFRAMEWORK_GIT_DESTSUFFIX}
 SRCREV = "${TRACEFRAMEWORK_SRCREV}"
 
 PV = "01.01.01.07"
-PR = "r3"
+PR = "r4"
 
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "cuia"
 
 DEVICELIST = "k2k k2h k2e k2l"
-DEVICELIST_append_tci6614-evm = "c6614"
-DEVICELIST_append_k2hk-evm    = "k2k k2h"
-DEVICELIST_append_k2e-evm     = "k2e"
-DEVICELIST_append_k2l-evm     = "k2l"
+DEVICELIST_tci6614-evm = "c6614"
+DEVICELIST_k2hk-evm    = "k2k k2h"
+DEVICELIST_k2e-evm     = "k2e"
+DEVICELIST_k2l-evm     = "k2l"
 
 PACKAGES =+ "${PN}-test"
 


