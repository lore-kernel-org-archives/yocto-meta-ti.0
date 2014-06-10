Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E7F3E00BEC; Mon,  9 Jun 2014 18:29:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85951E00BE3
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 18:29:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5A1TmHn028345
	for <meta-ti@yoctoproject.org>; Mon, 9 Jun 2014 20:29:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5A1Tm8v014704
	for <meta-ti@yoctoproject.org>; Mon, 9 Jun 2014 20:29:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 9 Jun 2014 20:29:47 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5A1TlUV021861;
	Mon, 9 Jun 2014 20:29:47 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1WuAsl-0003QI-6K; Mon, 09 Jun 2014 21:29:47 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 Jun 2014 21:29:45 -0400
Message-ID: <1402363785-13127-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] keystone: linux: add K2L and K2E DTB for RT build
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
X-List-Received-Date: Tue, 10 Jun 2014 01:29:57 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

---
 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    2 ++
 1 file changed, 2 insertions(+)

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
 
-- 
1.7.9.5


