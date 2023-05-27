Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AA0C7EE2E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:58:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3625.1685152725109303516
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 18:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xxI3MUwo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34R1we7E094599;
	Fri, 26 May 2023 20:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685152720;
	bh=xC+G4BFkbGqnbHeZSxKokdUO1kh8f21T7YaedCEX3Lo=;
	h=From:To:CC:Subject:Date;
	b=xxI3MUwoKEb6CR+h7MH8zeM3ubF7SwmCt3HQ9h07pdb4tq/4yNWWZlLs4mwe98Cdi
	 BGvCJylXj6u7w1v3+px9+r+5o15BriGKEbVhp3Uap5Krya21It+EnAd6RXB9beThz8
	 eOc4JhKLEzhHD/Xt8kKc86SCO0UmUWFDJ7Oe3ziY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34R1weEN102756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 20:58:40 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 20:58:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 20:58:40 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34R1weNX066247;
	Fri, 26 May 2023 20:58:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 0/2] ti-img-rouge-umlibs: housekeeping and version bump
Date: Fri, 26 May 2023 20:58:35 -0500
Message-ID: <20230527015837.231817-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 27 May 2023 01:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16613

From: Randolph Sapp <rs@ti.com>

Well, I'm trying to be nice for those few that want a truly minimal
yocto environment. Let's see how long it takes before I regret it.

Split all Khronos API libs into their own packages and adjust
dependencies as necessary. Use mesa's fancy function to set some
variables. We won't set the provides or conflicts args just yet.
Software rendering is still nice to have as a fallback, but I'll drop it
if anyone in the community wants it gone for minimal image reasons.

Also bump the umlib and km versions. Add some rough gem support for now.
Should get some userspace applications like Chromium to start behaving a
little better. This is still experimental, but I don't think it'll break
anything that's already been working.

Randolph Sapp (2):
  ti-img-rouge-umlibs: move to new subdir
  ti-img-rogue-umlibs: bump version and explicitly package

 .../ti-img-rogue-driver_23.1.6404501.bb       |   2 +-
 .../ti-img-rogue-umlibs_23.1.6404501.bb       |  73 ------------
 .../rogue/ti-img-rogue-umlibs_23.1.6404501.bb | 112 ++++++++++++++++++
 3 files changed, 113 insertions(+), 74 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb

-- 
2.40.1


