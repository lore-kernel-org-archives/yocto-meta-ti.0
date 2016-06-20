Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80D29E00984; Mon, 20 Jun 2016 14:44:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CBD6E008BC
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 14:44:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6185B52975; Mon, 20 Jun 2016 21:43:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160620214359.6185B52975@arago-project.org>
Date: Mon, 20 Jun 2016 21:43:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am57xx-hs-evm: add AM5 HS platform config
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
X-List-Received-Date: Mon, 20 Jun 2016 21:44:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 1f91eb7883e1b579deafc01a68c6be4ebff0dcc7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1f91eb7883e1b579deafc01a68c6be4ebff0dcc7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun 21 03:39:51 2016 +0000

am57xx-hs-evm: add AM5 HS platform config

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-hs-evm.conf |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
new file mode 100644
index 0000000..a375017
--- /dev/null
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: AM57xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM57xx HS EVM
+
+require conf/machine/am57xx-evm.conf
+
+UBOOT_MACHINE = "am57xx_hs_evm_config"


