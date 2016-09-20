Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E388FE00B5F; Tue, 20 Sep 2016 08:37:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Tue, 20 Sep 2016 08:37:37 PDT
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93523E00B48
	for <meta-ti@yoctoproject.org>; Tue, 20 Sep 2016 08:37:37 -0700 (PDT)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODT00EL84M91S50@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 20 Sep 2016 09:37:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=E0SNWo-40AcjroOgFVIA:9
Received: by 100.15.110.130 with SMTP id 5d89d438;
	Tue, 20 Sep 2016 14:37:31 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 96F59162137;	Tue, 20 Sep 2016 10:37:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Sep 2016 10:37:19 -0400
Message-id: <1474382239-24140-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] common-csl-ip-rtos: add support for k2e-hs-evm
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
X-List-Received-Date: Tue, 20 Sep 2016 15:37:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 877b230..d5fb83e 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,5 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,6 +16,7 @@ LIMSOCS_omap-a15 = "am571x am572x"
 LIMSOCS_k2hk-evm = "k2h k2k"
 LIMSOCS_k2l-evm = "k2l"
 LIMSOCS_k2e-evm = "k2e"
+LIMSOCS_k2e-hs-evm = "k2e"
 LIMSOCS_k2g-evm = "k2g"
 
 export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
-- 
2.7.4


