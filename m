Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33126E008FF; Sun, 26 Aug 2018 20:19:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A229AE008DD
	for <meta-ti@yoctoproject.org>; Sun, 26 Aug 2018 20:19:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7R3JMmB050490
	for <meta-ti@yoctoproject.org>; Sun, 26 Aug 2018 22:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535339962;
	bh=8ivEeZvCtDgHKsHag1Au+zJ0jV5w2OVYIJI662NrpUU=;
	h=From:To:CC:Subject:Date;
	b=GaHsU13VS/IFkqSG9bcwPS+5SvEpYiSfywg4p0MooZtwa6mxjxJdKX9b0835i6amM
	zyuHspVY/xlOhpXaHf5hrEeLpZuAm+BU8N2+82lQTXOiwjkpAj2ArcPEGO0c3HFU8B
	WLMLMZhVQ3O5O8HfJEzm+mqJBUA7GLpwqf+dRn0w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7R3JM4A022170
	for <meta-ti@yoctoproject.org>; Sun, 26 Aug 2018 22:19:22 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Sun, 26 Aug 2018 22:19:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Sun, 26 Aug 2018 22:19:22 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7R3JM1e030207;
	Sun, 26 Aug 2018 22:19:22 -0500
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w7R3JMx02297; Sun, 26 Aug 2018 22:19:22 -0500 (CDT)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 26 Aug 2018 22:19:14 -0500
Message-ID: <1535339954-20697-1-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] pru-icss_git.bb: add am65x examples, Lab_0,5
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
X-List-Received-Date: Mon, 27 Aug 2018 03:19:24 -0000
Content-Type: text/plain

This updates the commit ID of the PRU Software Support Package
which is pulled into the SDK. The updated PRU Software Support
Package includes:

added am65x resources:
PRU_Halt example
PRU_MAC_Multiply_Accum example
ICSSG header files

added Lab_0:
this provides a "Hello World" style beginning Linux example for
every TI processor with a supported PRU (am335x, am437x, am57x,
k2g, am65x).

expanded Lab_5:
expanded Lab 5 to provide a more advanced PRU Linux example for
every TI processor with a supported PRU (am335x, am437x, am57x,
k2g, am65x).

Kernel 4.14 new features:
updated resource table for all examples and labs to match the
new template introduced in kernel 4.14

Code cleanup/bug fixes:
update RPMsg examples to provide a more elegent way to provide
the max message length.
updated Linker Command files to better match TRM.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index e150076ec0a2..ff8f4a4ab321 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "1d9249c012005a669a6ffb2f76255d72ed5c0e4c"
+SRCREV = "78bef8fcc5204129a1da6ba015563c904478f568"
 
-PV = "5.2.1"
-PR = "r2"
+PV = "5.3.0"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1


