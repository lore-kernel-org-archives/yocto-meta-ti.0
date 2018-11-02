Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 161D8E00A0A; Fri,  2 Nov 2018 14:30:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4B45E00901
	for <meta-ti@yoctoproject.org>; Fri,  2 Nov 2018 14:30:05 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA2LU5cj085363
	for <meta-ti@yoctoproject.org>; Fri, 2 Nov 2018 16:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1541194205;
	bh=WOQcCBf1wSHwX+uVWce3XA/W8iUS5w8Tuvf8Jsvx4J8=;
	h=From:To:Subject:Date;
	b=BSeecvbKcrmp7a+CxtzYoEelAc2tSMWhgziBc4zDouHI2KRBZHdkZgdO15gwfLImk
	52vS7kOGdy2S0zt0qW/FTrO1AS+Ew99vMpOxBezpLDgmuiPLbqykgORR2wByZv21Ji
	XN4SiJI4k4vm2nKWu0C6eRJnUl7LeFjeVQ+s3k5k=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA2LU5Ms109618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Nov 2018 16:30:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 2 Nov 2018 16:30:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 2 Nov 2018 16:30:05 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA2LU4dX012293
	for <meta-ti@yoctoproject.org>; Fri, 2 Nov 2018 16:30:04 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 2 Nov 2018 17:30:01 -0400
Message-ID: <1541194202-57385-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-cgt-arm-native with corrected LIC_CHKSUM
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
X-List-Received-Date: Fri, 02 Nov 2018 21:30:07 -0000
Content-Type: text/plain

This version corrects the LIC_CHKSUM of the 16.9.9 recipe. The issue did not appear
in the local testing as the CHKSUM file was overwritten in the meta-processor-sdk-internal(rtos)
layer which will be removed.

Mahesh Radhakrishnan (1):
  ti-cgt-arm-native: Update to 16.9.9

 .../{ti-cgt-arm-native_16.9.2.bb => ti-cgt-arm-native_16.9.9.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.2.bb => ti-cgt-arm-native_16.9.9.bb} (9%)

-- 
1.9.1


