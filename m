Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68B59E006DB; Tue,  1 Jul 2014 06:36:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D88B4E006CD
	for <meta-ti@yoctoproject.org>; Tue,  1 Jul 2014 06:36:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s61DaDGo031093
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 08:36:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s61DaDoN011127
	for <meta-ti@yoctoproject.org>; Tue, 1 Jul 2014 08:36:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 08:36:13 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s61DaAUf019441;	Tue, 1 Jul 2014 08:36:11 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Jul 2014 08:36:06 -0500
Message-ID: <1404221769-7903-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/4] dra7xx: create DRA7xx include file for new SOC Family
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
X-List-Received-Date: Tue, 01 Jul 2014 13:36:30 -0000
Content-Type: text/plain

* Create the dra7xx.inc file which inherits the omap-a15.inc file
  and then adds the dra7xx as another valid SOC_FAMILY setting.
* The addition of the dra7xx SOC_FAMILY is done while still keeping
  access to the omap-a15 family.  What this means is that omap-a15
  can apply to omap5-evm, dra7xx-evm, and am57xx-evm.  Then the
  dra7xx family can be used to differentiate between omap5 and
  dra7xx based devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/include/dra7xx.inc |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 conf/machine/include/dra7xx.inc

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
new file mode 100644
index 0000000..fd0ecfe
--- /dev/null
+++ b/conf/machine/include/dra7xx.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/omap-a15.inc
+SOC_FAMILY_append = ":dra7xx"
-- 
1.7.9.5


