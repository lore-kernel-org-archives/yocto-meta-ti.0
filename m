Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42A7C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 19:25:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1919.1706297128310065493
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 11:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P6uPsgMI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40QJPRM1051672;
	Fri, 26 Jan 2024 13:25:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706297127;
	bh=ZtT8nH++zKPoYYBu8yiDXi+XBRTaGzuonj81oH1mgR0=;
	h=From:To:Subject:Date;
	b=P6uPsgMIlTpxKUpcMCJsaCJULjiUe1yodjnu7fzjS4qcSRtLr6GUTxhojNBOeyz5A
	 TNqgsPvgk9oLs5N3bAQq5YcB5bbEk7Ex8AUNrgnDUKJq9d0ZSWQ47RJy8SwWa8+gMS
	 9wP0MOJHeIhT77AMjkrm7w9I0U6ezcZtvms8qPB4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40QJPR7s036468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jan 2024 13:25:27 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jan 2024 13:25:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jan 2024 13:25:26 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40QJPQjR092851;
	Fri, 26 Jan 2024 13:25:26 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rTRpO-00047T-N0; Fri, 26 Jan 2024 13:25:26 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] Revert "python3-yamllint: Temporarily carry this new recipe"
Date: Fri, 26 Jan 2024 13:25:26 -0600
Message-ID: <20240126192526.15795-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Jan 2024 19:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17422

This reverts commit 04c2204c11cb3ee5eee84f2d213037b763954786.

oe-core master branch picked up this patch [1], so we no longer need it
in meta-ti.

[1] https://git.openembedded.org/openembedded-core/commit/?id=128cfc5222752a6337a9cbb9bc9023c13ee19f2f

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb

diff --git a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb b/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
deleted file mode 100644
index 4b7bd065..00000000
--- a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A linter for YAML files."
-HOMEPAGE = "https://github.com/adrienverge/yamllint"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "yamllint"
-
-SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} += "${PYTHON_PN}-pyyaml"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


