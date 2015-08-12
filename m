Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A14A3E009C3; Tue, 11 Aug 2015 17:13:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41451E007B1
	for <meta-ti@yoctoproject.org>; Tue, 11 Aug 2015 17:13:41 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSY00ATY0MBASM0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 11 Aug 2015 19:13:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=3eCaaMhoVjIs6Cyxu6kA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 350BA161B72;	Tue,
	11 Aug 2015 20:13:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 11 Aug 2015 20:13:22 -0400
Message-id: <1439338402-20616-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] cuia: revert to clean in do_compile, disable automatic in do_configure
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
X-List-Received-Date: Wed, 12 Aug 2015 00:13:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to unconditionally clean the sources before building the first time,
due to wrong binaries present. But calling clean twice also causes failure.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cuia/cuia_1.0.0.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/cuia/cuia_1.0.0.13.bb b/recipes-bsp/cuia/cuia_1.0.0.13.bb
index a9024d2..e048f6a 100644
--- a/recipes-bsp/cuia/cuia_1.0.0.13.bb
+++ b/recipes-bsp/cuia/cuia_1.0.0.13.bb
@@ -11,8 +11,11 @@ SRC_URI[cuia.sha256sum] = "f16d138a9146fdc7d52cba77bd30596da65835f6ffe4092baf2b3
 
 S = "${WORKDIR}/cuia_${CUIA_PV}${CUIA_PVExtra}"
 
+CLEANBROKEN = "1"
+
 do_compile () {
 	cd ${S}
+	oe_runmake clean
 	oe_runmake all
 }
 
-- 
2.2.0


