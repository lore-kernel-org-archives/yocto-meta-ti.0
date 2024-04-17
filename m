Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BEEC04FFF
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 16:11:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.18010.1713370291331407556
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 09:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h4FMn+We;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43HGBUFE088548;
	Wed, 17 Apr 2024 11:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713370290;
	bh=8CdCbkoLOM64ETDLPCDuh8hfbtnLJSJKF+/qQvbm3Bc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=h4FMn+WexvqM89k6PmGSfvxip4kpoiqXayxnchcvPpFEJYY3iIVWZD43oAvWyoEMq
	 lQw7SfROIUiP0DURQ5UVcW9EkFBcA++rEg9YgTl11W/Tru/kAeGv4uW4xXUvcMjJeN
	 +3iI/76LuBVJcgCEYUD8FFy7kouGkqycqfONHfd4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43HGBUbt009404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 11:11:30 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 11:11:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 11:11:29 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43HGBTBw042486;
	Wed, 17 Apr 2024 11:11:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rx7sf-0002XB-M6; Wed, 17 Apr 2024 11:11:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/3] python3-yamllint: Temporarily carry this new recipe
Date: Wed, 17 Apr 2024 11:11:27 -0500
Message-ID: <20240417161129.9697-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240417161129.9697-1-reatmon@ti.com>
References: <20240417161129.9697-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 16:11:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17577

Add recipe for yamllint.  There is an upcoming change in u-boot where
the binman tool is now configured to call yamllint to verify the configs
during compile time.

There was a previous patch a year ago from Trevor Woerner that never
made it into oe-core.  This patch is a reworking of his patch but
pointing to a newer version.

We are waiting on this patch to be accepted in oe-core.  Once it is
available on master we will remove this recipe to avoid conflict.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb

diff --git a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb b/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
new file mode 100644
index 00000000..4b7bd065
--- /dev/null
+++ b/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A linter for YAML files."
+HOMEPAGE = "https://github.com/adrienverge/yamllint"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "yamllint"
+
+SRC_URI[sha256sum] = "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3ca315118e4a1a81f7d"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS:${PN} += "${PYTHON_PN}-pyyaml"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


