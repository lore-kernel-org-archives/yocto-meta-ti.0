Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79F6EE00DFF; Mon,  9 Jul 2018 17:55:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11274E00929
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2018 17:55:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6A0tLW9040313
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 19:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531184121;
	bh=siCx/557VkkFMdWHLx7W2F/AXrtAGQPsZtGnbJwFclI=;
	h=From:To:CC:Subject:Date;
	b=ie6BxUFTE0o1NikIVzB5n3QLysnz+Vkp4SYnTEIDyE4m5/7ztgdz2ua+qwTk2ALw3
	9OTT7u40mbgMDoTAbwIVJhkdiPEvK1nPBJiq6uWyQ7F9SWIjYQ0HjgZDqAItNyfu0J
	dV0rqw/+n6lWxCp9vrI6NegVuLujV16rDFwkTZ/0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A0tLpF025662
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 19:55:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 19:55:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 19:55:21 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A0tKat020665;
	Mon, 9 Jul 2018 19:55:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Jul 2018 00:53:56 +0000
Message-ID: <20180710005356.25288-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] am65xx-evm: add new k3-am654-pcie-usb3 DTBO file
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
X-List-Received-Date: Tue, 10 Jul 2018 00:55:22 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 2b214ce7..08dbc9e8 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLE = "115200 ttyS2"
 KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
     ti/k3-am654-evm-csi2-ov490.dtbo ti/k3-am654-evm-oldi-lcd1evm.dtbo \
-    ti/k3-am654-idk.dtbo ti/k3-am654-pcie-usb2.dtbo"
+    ti/k3-am654-idk.dtbo ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo"
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 
-- 
2.17.1


