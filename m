Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17A7EE00CB4; Fri, 29 Apr 2016 16:54:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW,TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.13 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1B09E00C97
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 16:54:01 -0700 (PDT)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F006ZB6DLBE10@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 29 Apr 2016 18:53:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=iYSegVV4v752vjef4RAA:9
Received: by 100.15.86.14 with SMTP id 63c85a2a; Fri, 29 Apr 2016 23:53:45 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 26C35161FCE;	Fri,
	29 Apr 2016 19:53:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 29 Apr 2016 19:53:42 -0400
Message-id: <1461974024-2275-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] gcc-arm-none-eabi-native: suppress already stripped warning
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
X-List-Received-Date: Fri, 29 Apr 2016 23:54:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
index 971ae48..d3dba41 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
@@ -19,3 +19,5 @@ do_install() {
 }
 
 FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"
-- 
2.2.0


