Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73F0C3DA6B
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 17:53:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2074.1661968401597738856
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 10:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OftrXROW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrGd7013920;
	Wed, 31 Aug 2022 12:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661968396;
	bh=3L8E1LqnZWjBwDghd5IxANcyDS+PF1ByvzIkKJAVHBY=;
	h=From:To:CC:Subject:Date;
	b=OftrXROWHGJ2p4ElTBjqe7ylaXglSpO6ORl7lP6ZiscuFkDJWQIPh6DRmjo5O8pCW
	 T3BZH+OVZ7bQYLulmOKxA9Q3XihuhiVkhbWOy9M4cQe/MJfCTCnYlkG0dsIYMkkDtC
	 KSVhf5D6KGr1/ZXlXkax5X2oazvnr4sV9BKYxisM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27VHrGI2047593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Aug 2022 12:53:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 31
 Aug 2022 12:53:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 31 Aug 2022 12:53:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrFts033174;
	Wed, 31 Aug 2022 12:53:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 0/3] J7 name backports from master/kirkstone
Date: Wed, 31 Aug 2022 12:53:12 -0500
Message-ID: <20220831175315.15942-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 31 Aug 2022 17:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14982

Hello all,

Some backports from master/kirkstone that help with the naming of J7
family SoCs. This is needed to prevent some breaks on HS J7 as it
is often forgotten when we add features to the non-HS EVM by name.

Thanks,
Andrew

Andrew Davis (3):
  meta-ti: Rename j7-evm to j721e-evm
  meta-ti: Add SoC families for the J7 SoCs
  meta-ti: Use new J7 SoC names over specific board names

 conf/machine/include/j7200.inc                 |  2 ++
 conf/machine/include/j721e.inc                 |  4 ++++
 conf/machine/include/j721s2.inc                |  2 ++
 conf/machine/j7200-evm.conf                    |  2 +-
 .../{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}  |  4 ++--
 conf/machine/{j7-evm.conf => j721e-evm.conf}   |  8 +++-----
 ...sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} |  6 +++---
 ...hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} |  4 ++--
 .../{j7-hs-evm.conf => j721e-hs-evm.conf}      |  6 +++---
 conf/machine/j721s2-evm.conf                   |  2 +-
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb     |  2 +-
 .../ti-img-rogue-driver_1.15.6133109.bb        | 14 +++++---------
 recipes-bsp/sciclient/sciclient-rtos_git.bb    |  6 +++---
 .../viddec-test-app_1.0.0.bb                   |  2 +-
 .../videnc-test-app_1.0.0.bb                   |  2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         | 18 +++++++++---------
 .../trusted-firmware-a_%.bbappend              |  2 +-
 .../ti-img-rogue-umlibs_1.15.6133109.bb        |  8 +++-----
 recipes-kernel/linux/kernel-rdepends.inc       |  6 ++----
 recipes-security/optee/optee-os_%.bbappend     |  2 +-
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb     |  2 +-
 21 files changed, 51 insertions(+), 53 deletions(-)
 create mode 100644 conf/machine/include/j7200.inc
 create mode 100644 conf/machine/include/j721e.inc
 create mode 100644 conf/machine/include/j721s2.inc
 rename conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (81%)
 rename conf/machine/{j7-evm.conf => j721e-evm.conf} (77%)
 rename conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
 rename conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (81%)
 rename conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (85%)

-- 
2.36.1


