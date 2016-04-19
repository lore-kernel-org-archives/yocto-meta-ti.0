Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B017E00F0A; Tue, 19 Apr 2016 15:06:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AC73E00DFD
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:05:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9B13A52A16; Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160419220558.9B13A52A16@arago-project.org>
Date: Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : pktlib-rtos: Add RTOS package for pktlib
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
X-List-Received-Date: Tue, 19 Apr 2016 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1061600edebabbe146562a13ba7b744078988cc4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1061600edebabbe146562a13ba7b744078988cc4

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Apr 20 03:43:39 2016 +0000

pktlib-rtos: Add RTOS package for pktlib

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pktlib/pktlib-rtos_git.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
new file mode 100644
index 0000000..0471156
--- /dev/null
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -0,0 +1,13 @@
+inherit ti-pdk
+require pktlib.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " rm-lld-rtos \
+                   qmss-lld-rtos \
+                   cppi-lld-rtos \
+"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2l-evm = "k2l"


