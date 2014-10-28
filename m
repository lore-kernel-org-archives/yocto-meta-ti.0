Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D7DBE0089E; Mon, 27 Oct 2014 19:04:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0554E0089E
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 19:04:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D7E7352A66; Tue, 28 Oct 2014 02:04:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141028020412.D7E7352A66@arago-project.org>
Date: Tue, 28 Oct 2014 02:04:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : boot-monitor: Update to latest tag 14.09
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
X-List-Received-Date: Tue, 28 Oct 2014 02:04:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: c06f25913317160e03d172df73919edf9bdf8554
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c06f25913317160e03d172df73919edf9bdf8554

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 28 01:48:32 2014 +0000

boot-monitor: Update to latest tag 14.09

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/boot-monitor/boot-monitor_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 6967be7..8273ce8 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -13,8 +13,8 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-#Tag "K2_BM_14.05"
-SRCREV = "0e3ffe1ea4a0cee38ae2406901b7cf4d5324b5e9"
+#Tag "K2_BM_14.09"
+SRCREV = "4b0287a3fa9c7a25c75bbe3a54f4ac2a92dc0aaa"
 
 BOOT_MONITOR_BINARY ?= "skern.bin"
 BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"


