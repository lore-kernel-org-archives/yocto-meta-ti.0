Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5FBE7718C
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.139714.1734645245603682040
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ej8HL7z8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs4vI368409
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 15:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645244;
	bh=qU4ta0m7AA+ldNXWYlnmeJ6MNS2fkgHu6q1DuzVKpGU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ej8HL7z8MnYR37Xqr05hXlsoaKa1leONcBIIczbHO9Kmp44tBx9ETDCzzmxpId3aw
	 Q6FyJbGGbYvWtfd+7kOpLh3xZTF+vB4mtwXeurtp3lU681c84GNwd1lazur+0HJaj7
	 5l/8xl9TAFv5ozcr7csVLlk+fTZ8QbQDoChBsVXU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs4Bo050873;
	Thu, 19 Dec 2024 15:54:04 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:04 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs4Nc066837;
	Thu, 19 Dec 2024 15:54:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT6-0007ef-0a; Thu, 19 Dec 2024 15:54:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 13/13] meta-beagle: Add SECURITY file
Date: Thu, 19 Dec 2024 15:54:02 -0600
Message-ID: <20241219215402.28324-14-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18159

Add missing SECURITY file required by yocto-check-layer.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 {meta-ti-bsp => meta-beagle}/SECURITY | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 copy {meta-ti-bsp => meta-beagle}/SECURITY (100%)

diff --git a/meta-ti-bsp/SECURITY b/meta-beagle/SECURITY
similarity index 100%
copy from meta-ti-bsp/SECURITY
copy to meta-beagle/SECURITY
-- 
2.17.1


