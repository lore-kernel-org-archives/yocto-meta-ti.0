Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1226.1608230973356662197
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=gQiCZTzS;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 298CE38C12EB
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:49:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInWV6033477
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608230972;
	bh=xrh1cFMfHvnyzE5558adBaqw5/DeRpd04YUsnb1VhrQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gQiCZTzS6nDI3NM3u82aPdoy2ZIemMrNIMtMKuHaOdXkbydXj5NKUpJflXislMRIF
	 GTnfIVe/OpVzrUiTnm9uK5h68B0eQWpaZGz2hXMlnN8homJx+9/KXJwjcgXsFYAsW2
	 HrbC2QYl94UIrLOT19DLDLNVWDSPCKeVzkYT+rhM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHInWrD038493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:49:32 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:49:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:49:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHInWas051973;
	Thu, 17 Dec 2020 12:49:32 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v3 08/10] k3conf: Update SRCREV to latest
Date: Thu, 17 Dec 2020 12:49:27 -0600
Message-ID: <20201217184929.18031-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217184929.18031-1-dmurphy@ti.com>
References: <20201217184929.18031-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the k3conf to the latest SHA to pick up AM64.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-devtools/k3conf/k3conf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3c=
onf/k3conf_git.bb
index e4fa54c3bee0..5becbf97094e 100644
--- a/recipes-devtools/k3conf/k3conf_git.bb
+++ b/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV =3D "0.1+git${SRCPV}"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "1ff0c4f429e8e33d22b52ec002d9b97bbca6bf0b"
+SRCREV =3D "7ee4c46379bb71dfa0677089841cb87eba9fbfea"
=20
 SRC_URI =3D "git://git.ti.com/k3conf/k3conf.git;protocol=3Dgit;branch=3D=
${BRANCH}"
=20
--=20
2.29.2

