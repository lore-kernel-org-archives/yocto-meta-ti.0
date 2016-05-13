Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CCFEE00B7A; Fri, 13 May 2016 12:30:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1A0DE00B48
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 12:30:31 -0700 (PDT)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7400COSRIASY10@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 13 May 2016 14:30:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=eMySOX5jHSl4LbVpDI4A:9
Received: by 100.15.86.14 with SMTP id 21ce63ed; Fri, 13 May 2016 19:30:10 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8FE5B161FF9;	Fri,
	13 May 2016 15:30:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 13 May 2016 15:30:07 -0400
Message-id: <1463167807-25654-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [fido][PATCH] libgbm: add latest version 10.0.0 from meta-arago
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
X-List-Received-Date: Fri, 13 May 2016 19:30:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/gbm/libgbm_10.0.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-graphics/gbm/libgbm_10.0.0.bb

diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
new file mode 100644
index 0000000..a55074a
--- /dev/null
+++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Userspace interface for the kernel GBM services."
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
+DEPENDS = "libdrm"
+
+inherit autotools pkgconfig
+
+BRANCH = "next"
+
+SRCREV = "96f37555c7e82a417b02051661377b10e6b3966e"
+
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
2.2.0


