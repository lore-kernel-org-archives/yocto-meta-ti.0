Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0A01E00C5D; Thu, 12 Nov 2015 06:20:26 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40864E00C55
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2015 06:20:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 80F2B52AC3; Thu, 12 Nov 2015 14:20:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151112142000.80F2B52AC3@arago-project.org>
Date: Thu, 12 Nov 2015 14:20:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc: add k2g platform variables
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
X-List-Received-Date: Thu, 12 Nov 2015 14:20:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a03cf927e888d451c1aa8abd5ae782ec45c698c9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a03cf927e888d451c1aa8abd5ae782ec45c698c9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov 12 20:17:17 2015 +0000

ti-ipc: add k2g platform variables

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index e1432e0..c2ecf57 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -26,6 +26,7 @@ PLATFORM_dra7xx = "DRA7XX"
 PLATFORM_k2hk-evm = "TCI6638"
 PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e-evm = "66AK2E"
+PLATFORM_k2g-evm = "66AK2G"
 
 DAEMON = "UNKNOWN"
 DAEMON_omap5-evm = "lad_omap54xx_smp"
@@ -33,6 +34,7 @@ DAEMON_dra7xx = "lad_dra7xx"
 DAEMON_k2hk-evm = "lad_tci6638"
 DAEMON_k2l-evm = "lad_tci6630"
 DAEMON_k2e-evm = "lad_66ak2e"
+DAEMON_k2g-evm = "lad_66ak2g"
 
 inherit autotools-brokensep pkgconfig update-rc.d
 


