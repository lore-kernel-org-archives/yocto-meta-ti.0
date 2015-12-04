Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53754E0097F; Fri,  4 Dec 2015 08:55:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFC9BE009C5
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 08:55:20 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4GtJco009707
	for <meta-ti@yoctoproject.org>; Fri, 4 Dec 2015 10:55:19 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4GtJwJ015742
	for <meta-ti@yoctoproject.org>; Fri, 4 Dec 2015 10:55:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 10:55:19 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB4GtJiR026527;	Fri, 4 Dec 2015 10:55:19 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 4 Dec 2015 11:55:09 -0500
Message-ID: <1449248109-27290-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mpm-transport: Change file permissions
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
X-List-Received-Date: Fri, 04 Dec 2015 16:55:25 -0000
Content-Type: text/plain

- Remove executable permission for json and include files.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 7d86196..812ae04 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -40,11 +40,11 @@ do_install() {
 	oe_runmake installbin BASE_DIR=${S} INSTALL_BIN_BASE_DIR=${D}/${bindir}
 
 	install -d ${D}${includedir}/
-	install -c -m 755 ${S}/include/* ${D}${includedir}/
+	install -c -m 644 ${S}/include/* ${D}${includedir}/
 
 	install -d ${D}${libdir}/
 	cp  -a ${S}/lib/* ${D}${libdir}/
 
 	install -d ${D}${sysconfdir}/mpm/
-	install -c -m 755 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
+	install -c -m 644 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
 }
-- 
1.9.1


