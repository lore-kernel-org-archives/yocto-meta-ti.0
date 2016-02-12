Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 55142E00C8F; Fri, 12 Feb 2016 13:26:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0241E00C0B
	for <meta-ti@yoctoproject.org>; Fri, 12 Feb 2016 13:26:32 -0800 (PST)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.154])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2G00EOABFN2270@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Feb 2016 14:26:12 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=eIhxMilvRf8A:10 a=jFJIQSaiL_oA:10	a=sozttTNsAAAA:8
	a=3eQpwHYDbUnLp1XZdnMA:9
Received: by 100.15.86.14 with SMTP id 5f344ffd; Fri, 12 Feb 2016 20:26:12 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 502D8161EA1;	Fri,
	12 Feb 2016 15:05:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Feb 2016 15:04:59 -0500
Message-id: <1455307499-17748-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1455307499-17748-1-git-send-email-denis@denix.org>
References: <1455307499-17748-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] netcp-pa-fw: update to 3.0.1.8 version
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
X-List-Received-Date: Fri, 12 Feb 2016 21:26:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index 9fd2541..773ad7a 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "NETCP PA firmware for Keystone"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "1.0.0"
+PV = "3.0.1.8"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "55c708e391c5663a9ef0bb13970f2153f82fba36"
+SRCREV = "dd8db49ed57f8ac448451cc5e54973c71a99faea"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
@@ -49,7 +49,7 @@ ks2_pa_pdsp5_pam \
 do_install() {
 	install -d ${D}${base_libdir}/firmware
 	for f in ${FWBASENAME}; do
-		install -m 0644 ${S}/ti-keystone/$f-${PV}.bin ${D}${base_libdir}/firmware/$f.bin
+		install -m 0644 ${S}/ti-keystone/$f.bin ${D}${base_libdir}/firmware/$f.bin
 	done
 }
 
-- 
2.2.0


