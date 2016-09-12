Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80B59E00C41; Mon, 12 Sep 2016 15:42:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42BDCE00A6A
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 15:41:17 -0700 (PDT)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODE008Y0XOD0590@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Sep 2016 17:41:02 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=0EEtO-AaOsL-nq0t6JsA:9
Received: by 100.15.86.14 with SMTP id 695af578; Mon, 12 Sep 2016 22:41:02 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 8E64916212B;	Mon, 12 Sep 2016 18:41:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 12 Sep 2016 18:40:56 -0400
Message-id: <1473720059-26466-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1473720059-26466-1-git-send-email-denis@denix.org>
References: <1473720059-26466-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/8] amx3-cm3: update to 1.9.2 version
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
X-List-Received-Date: Mon, 12 Sep 2016 22:42:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 448a5d3..5a2b08b 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "1.9.1"
-PR = "r3"
+PV = "1.9.2"
+PR = "r0"
 
-SRCREV = "97c2c32d0bc8ca0254710dcb5df055aa9a569ae6"
+SRCREV = "7eb9c0856a9e8b3b42bf64f761da135852b8eea7"
 BRANCH ?= "ti-v4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.7.4


