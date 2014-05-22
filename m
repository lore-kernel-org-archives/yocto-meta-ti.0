Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9955CE00B8A; Thu, 22 May 2014 09:16:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58D36E00B71
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 09:16:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MGGPSh011313
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 11:16:25 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MGGPk1018513
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 11:16:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 May 2014 11:16:25 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4MGGHaW013978;	Thu, 22 May 2014 11:16:24 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 May 2014 11:16:15 -0500
Message-ID: <1400775376-28129-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
References: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] setup-defconfig: allow use of in-kernel config fragments
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
X-List-Received-Date: Thu, 22 May 2014 16:16:30 -0000
Content-Type: text/plain

* Allow the use of in-kernel config fragments instead of only
  pulling config fragments from the OE meta data.  The OE meta
  data fragments will still take precedence over in tree .cfg
  files.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/setup-defconfig.inc |   36 ++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 4277f26..fbe7e96 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -2,6 +2,10 @@
 # kernel version string.  such as the commit id
 KERNEL_LOCALVERSION ?= ""
 
+# KERNEL_CONFIG_DIR can be set to specify a subdirectory to search for
+# kernel configuration fragments
+KERNEL_CONFIG_DIR ?= ""
+
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
 
@@ -27,10 +31,38 @@ do_configure() {
         yes '' | oe_runmake oldconfig
     fi
 
-    # check for fragments
+    # Check for kernel config fragments.  First check the files copied from
+    # the OE meta data since we may want to override kernel config fragments
+    # in the recipe.  If you don't find the fragment in the OE meta data
+    # then check the kernel sources.  If you still can't find it then bail
+    # with an error.
+    # Check if any config fragments are specified.
     if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
     then
-        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
+        # Variable to hold the assembled list of fragments with absolute paths
+        configs=""
+
+        for f in ${KERNEL_CONFIG_FRAGMENTS}
+        do
+            # Check if the config fragment was copied into the WORKDIR from
+            # the OE meta data
+            if [ -e "${WORKDIR}/$f" ]
+            then
+                echo "Found config in workdir"
+                configs="$configs ""${WORKDIR}/$f"
+            # Check if the fragement is in the kernel sources
+            elif [ -e "${S}/${KERNEL_CONFIG_DIR}/$f" ]
+            then
+                echo "Found config in kernel"
+                configs="$configs ""${S}/${KERNEL_CONFIG_DIR}/$f"
+            else
+                echo "Could not find kernel config fragment $f"
+                exit 1
+            fi
+        done
+
+        # Now that all the fragments are located merge them.
+        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config ${configs} 1>&2 )
         yes '' | oe_runmake oldconfig
     fi
 }
-- 
1.7.9.5


