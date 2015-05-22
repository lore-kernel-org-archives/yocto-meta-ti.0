Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8BDCE009EB; Fri, 22 May 2015 11:18:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 585C9E009EA
	for <meta-ti@yoctoproject.org>; Fri, 22 May 2015 11:18:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 523DE52A85; Fri, 22 May 2015 18:18:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150522181847.523DE52A85@arago-project.org>
Date: Fri, 22 May 2015 18:18:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-sysbios: Add version 6.41.02.41
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
X-List-Received-Date: Fri, 22 May 2015 18:18:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 38484e132f584017f2a21ea1577332aeaddba6a1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=38484e132f584017f2a21ea1577332aeaddba6a1

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri May  8 19:59:48 2015 +0000

ti-sysbios: Add version 6.41.02.41

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-sysbios_6.41.02.41.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb b/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
new file mode 100644
index 0000000..fcad086
--- /dev/null
+++ b/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
@@ -0,0 +1,14 @@
+require ti-sysbios.inc
+
+PV = "6_41_02_41"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=a4af75ec6d586c5267c71075eebff418"
+
+SRC_URI[sysbiosbin.md5sum] = "65deff27110c2af87a3c71fea3c0345e"
+SRC_URI[sysbiosbin.sha256sum] = "2c47b4a3aa9513d10e5811a8ac7ed1d6ce3d13df57a0bffe10d8cabaf228c76f"
+
+TI_BIN_UNPK_CMDS=""
+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"


