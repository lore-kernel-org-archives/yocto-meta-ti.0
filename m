Return-Path: <x0038811@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E0E8E00DD1; Wed,  6 Mar 2019 00:33:28 -0800 (PST)
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
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5E66E00DC9
	for <meta-ti@yoctoproject.org>; Wed,  6 Mar 2019 00:33:27 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x268XR1C048505
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 02:33:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551861207;
	bh=4mKCCeYZYQ29F1LC1YSEP7BiXRwMEoAk6RuD8ApNteA=;
	h=From:To:CC:Subject:Date;
	b=zQDCWigVPeIS5sBaX9tKNCVMPryrLmQBmAjVYkZyEohVIhDVlE0u3C8I/3N1VDL3c
	OCWQznTDSDIKN9WKIq+xOfoKb1lCWPFFUl2bhf2dXz56ScFpTs/O92I9n8jUR2sYhN
	HveaPRRPPl12dAPgTaAyEriX9C5SSSoh+HWMHtaY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x268XQWY102063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 02:33:27 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 02:33:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 02:33:26 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x268XP6F029527;
	Wed, 6 Mar 2019 02:33:25 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 6 Mar 2019 14:03:09 +0530
Message-ID: <1551861190-29766-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master 0/1] ipumm updates with codec bugfixes
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
X-List-Received-Date: Wed, 06 Mar 2019 08:33:28 -0000
Content-Type: text/plain

 This upgrade brings in the following updates:
* MPEG2 Decoder Update to 01.00.18.01 from 01.00.17.01
* VC1 Decoder Update to 01.00.02.08 from 01.00.02.07

Ramprasad N (1):
  ipumm: Update SRCREV with codec fixes

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


