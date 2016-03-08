Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA81BE008DB; Tue,  8 Mar 2016 14:37:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B31B6E00833
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 14:37:45 -0800 (PST)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3Q008EWS6WZU70@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 08 Mar 2016 16:37:44 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=-maSNwBTpaiNPkYT4NMA:9
Received: by 100.15.86.14 with SMTP id 399de3d7; Tue, 08 Mar 2016 22:37:44 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B2538161EF9;	Tue,
	8 Mar 2016 17:37:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 08 Mar 2016 17:37:41 -0500
Message-id: <1457476663-12641-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] dspdce-fw: replace mkdir/cp with install
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
X-List-Received-Date: Tue, 08 Mar 2016 22:37:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 6c6bb2a..3979ce9 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -48,8 +48,8 @@ do_compile() {
 TARGET = "dra7-dsp1-fw.xe66"
 
 do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}.${BPN}
+    install -d ${D}${base_libdir}/firmware
+    install -m 0644 ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}.${BPN}
 }
 
 ALTERNATIVE_${PN} = "dra7-dsp1-fw.xe66"
-- 
2.2.0


