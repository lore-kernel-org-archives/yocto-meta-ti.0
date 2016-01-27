Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB4FDE00B8B; Wed, 27 Jan 2016 12:55:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4770EE00B9C
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:54:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1A69D52ABC; Wed, 27 Jan 2016 20:54:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205450.1A69D52ABC@arago-project.org>
Date: Wed, 27 Jan 2016 20:54:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : qmss-lld-rtos: Add RTOS package for QMSS LLD
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
X-List-Received-Date: Wed, 27 Jan 2016 20:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5586a8a5082e9c66bd3110c97c91110bf05e6d94
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5586a8a5082e9c66bd3110c97c91110bf05e6d94

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jan 27 03:16:47 2016 +0000

qmss-lld-rtos: Add RTOS package for QMSS LLD

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
new file mode 100644
index 0000000..4dbc591
--- /dev/null
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -0,0 +1,12 @@
+inherit ti-pdk
+
+require qmss-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " rm-lld-rtos"
+
+XDCARGS_k2hk-evm = "k2h k2k"
+XDCARGS_k2l-evm = "k2l"
+XDCARGS_k2e-evm = "k2e"
+XDCARGS_k2g-evm = "k2g"


