Return-Path: <tmannan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9EE6E00D75; Wed, 17 Jul 2019 11:17:08 -0700 (PDT)
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
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB929E00C94
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 11:17:07 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HIH6sl125563
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563387426;
	bh=yX+YAMl7JV2L/74l5IgrjsyHyPlfC5KglEhJjVfVayM=;
	h=From:To:Subject:Date;
	b=bGV1OoJFvJU9s8CNJ/kNiK1tvjYoGjcKI3PzAXCpcXCpdNEfZQKD5ijOwXHH8gkWY
	xmQlBbHAiMneQXz6uVHhcY/hS5EW5++Usb3UqFUsUmi8vErdNYWVWN52IICxnHop37
	9Focaw1ZxsWotKfVy5LYYFTB0KTdY0tbJAiMAYEM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HIH6RK013466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:17:06 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Jul 2019 13:17:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Jul 2019 13:17:06 -0500
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HIH6UX039043
	for <meta-ti@yoctoproject.org>; Wed, 17 Jul 2019 13:17:06 -0500
From: Tinku Mannan <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 17 Jul 2019 14:16:58 -0400
Message-ID: <1563387419-30920-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] Adding recipe for trace utility
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
X-List-Received-Date: Wed, 17 Jul 2019 18:17:08 -0000
Content-Type: text/plain

This is a new recipe added for Trace utility for use by PDK drivers

Tinku Mannan (1):
  trace-rtos: Adding trace utilities for PDK drivers

 recipes-bsp/utils-rtos/trace-rtos_git.bb | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-bsp/utils-rtos/trace-rtos_git.bb

-- 
2.7.4


