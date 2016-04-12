Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEAF5E00EBA; Tue, 12 Apr 2016 16:08:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C24EE00522
	for <meta-ti@yoctoproject.org>; Tue, 12 Apr 2016 16:08:51 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00DG3MYQQC90@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Apr 2016 18:08:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=mDV3o1hIAAAA:8
	a=q2PMpzx2yoqiNGsodZUA:9 a=XN_1ebidA8EA:10
Received: by 100.15.86.14 with SMTP id 082e199c; Tue, 12 Apr 2016 23:08:50 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 51C33161F9C;	Tue,
	12 Apr 2016 19:08:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 12 Apr 2016 19:08:49 -0400
Message-id: <1460502529-16092-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] iqn2-lld: fix -march gcc flag, as cortex-a15 belongs to armv7ve
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
X-List-Received-Date: Tue, 12 Apr 2016 23:08:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

https://gcc.gnu.org/ml/gcc-cvs/2014-01/msg00982.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
index 4e68116..40a8ea7 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -8,6 +8,10 @@ PR = "${INC_PR}.0"
 
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
+do_configure () {
+	sed -i -e 's/march=armv7-a/march=armv7ve/' build/armv7/libiqn2_aearmv7.mk
+}
+
 do_compile () {
 	oe_runmake clean
 	oe_runmake lib
-- 
2.2.0


