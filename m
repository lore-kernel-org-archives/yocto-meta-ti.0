Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95942E00D24; Thu, 14 Mar 2019 15:50:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17419E00BAF
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 15:50:34 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EMoYRk124563
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552603834;
	bh=2AXt3ExbG7goqx7y+oLTfS/dbx8zdtuZ38D/7VDq9UM=;
	h=From:To:Subject:Date;
	b=jG6FQw9HRpg5vM+9i2O2E26Ii89d4OyM7XNAt51zrslgvwD/adn3xilPdzGTaHYkr
	6pyb06wndDUOjDJYRlCQMvjUgfxPe+LDScxqTjyG0gXD+bfvJtSYX3btgnBDlvt+Lf
	eUcC+Dd8Zc08lxnkDpfH19Dq2uTm+FNtL68l0nzI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EMoYPl014836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 14 Mar 2019 17:50:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 14 Mar 2019 17:50:34 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EMoXS4013025
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:33 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Mar 2019 18:50:27 -0400
Message-ID: <1552603832-16016-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 0/5] Patch Updates to unblock tools verification of 5.3 release
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
X-List-Received-Date: Thu, 14 Mar 2019 22:50:35 -0000
Content-Type: text/plain

The following component updates are needed to use the new sysbios/ti-cgt-c6x tools which 
were a part of the 5.3 tools update.
NOTE: The DSPLIB & SWTOOLS update are already on the rocko-next submitted by Xu,Jianzhong a few days earlier.
These recipe updates have the same version update, but they also contain some enhancements in the recipe to 
facilitate AUTOREVs if needed.

Mahesh Radhakrishnan (5):
  common-csl-ip: SRCREV update to 03.03.00.14
  edma3-lld: SRCREV update to 2.12.05.30D
  osal: SRCREV udpate to 01.00.00.14
  swtools: SRCREV update and updates to facilitate AUTOREV
  dsplib: SRCREV update to 3.4.0.3 and facilitate AUTOREV

 recipes-bsp/common-csl-ip/common-csl-ip.inc |  6 +++---
 recipes-bsp/edma3-lld/edma3-lld.inc         |  6 +++---
 recipes-bsp/osal/osal.inc                   |  6 +++---
 recipes-ti/dsplib/dsplib.inc                | 12 +++++++++---
 recipes-ti/swtools/swtools_git.bb           | 14 ++++++++++----
 5 files changed, 28 insertions(+), 16 deletions(-)

-- 
1.9.1


