Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26CD5E00951; Mon, 20 Jun 2016 15:44:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B2D2E005A9
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 15:44:36 -0700 (PDT)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9300ECQDUBDT10@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 20 Jun 2016 17:44:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=Y8EQVJ6_S_ZNczpf4tMA:9
Received: by 100.15.86.14 with SMTP id 7b11b895; Mon, 20 Jun 2016 22:44:35 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 99BCF162044;	Mon,
	20 Jun 2016 18:44:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Jun 2016 18:44:33 -0400
Message-id: <20160620224434.22030-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 1/2] amx3-cm3: update to the latest for am3 ddr fixes
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
X-List-Received-Date: Mon, 20 Jun 2016 22:44:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 7d4626b..448a5d3 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -4,9 +4,9 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.1"
-PR = "r2"
+PR = "r3"
 
-SRCREV = "730f0695ca2dda65abcff5763e8f108517bc0d43"
+SRCREV = "97c2c32d0bc8ca0254710dcb5df055aa9a569ae6"
 BRANCH ?= "ti-v4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.9.0


