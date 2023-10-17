Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496EACDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 00:30:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.196683.1697502602642490401
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 17:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bR07uMY4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39H0U0R8037228;
	Mon, 16 Oct 2023 19:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697502600;
	bh=m9jpwSW/aPRV2FpRv0TprB9gZqQlZwdhNtMtJ6zkg+8=;
	h=From:To:CC:Subject:Date;
	b=bR07uMY4WgzugKG3va3ZSrrs88zfMOausxDX4u3Qw3U/Qg3tqtI40Ocs+tJ/mxlJ0
	 cseXstKugGlsUdcxEuvukkKXOoMKkVyW6v/4OlK17BjmJUSwGmzxmhafIsEuJPFLvF
	 Q1FQNDXjIloloMruBPrimTQ9cS6Y2/qYpB/lgYls=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39H0U0cF029946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 19:30:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 19:30:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 19:30:00 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39H0U0sX041124;
	Mon, 16 Oct 2023 19:30:00 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 0/3] Reanimate the corpse of SGX
Date: Mon, 16 Oct 2023 19:29:55 -0500
Message-ID: <20231017002958.1762487-1-rs@ti.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 00:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17122

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

This revision actually tests AM654, adds a fix for Yocto's dev-so stripping
shenanigans, and enables the SGX on the ti43x platforms as well.

Randolph Sapp (3):
  ti-sgx-ddk-*: version bump to support kirkstone
  mesa-pvr: bump srcrev for sgx support
  machine: include: enable sgx on tested platforms

 meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  2 +-
 .../ti-img-rogue-driver_23.1.6404501.bb       |  2 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             | 27 +++++-----
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  2 +-
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |  1 -
 .../ti-sgx-ddk-um_1.17.4948957.bb             | 53 +++++++------------
 9 files changed, 38 insertions(+), 55 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules

-- 
2.42.0


