Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEE2C41513
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 01:38:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.55137.1697247497536315483
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vonZOT12;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39E1cGrH089015;
	Fri, 13 Oct 2023 20:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697247496;
	bh=jldoXVT6F6Vn3kLMJbgh4vO9vAPv2PyZhlHosuoeNRw=;
	h=From:To:CC:Subject:Date;
	b=vonZOT12jrrIXZNuz6SeBOKTMgK/D7tMXxWI37XqusbyP8QzdhAqFmdtKGHFbxDvE
	 4tQiJryhWo5bxnJZB9Mw/LdEkiz5Ly48drmYKa8C+vocUHnQBFGRifiGMQ/vh4tA5m
	 g9E0J4be/GM8f5bxvuUtrpnwhpgRKkwpkU0mLmfA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39E1cFxw070258
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Oct 2023 20:38:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 20:38:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 20:38:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39E1cFIp019500;
	Fri, 13 Oct 2023 20:38:15 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/3] Reanimate the corpse of SGX
Date: Fri, 13 Oct 2023 20:37:54 -0500
Message-ID: <20231014013757.1398842-1-rs@ti.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Oct 2023 01:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17110

From: Randolph Sapp <rs@ti.com>

Brining back SGX on kirkstone (and hopefully making it easier for the community
to port to other distros).

This overhauls the SGX drivers, fixing a few bugs and setting things up to
achieve three things:

1) OpenGLES2 Acceleration under kirkstone (even if it is limited)
2) Break out a common interface to use newer versions of mesa
3) Revamp building / packaging procedures to try and match ROGUE where possible

I'll absolutely need community involvement for further testing / development as
this driver will more than likely continue to take the backseat to ROGUE in the
future. I hope the people asking about SGX on kirkstone earlier this year hear
that... :)

I did not get a chance to test this out on AM65 yet. I don't believe there will
be any issues for that device, but I'll need someone else to check.

Randolph Sapp (3):
  ti-sgx-ddk-*: version bump to support kirkstone
  mesa-pvr: bump srcrev for sgx support
  machine: include: enable sgx on tested platforms

 meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  2 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             | 27 +++++------
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  2 +-
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |  1 -
 .../ti-sgx-ddk-um_1.17.4948957.bb             | 48 +++++++------------
 7 files changed, 32 insertions(+), 52 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules

-- 
2.42.0


