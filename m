Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C538E00E16; Fri, 30 Aug 2019 09:54:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D621E00E12
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:54:05 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs5po055030
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567184045;
	bh=I/vPfa9CRDqkVYJ/XUROE9/6sMG1KkbVMez+Cfhq5XU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z3kYOLvj6W9pbKYB3EZJ3QrWLHYwimbsGA6OtmVynkwdSIhToZ8D0aIDGAk8NXLJ/
	vO7Ff0COuH4eABFVh3XpZEoIU/s/jUy74Dzf7Xgf0NLB9QC2ctFA3CF2zJ617g24Sa
	jIG44xRy28LOsFCfERgUC3DNd3pOncebYFXzs0UQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGs5ha121704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:05 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:54:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:54:04 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs3EN024127;
	Fri, 30 Aug 2019 11:54:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Aug 2019 12:32:47 -0400
Message-ID: <1567182767-3817-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567182767-3817-1-git-send-email-j-stiffler@ti.com>
References: <1567182767-3817-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v4 3/3] jailhouse: use ramfs for linux-demo
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
X-List-Received-Date: Fri, 30 Aug 2019 16:54:10 -0000
Content-Type: text/plain

* Configure the linux-demo to use a ramfs for the linux inmate.
* Using JH_RAMFS_IMAGE, this can be set in some global conf.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v4 changes:
* Set default JH_RAMFS_IMAGE to INITRAMFS_IMAGE
* change warning to error and fix the message

 recipes-kernel/jailhouse/jailhouse_git.bb | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 546f154..0b52ecb 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -58,8 +58,10 @@ JH_SYSCONFIG_CELL ?= ""
 JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
 JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
 
+JH_RAMFS_IMAGE ?= "${INITRAMFS_IMAGE}"
+
 JH_CMDLINE ?= ""
-JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
+JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
 
 do_configure() {
 	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
@@ -101,6 +103,16 @@ do_install() {
 	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
 
 	install -d ${D}/boot
+	if [ -n "${JH_RAMFS_IMAGE}" ]
+	then
+		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
+		then
+			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
+		else
+			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
+			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
+		fi
+	fi
 
 	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
 		cd ${TOOLS_SRC_DIR}
@@ -110,6 +122,7 @@ do_install() {
 		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
 			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
 			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
+			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
 			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
 			${DEPLOY_DIR_IMAGE}/Image \
 			| tr -cd '\11\12\15\40-\176' \
@@ -143,9 +156,9 @@ CELLS = ""
 
 python __anonymous () {
     d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
-    initrd = d.getVar('INITRAMFS_IMAGE', True)
-    if initrd:
-        d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
+    if ramfs:
+        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
 
     # Setup DEPENDS and RDEPENDS to included cells
     cells = d.getVar('CELLS', True) or ""
-- 
2.7.4


