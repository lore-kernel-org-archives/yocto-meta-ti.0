Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7219C32772
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 19:52:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.47174.1660852362663974782
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 12:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tJZI6WEh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27IJqbLk048691;
	Thu, 18 Aug 2022 14:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660852357;
	bh=jSRGU0d0eEz3bD0vxrN4B21Qhu5GIfBsTHmO6EWtlAQ=;
	h=From:To:CC:Subject:Date;
	b=tJZI6WEhhgqyrHwIYw2+SaBuuuNkFrDPzGAjnYzZPRv7y42XI8IIYp7wUMvFZvtJx
	 xexXLXGQyp4truaxO+0pCUmaDyC17kQ8fumJ8gi9xGuJ7Yxb5nOnol+pGxZmMR5oTk
	 JfV5uwFyDe1oiJ7okaaI/c4EQQwZ9JTXqCqtunIw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27IJqbYH018167
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Aug 2022 14:52:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 18
 Aug 2022 14:52:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 18 Aug 2022 14:52:37 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27IJqaAO027830;
	Thu, 18 Aug 2022 14:52:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH] optee-examples: Add dependency on
 python3-cryptography-native
Date: Thu, 18 Aug 2022 14:52:36 -0500
Message-ID: <20220818195236.19319-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Aug 2022 19:52:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14962

This is needed for building the latest optee-examples.

While here switch to HTTPS for fetching from Github.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-security/optee/optee-examples_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
index 19e32d9d..9941b345 100644
--- a/recipes-security/optee/optee-examples_%.bbappend
+++ b/recipes-security/optee/optee-examples_%.bbappend
@@ -1,2 +1,5 @@
 PV_ti-soc = "3.17.0+git${SRCPV}"
 SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
+SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
+
+DEPENDS_append_ti-soc = " python3-cryptography-native"
-- 
2.36.1


