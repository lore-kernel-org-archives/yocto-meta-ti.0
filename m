Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41CAC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 03:59:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4828.1685678355444834924
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 20:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p00f7Ate;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3523xCwT090861;
	Thu, 1 Jun 2023 22:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685678352;
	bh=w0MfYaiJWijW6HNx5XCg9Ys1x9PlX+dGPh6YjmoZnt0=;
	h=From:To:CC:Subject:Date;
	b=p00f7AteQ1O/DGjS0DgWkzuY3JorIqvoUTjeeO4R9Mg0Um/ffh0EC54IQmf1zpL0s
	 JM+8aWIWy+ai0cB0ZzYo6O6BTYcZD0KnL7p1Fog5QAEAQ33BjvRc9RVDZcCd2Ca7ov
	 k3B1rCd+XM6A9SeRxE4kQHL9HI4LlMjV7i6RTCko=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3523xCgc001235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 22:59:12 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 22:59:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 22:59:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3523xBou061674;
	Thu, 1 Jun 2023 22:59:11 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCHv3 0/2] ti-img-rouge-umlibs: housekeeping and version bump
Date: Thu, 1 Jun 2023 22:58:55 -0500
Message-ID: <20230602035857.771739-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 03:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16653

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

---

Ugh, apparently something from testing slipped into a commit again. If
the ${PN}-dev package is present in the packages string yocto will
automatically sort out all the dev links, and with this driver there one
dev link that's always required for mesa interactions:

	libpvr_dri_support.so

Drop the dev package from the packages string. Most of the links aren't
needed but since we've got to ignore the sanity check anyway (and the
link names are currently unique). We'll just go ahead and ship all the
core driver devlinks in case something weird changes in the future.

Randolph Sapp (2):
  libgles: rename subdir to powervr-umlibs
  ti-img-rogue-umlibs: bump version and explicitly package

 .../ti-img-rogue-driver_23.1.6404501.bb       |   2 +-
 .../ti-img-rogue-umlibs_23.1.6404501.bb       |  73 ------------
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 111 ++++++++++++++++++
 .../ti-sgx-ddk-um/pvrsrvkm.rules              |   0
 .../ti-sgx-ddk-um_1.17.4948957.bb             |   0
 5 files changed, 112 insertions(+), 74 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
 create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb (100%)

-- 
2.40.1


