Return-Path: <d-senicic1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B2DFE009CF; Tue,  4 Sep 2018 11:48:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CE09E008E0
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2018 11:48:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84ImrHs010522
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 13:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536086933;
	bh=/sY5C4PiKutqebWnGkhKR1okhcciwYejza6l1xTr+RY=;
	h=From:To:CC:Subject:Date;
	b=Qz7wN+O1Jlzc6cyU5dcUAyU21IFIpQ5imBn10FJI5QUFigC1+cd1xGEN7jISka33K
	5EdhlyFMfVw5I90OJQNWlCegG+SupbDHIbYeDtjDn4GqEASU2Pum33go9BwvA6HWC9
	YSBGTMM11y7aaIGmmyTkWfRYIN5uHXdBg000DGw4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84Imr5S010037
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 13:48:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 13:48:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 4 Sep 2018 13:48:53 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84ImqTd031449;
	Tue, 4 Sep 2018 13:48:52 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 4 Sep 2018 14:48:50 -0400
Message-ID: <1536086930-8007-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] linux-ti-staging: Restore removed CMEM block in AM574x
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
X-List-Received-Date: Tue, 04 Sep 2018 18:48:54 -0000
Content-Type: text/plain

* Both CMEM blocks 0 and 1 are required for OpenVX.

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi b/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
index 9d207db..8fb3e87 100644
--- a/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
+++ b/recipes-kernel/linux/files/dra7xx/cmem-am574x.dtsi
@@ -9,6 +9,12 @@
                         no-map;
                         status = "okay";
                 };
+
+		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
+			reg = <0x0 0x40500000 0x0 0x100000>;
+			no-map;
+			status = "okay";
+		};
         };
 
         cmem {
@@ -25,5 +31,10 @@
                         memory-region = <&cmem_block_mem_0>;
                         cmem-buf-pools = <1 0x0 0x18000000>;
                 };
+
+		cmem_block_1: cmem_block@1 {
+			reg = <1>;
+			memory-region = <&cmem_block_mem_1_ocmc3>;
+		};
         };
 };
-- 
1.9.1


