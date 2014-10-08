Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1467DE0088A; Wed,  8 Oct 2014 11:10:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB44CE0076C
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 11:09:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9445452981; Wed,  8 Oct 2014 18:09:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008180957.9445452981@arago-project.org>
Date: Wed,  8 Oct 2014 18:09:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Enric Balletbo i Serra : ti-dmai: Fix build with recent kernels and compilers.
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
X-List-Received-Date: Wed, 08 Oct 2014 18:10:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f6c7946591dc9099855139be0e9e1a56474c6a7a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f6c7946591dc9099855139be0e9e1a56474c6a7a

Author: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Date:   Wed Oct  8 19:47:44 2014 +0000

ti-dmai: Fix build with recent kernels and compilers.

Remove unused includes that only redefine some typedefs already defined in
other includes and add the --sysroot flag to fix a linkage problem.

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../dmai/ti-dmai/remove-unneeded-includes.patch    |   26 ++++++++++++++++++++
 recipes-ti/dmai/ti-dmai_svn.bb                     |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)

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


