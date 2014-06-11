Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFE09E00BF6; Tue, 10 Jun 2014 19:29:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98345E00BEE
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 19:29:41 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B3F7252AC8; Wed, 11 Jun 2014 02:29:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140611022935.B3F7252AC8@arago-project.org>
Date: Wed, 11 Jun 2014 02:29:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: linux: add K2L and K2E DTB for RT build
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
X-List-Received-Date: Wed, 11 Jun 2014 02:29:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 72138932ea6acd6a49fa0749853d6c22cac6d670
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=72138932ea6acd6a49fa0749853d6c22cac6d670

Author: Hao Zhang <hzhang@ti.com>
Date:   Tue Jun 10 07:29:45 2014 +0000

keystone: linux: add K2L and K2E DTB for RT build

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index eb4bbd2..70073f9 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -14,6 +14,8 @@ MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
+KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
+KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 


