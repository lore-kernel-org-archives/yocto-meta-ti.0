Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A184AE00B85; Thu, 22 May 2014 13:08:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EE66E00A2F
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 13:08:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MK8bGp018714
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 15:08:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MK8b9q014281
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 15:08:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 May 2014 15:08:37 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4MK8YZ4006417;	Thu, 22 May 2014 15:08:36 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 May 2014 15:08:32 -0500
Message-ID: <1400789313-13523-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 3/4] setup-defconfig: allow use of in-kernel config fragments
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
X-List-Received-Date: Thu, 22 May 2014 20:08:48 -0000
Content-Type: text/plain

* Allow the use of in-kernel config fragments instead of only
  pulling config fragments from the OE meta data.
* The absolute path to the config fragment is used to allow
  pointing to different fragment locations.
* Update the linux-ti-staging_3.12 recipe which uses config
  fragments to specify the absolute path

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Use absolute paths in the config fragment list instead of
      just searching two paths inside of setup-config.inc.
    * Update the linux-ti-staging_3.12 kernel recipe which uses
      config fragments to use the absolute path to the fragments.
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    3 ++-
 recipes-kernel/linux/setup-defconfig.inc      |   24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index d555b04..5c4d669 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -46,7 +46,8 @@ PV = "3.12.17"
 MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_CONFIG_FRAGMENTS = "baseport.cfg connectivity.cfg ipc.cfg"
+KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/baseport.cfg ${WORKDIR}/connectivity.cfg \
+                           ${WORKDIR}/ipc.cfg"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 4277f26..dbfd0d4 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -27,9 +27,31 @@ do_configure() {
         yes '' | oe_runmake oldconfig
     fi
 
-    # check for fragments
+    # Check for kernel config fragments.  The assumption is that the config
+    # fragment will be specified with the absolute path.  For example:
+    #   * ${WORKDIR}/config1.cfg
+    #   * ${S}/config2.cfg
+    # Iterate through the list of configs and make sure that you can find
+    # each one.  If not then error out.
+    # NOTE: If you want to override a configuration that is kept in the kernel
+    #       with one from the OE meta data then you should make sure that the
+    #       OE meta data version (i.e. ${WORKDIR}/config1.cfg) is listed
+    #       after the in kernel configuration fragment.
+    # Check if any config fragments are specified.
     if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
     then
+        for f in ${KERNEL_CONFIG_FRAGMENTS}
+        do
+            # Check if the config fragment was copied into the WORKDIR from
+            # the OE meta data
+            if [ ! -e "$f" ]
+            then
+                echo "Could not find kernel config fragment $f"
+                exit 1
+            fi
+        done
+
+        # Now that all the fragments are located merge them.
         ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
         yes '' | oe_runmake oldconfig
     fi
-- 
1.7.9.5


