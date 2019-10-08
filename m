Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8F0AE00D8A; Tue,  8 Oct 2019 13:14:19 -0700 (PDT)
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
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4F29E00942
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2019 13:14:17 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KEHI9084473
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570565657;
	bh=8MX0ox75ZVrZnY0Osz/A35zVzWL2FCus2aNaWY4t8ac=;
	h=From:To:Subject:Date;
	b=cV6VJJGsKf5bPJJb+DCJuzFYGpMR4aDnm/JH53/kqBCKKZrF2GINq/m0ddegAdfc8
	/LLEYqvQCy50e1uMbM4y6iw+ALGbyJYzQSiugYKR4WjpkWEzoQmuZVxZaogMTlwslK
	ZVjFHaoe8WtT0NNyegNXLiu/rZBnPMERjuiCj5P4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98KEHxI122507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 8 Oct 2019 15:14:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 8 Oct 2019 15:14:14 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KEG1V014809
	for <meta-ti@yoctoproject.org>; Tue, 8 Oct 2019 15:14:16 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 Oct 2019 16:14:10 -0400
Message-ID: <1570565655-33346-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 0/5] 6.1 RTOS Patchset 3
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
X-List-Received-Date: Tue, 08 Oct 2019 20:14:20 -0000
Content-Type: text/plain

This is the RTOS Patchset 3, likely the final one.
It addresses the following
 - PRUSS-LLD Firmware build issue seen on LCPD
 - MCASP & MMCSD: Klocwork fixes on AM57x
 - Board: R5 Diagnostic fixes on AM65x
 - Transport: Bug fix for PRSDK-5303

Mahesh Radhakrishnan (5):
  board-rtos: SRCREV update to 01.00.10.06E
  mcasp-lld-rtos: SRCREV update to 01.01.00.15B
  mmcsd-lld-rtos: SRCREV update to 01.00.00.17D
  pruss-lld: SRCREV update to 01.00.00.15B
  transport-rtos: SRCREV update to 01.00.00.17A

 recipes-bsp/board-rtos/board-rtos_git.bb    | 6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 6 +++---
 recipes-bsp/pruss-lld/pruss-lld.inc         | 6 +++---
 recipes-bsp/transport-rtos/transport.inc    | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.9.1


