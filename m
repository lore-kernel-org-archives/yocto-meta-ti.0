Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97DF8E00B3E; Tue, 13 Aug 2019 12:45:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C2DFE0090E
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 12:45:35 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DJjZuV083914
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565725535;
	bh=sAjW48oKbJqUvGOSTI27msYth8IRU0jWi85yDNk9yVM=;
	h=From:To:Subject:Date;
	b=WUQLUDx1ybJASU0U7k4V3sDtVXSDIV4Pi3thxoKLNCI+TVNUjWwBNACvx67ZLxupK
	T+6JZuOHyq+dPyf+WX5MX80N0FjwIvZ/APnzGTZW8wq5Fsf0BZht5wyG1skZpnZtAx
	kagIbsz5addE34HbHSX41jzh6B/C9hV6GLlFHBL0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DJjZdD117983
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:45:35 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 14:45:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 14:45:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DJjYou014042
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:45:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:45:32 -0400
Message-ID: <1565725532-29215-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] j7-evm.conf: Adding TI_PDK_LIMIT_SOCS/BOARDS/CORES for j7
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
X-List-Received-Date: Tue, 13 Aug 2019 19:45:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 conf/machine/j7-evm.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 17d48d0..22914ba 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -28,4 +28,9 @@ OPTEEOUTPUTMACHINE = "k3"
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 WKS_FILE = "sdimage-bootpart.wks"
 
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS_j7-evm = "j721e"
+TI_PDK_LIMIT_BOARDS_j7-evm = "j721e_evm"
+TI_PDK_LIMIT_CORES_j7-evm = "mpu1_0 mcu1_0 mcu1_1 mcu2_0 mpu2_1 mpu3_0 mpu3_1 c66xdsp_1 c66xdsp_2 c7x_1"
+
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
-- 
1.9.1


