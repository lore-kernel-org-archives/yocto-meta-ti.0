Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10042E00404; Mon, 19 Sep 2016 10:00:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.15 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 593B4E0044F
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 10:00:05 -0700 (PDT)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODR00AKYGJASM40@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 19 Sep 2016 11:59:50 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=LPV0avukMwGJiCSBPqIA:9
Received: by 100.15.110.130 with SMTP id 2a734bce;
	Mon, 19 Sep 2016 16:59:49 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 2810B16213C;	Mon, 19 Sep 2016 12:59:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 19 Sep 2016 12:59:29 -0400
Message-id: <1474304370-18201-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1474304370-18201-1-git-send-email-denis@denix.org>
References: <1474304370-18201-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/6] conf/machine, u-boot-ti-staging: add am335x-hs-evm platform
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
X-List-Received-Date: Mon, 19 Sep 2016 17:00:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-hs-evm.conf                 | 14 ++++++++++++++
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |  7 +++++++
 2 files changed, 21 insertions(+)
 create mode 100644 conf/machine/am335x-hs-evm.conf

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
-- 
2.7.4


