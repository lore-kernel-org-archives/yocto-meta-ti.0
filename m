Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2A8EE00D73; Wed, 13 Apr 2016 13:26:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76725E00833
	for <meta-ti@yoctoproject.org>; Wed, 13 Apr 2016 13:26:22 -0700 (PDT)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5L00LXEA3BCS50@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 13 Apr 2016 15:26:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=-xSX5ngQ8JAfAVq0asMA:9
Received: by 100.15.86.14 with SMTP id 0067eea9; Wed, 13 Apr 2016 20:26:03 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 02A85161FA2;	Wed,
	13 Apr 2016 16:25:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 13 Apr 2016 16:25:58 -0400
Message-id: <1460579158-25415-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ti-softhsmv2: don't fail QA on real .so plugin in -dev pkg
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
X-List-Received-Date: Wed, 13 Apr 2016 20:26:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index 3143acd..a863c3a 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -39,6 +39,8 @@ FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
 FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "
 FILES_${PN}-dev += "${libdir}/softhsm/*.la ${libdir}/softhsm/lib*.so"
 
+INSANE_SKIP_${PN}-dev = "dev-elf"
+
 do_install_append() {
 	install -d ${D}${mntdir}/securedbv0
 	install -d ${D}${mntdir}/securedbv1
-- 
2.2.0


