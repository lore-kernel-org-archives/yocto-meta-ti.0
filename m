Return-Path: <eballetbo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DD0AE00877; Wed,  8 Oct 2014 06:48:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A91FE007C1
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 06:48:08 -0700 (PDT)
Received: by mail-wg0-f42.google.com with SMTP id z12so11451213wgg.13
	for <meta-ti@yoctoproject.org>; Wed, 08 Oct 2014 06:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N0DRmtpakknliahXiESDxJXazL0WSSGKrIeKUB6BRM0=;
	b=fzbVAib78MOjRY0iSzCAupfAnCLpL3c8szWadqemeBrF4CsnwfHqEYzJiCmyk8H3QU
	DjKMgqbKO25xEtWX7ZTipqAVUPZekU/2sI/o+ozkTaIWFczEQHlVBMKTglE11PxIiQJ/
	DVTUNkmcACkZKUMP0hcOgbOtJxHUWL/SITXvv3nynEdPkSgATVhBDkpgFNZ7agdprO9/
	0MbaCRsKVfRk0NFhkq51I18EpNLbSvWycwjF+M0syfsPOsFofOg0QtVsQmZ5wBcX3SU8
	PsEuYs4k8o5sfCN+t30T3ahrbzqN2KCbVuvtDQZIFTC+jH6ujUf4VqnU5N9Z+rfd2k9k
	pmGQ==
X-Received: by 10.180.38.10 with SMTP id c10mr11587883wik.57.1412776087233;
	Wed, 08 Oct 2014 06:48:07 -0700 (PDT)
Received: from localhost.localdomain (43.Red-2-139-180.staticIP.rima-tde.net.
	[2.139.180.43])
	by mx.google.com with ESMTPSA id p1sm158375wjy.22.2014.10.08.06.48.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Oct 2014 06:48:06 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
To: meta-ti@yoctoproject.org,
	ebutera@gmail.com,
	martinez.javier@gmail.com
Date: Wed,  8 Oct 2014 15:47:44 +0200
Message-Id: <1412776066-4991-2-git-send-email-eballetbo@iseebcn.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
References: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH 1/3] ti-dmai: Fix build with recent kernels and compilers.
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
X-List-Received-Date: Wed, 08 Oct 2014 13:48:15 -0000

Remove unused includes that only redefine some typedefs already defined in
other includes and add the --sysroot flag to fix a linkage problem.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 .../dmai/ti-dmai/remove-unneeded-includes.patch    | 26 ++++++++++++++++++++++
 recipes-ti/dmai/ti-dmai_svn.bb                     |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch

diff --git a/recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch b/recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
new file mode 100644
index 0000000..cfd325a
--- /dev/null
+++ b/recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
@@ -0,0 +1,26 @@
+Index: a/packages/ti/sdo/dmai/Makefile
+===================================================================
+--- a/packages/ti/sdo/dmai/Makefile
++++ b/packages/ti/sdo/dmai/Makefile
+@@ -107,7 +107,7 @@ XDCPATH	+= $(XDC_INSTALL_DIR)/packages;$
+ 
+ CPP_FLAGS	+= -I$(XDC_INSTALL_DIR)/packages -I$(DMAI_INSTALL_DIR)/packages -I$(CE_INSTALL_DIR)/packages -I$(FC_INSTALL_DIR)/packages -I$(XDAIS_INSTALL_DIR)/packages -I$(CODEC_INSTALL_DIR)/packages -DDmai_Device_$(PLATFORM_DEVICE)
+ 
+-GCC_CPP_FLAGS	+= $(CPP_FLAGS) -I$(LINUXKERNEL_INSTALL_DIR)/include -I$(LINUXKERNEL_INSTALL_DIR)/arch/arm/include -I$(LINUXKERNEL_INSTALL_DIR)/arch/arm/$(PLATFORM_ARCH)/include $(HAVE_AUTOCONFIG) -I$(CMEM_INSTALL_DIR)/packages -I$(LINK_INSTALL_DIR) -DDmai_BuildOs_linux -Dxdc_target_types__=gnu/targets/std.h -I$(LINUXLIBS_INSTALL_DIR)/include -Dxdc_target_name__=arm/GCArmv5T
++GCC_CPP_FLAGS	+= $(CPP_FLAGS) $(HAVE_AUTOCONFIG) -I$(CMEM_INSTALL_DIR)/packages -I$(LINK_INSTALL_DIR) -DDmai_BuildOs_linux -Dxdc_target_types__=gnu/targets/std.h -I$(LINUXLIBS_INSTALL_DIR)/include -Dxdc_target_name__=arm/GCArmv5T
+ C64P_CPP_FLAGS	+= $(CPP_FLAGS) -I$(BIOS_INSTALL_DIR)/packages/ti/bios/include -I$(BIOS_INSTALL_DIR)/packages -DDmai_BuildOs_bios -Dxdc_target__='<ti/targets/std.h>' -I$(CODEGEN_INSTALL_DIR)/include -mv6400+ -pdse225 -eo$(PLATFORM_DEVICE).o$(EXT)
+ 
+ GCC_C_FLAGS	+= $(C_FLAGS) -Wall 
+Index: a/packages/ti/sdo/dmai/apps/Makefile.app
+===================================================================
+--- a/packages/ti/sdo/dmai/apps/Makefile.app
++++ b/packages/ti/sdo/dmai/apps/Makefile.app
+@@ -121,7 +121,7 @@ C64P_C_FLAGS	= $(C_FLAGS)
+ GCC_CPP_FLAGS  	= $(CPP_FLAGS) -I$(LINUXKERNEL_INSTALL_DIR)/include
+ C64P_CPP_FLAGS	= $(CPP_FLAGS) -pdse225 -I$(CODEGEN_INSTALL_DIR)/include -mv6400+ -I$(BIOS_INSTALL_DIR)/packages/ti/bios/include -eo$(PLATFORM_DEVICE).o$(EXT)
+ 
+-GCC_LD_FLAGS	= $(LD_FLAGS) -lpthread -lm -L$(LINUXLIBS_INSTALL_DIR)/lib -lasound
++GCC_LD_FLAGS	= $(LD_FLAGS) -lpthread -lm --sysroot=$(PKG_CONFIG_SYSROOT_DIR) -L$(LINUXLIBS_INSTALL_DIR)/lib -lasound
+ C64P_LD_FLAGS	= $(LD_FLAGS) -z -w -x -c -i$(RTDX_INSTALL_DIR)/packages/ti/rtdx/iom/lib/debug -i$(RTDX_INSTALL_DIR)/packages/ti/rtdx/cio/lib/release -i$(RTDX_INSTALL_DIR)/packages/ti/rtdx/lib/c6000 
+ 
+ SOURCES 	= $(wildcard *.c)
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 536bb78..4a91b9b 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54
 
 # This package has high dependence on kernel, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "o"
+PR_append = "p"
 
 DMAIBRANCH_dm6446     = "trunk"
 DMAIBRANCH_dm6467     = "branches/GITPSP_INT_101009"
@@ -34,6 +34,7 @@ SRCREV               ?= "UNDEFINED_SRCREV"
 
 SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
                    file://r642-fix-config-bld.diff;striplevel=3 \
+                   file://remove-unneeded-includes.patch \
                  "
 
 INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
1.9.1


