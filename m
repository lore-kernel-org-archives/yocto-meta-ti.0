Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.348.1579731639303119208
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2020 14:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U4m/9pv8;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BDCDE015E8; Wed, 22 Jan 2020 14:20:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8796E01588
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 14:20:38 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKcIV083052
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579731638;
	bh=gs+4ybI+M89oUKCuen98eCj8Qis66VZWWKgDIlR1cfE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=U4m/9pv8MJ/tB9EV7huxYz3NIFMrqyRqoDoIQofmUjA5lBlAogkjfFV1iiyyD2Sq5
	 imQWWeyRmIsrLclT6Fija9ngRtoWTcnLFIFhy1izo8fn9fC0lknX/1A8JRYWJWZCNs
	 cAGBeG117ALfkhFyTyM3mclKaeqfE8UjERykuK6M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MMKcOA065470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:38 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 16:20:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 16:20:37 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKY4x061593
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:37 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 2/3] common-csl-ip-rtos: Adding am57xx boards for dra7xx build
Date: Wed, 22 Jan 2020 17:20:30 -0500
Message-ID: <20200122222031.13896-3-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
References: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 0a6d5f28..98b2d136 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -19,3 +19,4 @@ PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
 
 # Workaround: dra7xx build requires am57xx CSL libraries for opencl-monitor
 TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
+TI_PDK_LIMIT_BOARDS_append_dra7xx = " evmAM571x evmAM572x idkAM574x"
-- 
2.17.1

