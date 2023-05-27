Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14696C77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:58:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3627.1685152725599380819
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 18:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DE1dA806;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34R1weqg024542;
	Fri, 26 May 2023 20:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685152720;
	bh=XK8FteJE+nP4mRA+pwEqYI+lhYdUWGIW4ULhVx5TFQ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DE1dA806HoxvjJwSK53dWQ6CDy2AFv93ytOh9ECL2pyPQyd4MU5WzjX292cAOX8U/
	 ajqU1DG3bDa3papiAwx6gJzf41hBBEuUm5pBtp+XZaLDY6J0ARYNNfWh6kuFdLgXuD
	 Yu60TymDyWun8IrECvE0wF+sVSecKa48ZOdxqKKQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34R1we8r052809
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 May 2023 20:58:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 20:58:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 20:58:40 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34R1weNY066247;
	Fri, 26 May 2023 20:58:40 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] ti-img-rouge-umlibs: move to new subdir
Date: Fri, 26 May 2023 20:58:36 -0500
Message-ID: <20230527015837.231817-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230527015837.231817-1-rs@ti.com>
References: <20230527015837.231817-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 27 May 2023 01:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16615

From: Randolph Sapp <rs@ti.com>

Move recipe to new rogue subdir since we offer more than just libgles
now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../{libgles => rogue}/ti-img-rogue-umlibs_23.1.6404501.bb        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/{libgles => rogue}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
rename to meta-ti-bsp/recipes-graphics/rogue/ti-img-rogue-umlibs_23.1.6404501.bb
-- 
2.40.1


