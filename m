Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2502.1614832100681137969
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 20:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=uAZ91t0J;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 86DBE38C0870
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 04:28:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1244SGjm047400;
	Wed, 3 Mar 2021 22:28:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614832096;
	bh=5MD/sQAWXdvU7iF5SV8Gikn86yvxD8upSbc/Oqi+E3I=;
	h=From:To:CC:Subject:Date;
	b=uAZ91t0JVH36lGmAmrrFPOA2RFdO9VbCvUw/eqVXavgIBiEcq8rjQ5580aSYQjb4h
	 mVxh5wxX1xsGCVpohVypu+9/roRlvNM+yalrw+rwYlGoZpSOBV0eqXsm488Cl1ae3O
	 EAiYKHPBLL9v1plxf8bTbAPmbiW750xGuQx+WkZ4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1244SGZI046317
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Mar 2021 22:28:16 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Mar
 2021 22:28:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Mar 2021 22:28:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1244SFCr102282;
	Wed, 3 Mar 2021 22:28:15 -0600
From: "Nishanth Menon" <nm@ti.com>
To: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH dunfell/dunfell-next/master 0/2] linux-ti-mainline: Move Linux to v5.11
Date: Wed, 3 Mar 2021 22:28:06 -0600
Message-ID: <20210304042808.9389-1-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

A series of minimal patches to bump up recision to the latest kernel ->
we will need to maintain upstream-tools and kernel in sync on all
branches involved ofcourse.

NOTE: with kernels > 5.9 (aka 5.10, 5.11...) we do have problems with
cryptodev and kernel - we will have to try and see how best to integrate
those as well. This is solved in master of oe-core[1] by moving to 1.12,
however gatesgarth, dunfell are on 1.11 and 1.10 revs respectively
which wont work since the PR integrated version is 1.12

Nishanth Menon (2):
  linux-ti-mainline: Bump up ti-upstream-tools SRCREV
  linux-ti-mainline: Bump kernel version to v5.11

 recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
[1] http://git.openembedded.org/openembedded-core/tree/meta/recipes-kerne=
l/cryptodev?h=3Dmaster
[2] https://github.com/cryptodev-linux/cryptodev-linux/pull/55
--=20
2.25.1.377.g2d2118b814c1

