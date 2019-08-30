Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF37EE00C25; Fri, 30 Aug 2019 10:29:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D734DE00AE6
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 10:29:05 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UHT5HA064448
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 12:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567186145;
	bh=rfc1pVR8reJhHS8/s3dX4M0UHxuydVHc95OZ/bevS9M=;
	h=From:To:CC:Subject:Date;
	b=DzagfbFIgpH6yDjY8CZ1IpnA+Lv2hzoXTWnwlmTIS9xlvFBeZW7OG/THY4gC8roWT
	qUe6pJQnzTsMeen+zbQHVZ8A/gAECQHxNLs0wxEobVms9kIvGhKijyvM2b9e6ldRoq
	DMfPA1hm1wer9eooEAVbKxnfN0MjEilhfdmO3pV4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UHT4ua121334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 12:29:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 12:29:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 12:29:04 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UHT3ka122532;
	Fri, 30 Aug 2019 12:29:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Aug 2019 13:10:58 -0400
Message-ID: <1567185058-17876-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v2] am65xx, j7-evm: add secondary serial console for Jailhouse
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
X-List-Received-Date: Fri, 30 Aug 2019 17:29:07 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* update commit message
* add SERIAL_CONSOLES_CHECK

 conf/machine/am65xx-evm.conf | 3 ++-
 conf/machine/j7-evm.conf     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 27bb0b0..15bffde 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -8,7 +8,8 @@ MACHINE_FEATURES += "touchscreen"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
-SERIAL_CONSOLES = "115200;ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index ca594e8..7b11ba7 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k3.inc
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
-SERIAL_CONSOLES = "115200;ttyS2"
+SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
-- 
2.7.4


