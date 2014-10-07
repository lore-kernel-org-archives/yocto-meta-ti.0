Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4A06E0076C; Tue,  7 Oct 2014 12:43:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61BF3E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:43:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 42CD6529CF; Tue,  7 Oct 2014 19:43:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141007194347.42CD6529CF@arago-project.org>
Date: Tue,  7 Oct 2014 19:43:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : common-csl-ip: (ti-csl) Moved from meta-arago and renamed
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
X-List-Received-Date: Tue, 07 Oct 2014 19:43:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c8f0bf96559005b606a0283b8d305ccb60fe4df6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c8f0bf96559005b606a0283b8d305ccb60fe4df6

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct  7 17:36:44 2014 +0000

common-csl-ip: (ti-csl) Moved from meta-arago and renamed

- Moved from meta-arago (where it was called ti-csl_git.bb)
  http://arago-project.org/git/?p=meta-arago.git;a=blob_plain;f=meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb;hb=HEAD
- Renamed it to common-csl-ip_git.bb
- This package provides chip support library interface files

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/common-csl-ip/common-csl-ip_git.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
new file mode 100644
index 0000000..fb5e6f8
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "TI CSL"
+LICENSE = "TI BSD"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
+
+COMPATIBLE_MACHINE = "keystone"
+ALLOW_EMPTY_${PN} = "1"
+
+PR = "r0"
+BRANCH="master"
+SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
+SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}${includedir}/ti/csl
+    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 
+    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
+}
+


