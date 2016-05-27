Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 583B6E00DFA; Thu, 26 May 2016 19:02:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28899E00DE6
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 19:02:22 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4D9A052AE9; Fri, 27 May 2016 02:02:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160527020221.4D9A052AE9@arago-project.org>
Date: Fri, 27 May 2016 02:02:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : k2g-evm: add opencl feature
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
X-List-Received-Date: Fri, 27 May 2016 02:02:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 3f2d7dff0025f10b01bad3af38b70236db456f23
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3f2d7dff0025f10b01bad3af38b70236db456f23

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon May 23 22:16:28 2016 +0000

k2g-evm: add opencl feature

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2g-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 125a949..860324c 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/keystone.inc
 
-MACHINE_FEATURES += "alsa"
+MACHINE_FEATURES += "alsa opencl"
 
 UBOOT_MACHINE = "k2g_evm_config"
 


