Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 765A8E009A7; Fri, 23 May 2014 12:18:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EAFAE00BC3
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 12:17:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0983652A8F; Fri, 23 May 2014 19:17:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140523191759.0983652A8F@arago-project.org>
Date: Fri, 23 May 2014 19:17:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : setup-defconfig: allow use of in-kernel config fragments
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
X-List-Received-Date: Fri, 23 May 2014 19:18:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 901b6c2b244ad5dd1c60d3fcbb0631577c051fcd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=901b6c2b244ad5dd1c60d3fcbb0631577c051fcd

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Fri May 23 02:08:32 2014 +0000

setup-defconfig: allow use of in-kernel config fragments

* Allow the use of in-kernel config fragments instead of only
  pulling config fragments from the OE meta data.
* The absolute path to the config fragment is used to allow
  pointing to different fragment locations.
* Update the linux-ti-staging_3.12 recipe which uses config
  fragments to specify the absolute path

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    3 ++-
 recipes-kernel/linux/setup-defconfig.inc      |   24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index dbb49b3..cb289c4 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -46,7 +46,8 @@ PV = "3.12.20"
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
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


