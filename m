Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD78CC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:22:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3580.1720639326255284668
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 12:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a/C89Lov;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46AJM36I098711;
	Wed, 10 Jul 2024 14:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720639323;
	bh=ccqsUFiL4mv+6XhSl5giZ7F+66jE/t0go+TPxxuKik0=;
	h=From:To:CC:Subject:Date;
	b=a/C89Lov5ps9ksr3irNvux85FNIrQM2m4rRrogd72g+3N7pTs2ohG0VkxABjrkP3G
	 vFem5XhVZTrB6adt2nMX48Olq+FtuAsuBOdStesTK4PdDmhZfZqbRDQ09ZiLHZhnWk
	 PaVVK6J/VLWzDEFLNvjktZEhICyV3hY0BsorDqds=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46AJM3UZ069796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jul 2024 14:22:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Jul 2024 14:22:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Jul 2024 14:22:02 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.34.7])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46AJM2XX123078;
	Wed, 10 Jul 2024 14:22:02 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master][PATCH 0/2] ti-img-rogue-umlibs: ldflags update
Date: Wed, 10 Jul 2024 14:21:52 -0500
Message-ID: <20240710192154.6847-1-rs@ti.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jul 2024 19:22:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17852

From: Randolph Sapp <rs@ti.com>

Add ldflags to the INSANE_SKIP strings for all components. We now use the Yocto
compiler for these packages but we do not use all of the yocto compiler flags.

As such, whenever the GCC version being used for these packages is equal to the
version Yocto is currently on, we will trip the ldflags sanity check. This
usually results in the following error:

File <> in package <> doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]

Randolph Sapp (2):
  ti-img-rogue-umlibs: fix libopencl-rogue-tools sanity
  ti-img-rogue-umlibs_23: add ldflags to INSANE_SKIP

 .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb      | 6 ++++--
 .../powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb      | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.45.2


