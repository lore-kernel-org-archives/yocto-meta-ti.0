Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51384E00C9B; Tue,  6 Aug 2019 11:54:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BD31E006EE
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:30 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsUbo025470
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117670;
	bh=5KrzuXbCRDRwT/bzdSKy9hnwRJAsC3HuqW3i1P0pnTU=;
	h=From:To:Subject:Date;
	b=jx8n8Jvj/vYqWP5UJXRLML6cv908rY7ifrhKd4aChqPYZGGDMox7azya95KgYajmA
	JetdTBiOIWMingW7I0/c1aD6ZWgyTYi0Zj8Ji5DenOYiRJvDc/WomY1KJG0C6VOV7c
	b2CLmhSBtluLm7S99OJf2xrA68wIqzrfZQaAKiOE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IsUuP063808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:30 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFW070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:30 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:53:55 -0400
Message-ID: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 00/25] RTOS Patchset for sysbios 6.76.02.02
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:32 -0000
Content-Type: text/plain

This is the RTOS patchset which contains the c6x big endian descope changes needed to include sysbios 6.76.02.02 for ProcSDK 6.1 RTOS release

Mahesh Radhakrishnan (25):
  aif2-lld: SRCREV update t 01.02.00.02B
  bcp-lld-rtos:SCREV update to 02.01.00.07B
  cppi-lld: SRCREV update to 02.01.00.14A
  edma3-lld: SRCREV update
  faultmanagement-rtos: SRCREV update to 01.00.01.04A
  fftc-lld-rtos: SRCREV update to 02.02.00.07B
  hyplnk-lld: SRCREV update to 02.01.00.08A
  iqn-lld: SRCREV update to 1.0.0.11A
  mmap-lld: SRCREV update to 02.00.00.08B
  nwal-lld: SRCREV update to 02.01.00.12A
  pa-lld: SRCREV update to 03.00.02.08A
  pktlib: SRCREV update to 2.1.0.8B
  rm-lld: SRCREV update to 02.02.00.03B
  sa-lld: SRCREV update to 04.00.00.03A
  serdes-diag-rtos: SRCREV udpate to 01.00.00.12B
  srio-lld: SRCREV update to 02.00.00.17A
  tcp3d-lld-rtos: SRCREV update to 0-2.01.00.06B
  traceframework: SRCREV udpate to 01.01.01.09A
  transport-rtos: SRCREV update to 01.00.00.16B
  tsip-lld-rtos: SRCREV update to 01.00.00.08A
  wdtimer-rtos: SRCREV update to 01.00.00.04A
  dsplib: SRCREV update
  mathlib: SRCREV update
  swtools: SRCREV update
  ti-pdk-build-rtos: SRCREV update to 01.00.00.13B

 recipes-bsp/aif2-lld/aif2-lld.inc                       | 6 +++---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb                 | 6 +++---
 recipes-bsp/cppi-lld/cppi-lld.inc                       | 6 +++---
 recipes-bsp/edma3-lld/edma3-lld.inc                     | 4 ++--
 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb | 6 +++---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb               | 6 +++---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc                   | 6 +++---
 recipes-bsp/iqn2-lld/iqn2-lld.inc                       | 6 +++---
 recipes-bsp/mmap-lld/mmap-lld.inc                       | 6 +++---
 recipes-bsp/nwal-lld/nwal-lld.inc                       | 6 +++---
 recipes-bsp/pa-lld/pa-lld.inc                           | 6 +++---
 recipes-bsp/pktlib/pktlib.inc                           | 6 +++---
 recipes-bsp/rm-lld/rm-lld.inc                           | 6 +++---
 recipes-bsp/sa-lld/sa-lld.inc                           | 6 +++---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb         | 6 +++---
 recipes-bsp/srio-lld/srio-lld.inc                       | 6 +++---
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb             | 6 +++---
 recipes-bsp/traceframework/traceframework.inc           | 6 +++---
 recipes-bsp/transport-rtos/transport.inc                | 6 +++---
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb               | 6 +++---
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb                 | 6 +++---
 recipes-ti/dsplib/dsplib.inc                            | 4 ++--
 recipes-ti/mathlib/mathlib.inc                          | 4 ++--
 recipes-ti/swtools/swtools_git.bb                       | 4 ++--
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb        | 6 +++---
 25 files changed, 71 insertions(+), 71 deletions(-)

-- 
1.9.1


