Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.8033.1608211952676789973
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=tV5iIDwb;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 72D3A38C118D
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWW5U033027
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211952;
	bh=F/E4kHXcMtpFQ2o6XMyH+xAZKft0f/VoTkc9mZfcSeo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tV5iIDwbZst5z1ctslMJZiH+IixnQAoidBwAInIo8+8COXZzvxcgCD7RmhZ+GwZD0
	 z8Hjd0mFQS9BxZMjcxw/1OOyUv+OemzQHyyZM6gmwcbg/1HjfhYsOX4I+XR/wDCmXd
	 a+vsjK+Xj5DqZ5lWdshAV1J0bqo/pnPJk1Q7Z/m4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWWwC128014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:32 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWVal047703;
	Thu, 17 Dec 2020 07:32:31 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 09/10] ti-sci-fw: Update image gen and sysfw commit SHA
Date: Thu, 17 Dec 2020 07:32:27 -0600
Message-ID: <20201217133228.22886-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Update the image gen and sysfw commit SHAs.
Temporarily pick up the firmware-next branch to get the AM64x firmware.
This branch change will need to be reverted once the firmware is merged.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/=
ti-sci-fw.inc
index fe391e5fc40b..5f07ad19bd44 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -4,10 +4,11 @@ LICENSE =3D "TI-TFL"
 LIC_FILES_CHKSUM =3D "file://LICENSE.ti;md5=3Db5aebf0668bdf95621259288c4=
a46d76"
=20
 PV =3D "2020.08b"
+PV_am64xx-evm-k3r5 =3D "2020.23"
=20
-SRCREV =3D "c26c279257c13a0ff5002b09113fcff0e1d18853"
+SRCREV =3D "a4e232f9293be29ce1a684357112965365d6e285"
 BRANCH ?=3D "ti-linux-firmware"
-SRCREV_imggen =3D "7b4fe13d642d69a559724349aede4817891008a7"
+SRCREV_imggen =3D "6d023674b0655f1a7bba192d2600c08be314e9ef"
 SRCREV_FORMAT =3D "imggen"
=20
 SRC_URI =3D " \
--=20
2.29.2

