Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 732C0E009CF; Fri, 21 Jun 2019 05:51:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26177E008A4
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 05:51:44 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LCpi41095252
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 07:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561121504;
	bh=uQRMug8cPo0CZra/+n6LNvM5QJnha4bo+VBeW16cD9I=;
	h=From:To:CC:Subject:Date;
	b=Q3gf7udEMxX/pLtnM4OQaasddBTy0SLzONritMoUoMaOm/3SNSdAaAa/WCGVsUfPo
	mOtUAXwDvI5Ho2XrJlQj5SAg5dpE7n5Hj8WUW7sQI5bPd/TK9hSl14rOY/AmJuQOp5
	b01o6wLpq5r2HrFE/mjZiKu5lm6IHRMs/72mdBhA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LCpiS1006347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 07:51:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 07:51:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 07:51:44 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LCphAW024479;
	Fri, 21 Jun 2019 07:51:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 21 Jun 2019 08:35:04 -0400
Message-ID: <1561120504-29275-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATCH] machines: k2*: restore original max_leb_cnt
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
X-List-Received-Date: Fri, 21 Jun 2019 12:51:46 -0000
Content-Type: text/plain

Restore max_leb_cnt so that the UBI/UBIFS fits into the board flash

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/k2e-evm.conf  | 2 +-
 conf/machine/k2g-evm.conf  | 2 +-
 conf/machine/k2hk-evm.conf | 2 +-
 conf/machine/k2l-evm.conf  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index e9f500f..662f5c8 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -22,7 +22,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index a8ddc66..7681a75 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -25,7 +25,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index de79de9..89386f1 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -22,7 +22,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index e326ba2..dddc01f 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -22,7 +22,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
-- 
2.7.4


