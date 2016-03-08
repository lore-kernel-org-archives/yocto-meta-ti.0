Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1923EE00894; Mon,  7 Mar 2016 17:30:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F40CE008C1
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 17:30:12 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C718652AFD; Tue,  8 Mar 2016 01:30:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308013011.C718652AFD@arago-project.org>
Date: Tue,  8 Mar 2016 01:30:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : k2g-evm: add alsa to machine features list
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
X-List-Received-Date: Tue, 08 Mar 2016 01:30:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 45a1b62953a38354da45c7e3fde33a873dcac8a6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=45a1b62953a38354da45c7e3fde33a873dcac8a6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  8 03:18:32 2016 +0000

k2g-evm: add alsa to machine features list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2g-evm.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 9c7b4e0..14f286a 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/keystone.inc
 
+MACHINE_FEATURES += "alsa"
+
 UBOOT_MACHINE = "k2g_evm_config"
 
 BOOT_MONITOR_MAKE_TARGET = "k2g"


