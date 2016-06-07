Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF94EE00C80; Tue,  7 Jun 2016 16:18:56 -0700 (PDT)
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
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4C8FE00C49
	for <meta-ti@yoctoproject.org>; Tue,  7 Jun 2016 16:18:52 -0700 (PDT)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8F00H65CREXJ90@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 Jun 2016 18:18:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=x5BwiFZGAAAA:8
	a=vqdLVzEKnnwTCi98ir0A:9
Received: by 100.15.86.14 with SMTP id 483f7f25; Tue, 07 Jun 2016 23:18:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F3852162042;	Tue,
	7 Jun 2016 19:18:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 07 Jun 2016 19:18:49 -0400
Message-id: <1465341529-20356-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] libdce: move from meta-arago
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
X-List-Received-Date: Tue, 07 Jun 2016 23:18:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.10.01.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-multimedia/libdce/libdce_3.00.10.01.bb

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
new file mode 100644
index 0000000..aa61cb6
--- /dev/null
+++ b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libdrm ti-ipc"
+
+SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
+SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
2.2.0


