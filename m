Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A868E00823; Thu, 26 Apr 2018 10:56:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87FCCE005A9
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2018 10:56:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3QHuPR6026341
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2018 12:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524765385;
	bh=tz5XNciqxAKLT7xd0GFJijwiok8eVhMInuAwwXPuv2Y=;
	h=From:To:CC:Subject:Date;
	b=pV0eSkjOdGArlZn0W28CBgDOdPvJ1WBpVa5VxHxw6CZZmmtM7aoxpQLmaJqUSUqaK
	G5ndHThIEmgk3unOxelwcZAWLRl8q6ZN5JHWUAfph1obSjS61+8TxvMvALYcIz5/Fx
	m0ozGOvRm6fE1e2dkDAwJNPLFzRKEsSuUaGt9I5g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3QHuPQm008257
	for <meta-ti@yoctoproject.org>; Thu, 26 Apr 2018 12:56:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 26 Apr 2018 12:56:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 26 Apr 2018 12:56:25 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3QHuPag026426;
	Thu, 26 Apr 2018 12:56:25 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Apr 2018 13:46:01 -0400
Message-ID: <1524764762-17607-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 1/2] linux: cmem: flag dependent variables
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
X-List-Received-Date: Thu, 26 Apr 2018 17:56:27 -0000
Content-Type: text/plain

* Flag variables used in setup_cmem to force it to re-run when one changes.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/cmem.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 64d3264..74c1a0c 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -29,6 +29,11 @@ CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd101t2
 # Flag to enable CMEM injection
 RESERVE_CMEM ?= "0"
 
+# Variables which influence setup_cmem
+CMEM_VARS  = "RESERVE_CMEM CMEM_MACHINE"
+CMEM_VARS += "CMEM_DTSI ${@' '.join(map(lambda s: 'CMEM_DTSI_' + s, (d.getVar('CMEM_MACHINE') or '').split()))}"
+CMEM_VARS += "CMEM_DEVICETREE ${@' '.join(map(lambda s: 'CMEM_DEVICETREE_' + s, (d.getVar('CMEM_MACHINE') or '').split()))}"
+
 # Add correct cmem.dtsi to SRC_URI for each variant for a given machine
 python do_unpack() {
     old_overrides = d.getVar('OVERRIDES', False)
@@ -81,3 +86,4 @@ python do_setup_cmem() {
 }
 
 do_patch[postfuncs] += "do_setup_cmem"
+do_patch[vardeps] += "${CMEM_VARS}"
-- 
2.7.4


