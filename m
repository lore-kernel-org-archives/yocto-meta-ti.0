Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F138E007A2; Mon, 19 Sep 2016 16:00:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3827BE007A2
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 15:59:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D5E4052AC0; Mon, 19 Sep 2016 22:59:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160919225954.D5E4052AC0@arago-project.org>
Date: Mon, 19 Sep 2016 22:59:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine, u-boot-ti-staging: add am335x-hs-evm platform
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
X-List-Received-Date: Mon, 19 Sep 2016 23:00:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: e54d33089ade90354424f0c2f923ea040a656a94
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e54d33089ade90354424f0c2f923ea040a656a94

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 19 22:59:29 2016 +0000

conf/machine, u-boot-ti-staging: add am335x-hs-evm platform

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-hs-evm.conf                 |   14 ++++++++++++++
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    7 +++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
new file mode 100644
index 0000000..674a764
--- /dev/null
+++ b/conf/machine/am335x-hs-evm.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM335x HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM435x HS EVM
+
+require conf/machine/am335x-evm.conf
+
+UBOOT_MACHINE = "am335x_hs_evm_mmc_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 868109b..c3b55ac 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -53,6 +53,13 @@ do_compile_append_am437x-hs-evm () {
 	fi
 }
 
+do_compile_append_am335x-hs-evm () {
+	if [ -f ${S}/u-boot-spl_HS_ISSW ]; then
+		rm -rf ${S}/MLO
+		cp ${S}/u-boot-spl_HS_ISSW ${S}/MLO
+	fi
+}
+
 do_install_append () {
 	if [ -f ${S}/${UBOOT_HS_XLD_BINARY} ]; then
 		install ${S}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}


