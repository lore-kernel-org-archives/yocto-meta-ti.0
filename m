Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2763EE00AC5; Mon, 11 Mar 2019 18:43:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E00BE00950
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 18:43:57 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2C1hvLb039061
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552355037;
	bh=QR5vz+WarbUehGteiUt1T6T1X4wXpQJWqmJCcwrPRv4=;
	h=From:To:Subject:Date;
	b=htVsjhCkUOTTJMfQeVGvlmyE54J8ObdHas14DJwOPL3z6h9vLRgIAsHedDOLLLdib
	bJIXeca+7klW3kqvqXetEy6EG1HRYl3cDh+nMb92xKemhPX2UjQ7sD/9NMe30789H7
	2wt6HupHXOfmuLdkw1q3dNLgREVKIm1mTiKxqOVU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2C1hvHt085314
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:43:57 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 20:43:56 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Mon, 11 Mar 2019 20:43:56 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2C1hssM014989
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 20:43:55 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2019 21:43:41 -0400
Message-ID: <1552355028-25739-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 0/7] Tools update for RTOS 5.3 release
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
X-List-Received-Date: Tue, 12 Mar 2019 01:43:59 -0000
Content-Type: text/plain

Tools update for RTOS 5.3 release.

Mahesh Radhakrishnan (7):
  ti-ndk: Correcting the SRC_URI link
  gcc-arm-none-eabi-native: Update to 7.0-2018-q2-update
  ti-cg-xml: Update to version 2.61.00
  ti-cgt6x: Update to version 8.3.2
  ti-xdctools: Update to version 3.51.01.18
  ti-cgt-arm: Update to version 18.1.5 LTS
  ti-sysbios: Update to version 6.75.02.00

 ...bios_6.73.01.01.bb => ti-sysbios_6.75.02.00.bb} |  8 +++---
 ...> gcc-arm-none-eabi-native_7-2018-q2-update.bb} | 17 ++++++++----
 .../{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} | 17 ++++++------
 ...ative_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb} |  6 ++--
 recipes-ti/devtools/ti-cgt-arm.inc                 | 16 ++---------
 .../{ti-cgt6x_8.2.2.bb => ti-cgt6x_8.3.2.bb}       | 32 ++++++++--------------
 ...ols_3.50.08.24.bb => ti-xdctools_3.51.01.18.bb} |  8 +++---
 recipes-ti/ndk/ti-ndk.inc                          |  3 +-
 8 files changed, 44 insertions(+), 63 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.73.01.01.bb => ti-sysbios_6.75.02.00.bb} (52%)
 rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi-native_7-2018-q2-update.bb} (47%)
 rename recipes-ti/devtools/{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} (63%)
 rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.9.bb => ti-cgt-arm-native_18.1.5.bb} (9%)
 rename recipes-ti/devtools/{ti-cgt6x_8.2.2.bb => ti-cgt6x_8.3.2.bb} (70%)
 rename recipes-ti/devtools/{ti-xdctools_3.50.08.24.bb => ti-xdctools_3.51.01.18.bb} (35%)

-- 
1.9.1


