Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8039.1608211952105473683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=GgSrKSPu;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CEF9438C118D
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWVPR033018
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211951;
	bh=lBSklAny3llkLgfSO8i7L1KggHncRpbYFdooYwkNeLM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GgSrKSPuQejSKusYKlU8CMyg/g131uiVpXcQM43Rj23zG19b/cznQlzqZ+un52jP0
	 nEfMbXlOunwn8XseBzSEiD6sJPXJSMp1LLCkeaE6ktQg7IwfRP45V9U4bCkwDwe94C
	 nDsfDQmLaafvYwmpz3B/hsacHwMiZzIZ5TMf/hBI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWVLF010883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWUZH091481;
	Thu, 17 Dec 2020 07:32:30 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 07/10] am64xx-evm-k3r5: Update SYSFW_SOC to am64x from am65x
Date: Thu, 17 Dec 2020 07:32:25 -0600
Message-ID: <20201217133228.22886-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/am64xx-evm-k3r5.conf | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-=
k3r5.conf
index 26230da499af..b788e634699d 100644
--- a/conf/machine/am64xx-evm-k3r5.conf
+++ b/conf/machine/am64xx-evm-k3r5.conf
@@ -4,8 +4,7 @@
=20
 require conf/machine/include/k3r5.inc
=20
-# UPdate for am64
-SYSFW_SOC =3D "am65x"
+SYSFW_SOC =3D "am64x"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
 SYSFW_SYMLINK =3D "sysfw.itb"
--=20
2.29.2

