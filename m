Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6637C05023
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:40:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21983.1713379233219208218
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ay+psUkp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43HIeWmf100751;
	Wed, 17 Apr 2024 13:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713379232;
	bh=VJ4c4fFKblcynLMo6apFpJmfk816ev6z3jxKqzOuQzY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ay+psUkpiPmVStaNdmJ9xWQi9sEHqwKicPGbvbs2KIdvoonGwam4aHKZs1RYcRVel
	 Bd959Y+dH0Z4VJIVCCW40ZaSX70LUlWGMdcpCUAfOlwzp5i1bAJhE8Nkn62WTasqGg
	 9sv0L9E6c1o7adr7qqE2UIh91vnfFnXGiGzX/qj4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43HIeWMG057639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 13:40:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 13:40:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 13:40:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43HIeVxr068929;
	Wed, 17 Apr 2024 13:40:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rxACt-0004W2-LE; Wed, 17 Apr 2024 13:40:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/3] TODO: Add TODO list
Date: Wed, 17 Apr 2024 13:40:30 -0500
Message-ID: <20240417184031.17308-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240417184031.17308-1-reatmon@ti.com>
References: <20240417184031.17308-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:40:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17584

In an attempt to try and better support non-LTS branches, we need to do
a better job at not removing temporary patches too soon from master.
This TODO file should allow us to better schedule the time when the
patches can be safely removed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 TODO | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 TODO

diff --git a/TODO b/TODO
new file mode 100644
index 00000000..e1aeba53
--- /dev/null
+++ b/TODO
@@ -0,0 +1,9 @@
+
+This TODO list allows us to track certain actions and lists of patches that
+need to be removed at a future date.
+
+
+May 2024 - nanbield EOL
+-----------------------
+  - Remove python3-yamllint: Temporarily carry this new recipe
+
-- 
2.17.1


