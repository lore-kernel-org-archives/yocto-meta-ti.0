Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7F2C7EE24
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:58:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1744.1685483913724358079
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 14:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MvowjcRz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ULwVYg056920;
	Tue, 30 May 2023 16:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685483911;
	bh=MuM1+o/Dc90koDqusX6si1u/bdqWhsYJUue43G0bUFg=;
	h=From:To:CC:Subject:Date;
	b=MvowjcRzOlRb8xDvnKrbEtAOeMb7eA8jB96ht1RUgh3AsqZqOwY+bSgMwarHkIuXG
	 ClSxIzat8DdksQpYO7NIyaljzHBV7D91MIjNOwZQfU+dmWhR89QBlzZvsYgUcCItm/
	 r0f+uzSYxhe2ewOTafMbMmn3tpLpaRey9YrQyUcQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ULwVxQ124774
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 16:58:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 16:58:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 16:58:31 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ULwVKG003606;
	Tue, 30 May 2023 16:58:31 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCHv2 0/2] ti-img-rouge-umlibs: housekeeping and version bump
Date: Tue, 30 May 2023 16:58:25 -0500
Message-ID: <20230530215827.3737116-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 21:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16640

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

This version changes the libgles subdir to powervr-umlibs, keeping in
line with the naming convention used by the kernel modules.

Randolph Sapp (2):
  libgles: rename subdir to powervr-umlibs
  ti-img-rogue-umlibs: bump version and explicitly package

 .../ti-img-rogue-driver_23.1.6404501.bb       |   2 +-
 .../ti-img-rogue-umlibs_23.1.6404501.bb       |  73 ------------
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 112 ++++++++++++++++++
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |   0
 .../ti-sgx-ddk-um_1.17.4948957.bb             |   0
 5 files changed, 113 insertions(+), 74 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb (100%)

-- 
2.40.1


