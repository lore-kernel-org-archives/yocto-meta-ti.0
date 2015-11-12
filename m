Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A9EAE00C61; Thu, 12 Nov 2015 14:35:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A21CE00C56
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2015 14:35:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0C9FE52ACD; Thu, 12 Nov 2015 22:35:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151112223551.0C9FE52ACD@arago-project.org>
Date: Thu, 12 Nov 2015 22:35:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : HACK: ti-ipc: temporarily use k2e variables for k2g platform
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
X-List-Received-Date: Thu, 12 Nov 2015 22:35:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: f6fd332ad50d5303c6b1dad2d35079642b0ca893
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f6fd332ad50d5303c6b1dad2d35079642b0ca893

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 13 03:23:44 2015 +0000

HACK: ti-ipc: temporarily use k2e variables for k2g platform

Full support is not yet available, but should unblock k2g builds

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index c2ecf57..a6b6a90 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -26,7 +26,7 @@ PLATFORM_dra7xx = "DRA7XX"
 PLATFORM_k2hk-evm = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e-evm = "66AK2E"
-PLATFORM_k2g-evm = "66AK2G"
+PLATFORM_k2g-evm = "66AK2E"
 
 DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
@@ -34,7 +34,7 @@ DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e-evm = "lad_66ak2e"
-DAEMON_k2g-evm = "lad_66ak2g"
+DAEMON_k2g-evm = "lad_66ak2e"
 
 inherit autotools-brokensep pkgconfig update-rc.d
 


