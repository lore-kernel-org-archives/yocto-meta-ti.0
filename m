Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2500.1614832100524252955
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 20:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=YNDPpFN9;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5581338C070D
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 04:28:20 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1244SGsX096944;
	Wed, 3 Mar 2021 22:28:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614832096;
	bh=nXbIfU0ydsuahaBmjrNj9Ub+/92OktOjjFnm0h5RiRE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YNDPpFN94Ov0rPQKi6Y+//6g680dhcnu5xtXoQc3zuBbooUvpeHE6U8wOHhF1zBoc
	 td8yww+zWufJ//tXs6Wm+9HsyqVwRAU3+ctOON4JQYLgpjr6sVGRbu/OK36UrB1mzp
	 RTtEKe2eX6DpqseeSoLAaissYlqqki3beoKNPolg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1244SGcQ124171
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Mar 2021 22:28:16 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Mar
 2021 22:28:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Mar 2021 22:28:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1244SFfJ056866;
	Wed, 3 Mar 2021 22:28:16 -0600
From: "Nishanth Menon" <nm@ti.com>
To: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH dunfell/dunfell-next/master 1/2] linux-ti-mainline: Bump up ti-upstream-tools SRCREV
Date: Wed, 3 Mar 2021 22:28:07 -0600
Message-ID: <20210304042808.9389-2-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
In-Reply-To: <20210304042808.9389-1-nm@ti.com>
References: <20210304042808.9389-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Bump up our recipe version for ti-upstream-tools for updates in config
files needed for latest kernel

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kern=
el/linux/linux-ti-mainline_git.bb
index 6159725aa5df..b4881d0d3a40 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -31,7 +31,7 @@ SRC_URI +=3D " \
     file://defconfig \
 "
=20
-SRCREV_ti-upstream-tools =3D "3f36f66594d7905f7b97bc7870931173fd2466bd"
+SRCREV_ti-upstream-tools =3D "d59b7471d99b806e3dc22342c8f42d5bb33f8cce"
 SRCREV_FORMAT =3D "linux"
=20
 KERNEL_DEVICETREE =3D ""
--=20
2.25.1.377.g2d2118b814c1

