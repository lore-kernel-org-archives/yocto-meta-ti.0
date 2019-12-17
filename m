Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2241.1576554308072266227
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2019 19:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SBoDEGBE;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nsaulnier@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E688CE00736; Mon, 16 Dec 2019 19:45:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B71A3E00736
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 19:45:06 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH3j69g049023
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 21:45:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576554306;
	bh=g9VPuoIx2EsYATf4U0QSuaTArGdaDATtfTNyztBIZWc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=SBoDEGBEYNIKdqb3h9mfRyV9N5ps37I3A1xPXStBpWx4uAIrkWBBa1mxmc6/0h/vR
	 7z7qMgTAlDAlhKH9zrvY5u7TRb7mKjE0ruPY2xIgRGSXpeKxw+984dFhGyb9VO58KS
	 2tMJKjaSDTyf6xePhkOf4WXLT4r8EwosN/Fqrhdg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH3j6mX110797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 21:45:06 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 21:45:05 -0600
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.1847.003; Mon, 16 Dec 2019 21:45:05 -0600
From: "Nick Saulnier" <nsaulnier@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Subject: Re: [meta-ti][PATCH v2] pru-icss_git.bb: Update Manifest and PSSP commits
Thread-Topic: [meta-ti][PATCH v2] pru-icss_git.bb: Update Manifest and PSSP
 commits
Thread-Index: AQHVtIvB431HlzI9fki5NeT4YoFFhKe9rphQ
Date: Tue, 17 Dec 2019 03:45:05 +0000
Message-ID: <47a2924278c24aa38d98a17027005f84@ti.com>
References: <20191217033948.17653-1-nsaulnier@ti.com>
In-Reply-To: <20191217033948.17653-1-nsaulnier@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.95.137]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hoping this fixes the build issue. PRU_PSSP =3D "${S}" should point to wher=
e the git repo is copied locally, right?

Regards,
Nick

-----Original Message-----
From: Saulnier, Nick=20
Sent: Monday, December 16, 2019 9:40 PM
To: meta-ti@yoctoproject.org
Cc: Saulnier, Nick; Dmytriyenko, Denys; Stiffler, Jacob
Subject: [meta-ti][PATCH v2] pru-icss_git.bb: Update Manifest and PSSP comm=
its

- Updated the Software Manifest from 5.0 -> 6.0 to account for new processo=
rs,
etc.

- Updated to PRU Software Support Package v5.6.0
	updated manifest
	added PRU Getting Started Labs
	improved several examples

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git=
.bb
index 6508b6c2bcf3..51cd04d94af1 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -2,15 +2,15 @@ DESCRIPTION =3D "Programmable Real-time Unit Software Pac=
kage"
 HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/PRU-ICSS"
 LICENSE =3D "BSD-3-Clause & GPL-2.0 & PD"
=20
-LIC_FILES_CHKSUM =3D "file://PRU-Package-v5.0-Manifest.html;md5=3Da86a37c8=
b6396ad0ad6ae752f1aa8fcc"
+LIC_FILES_CHKSUM =3D "file://PRU-Package-v6.0-Manifest.html;md5=3Dea854230=
556f47609efdaedca174b44c"
=20
 inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-su=
pport-package.git;protocol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "1ff0393b3b9454fe9c58399c1b5d2db511e8049c"
+SRCREV =3D "ff252a5e174f1b6aa42931744939f20d25d8e070"
=20
-PV =3D "5.5.0"
+PV =3D "5.6.0"
 PR =3D "r1"
=20
 require recipes-ti/includes/ti-paths.inc
@@ -33,6 +33,7 @@ DEPENDS =3D "ti-cgt-pru-native"
 S =3D "${WORKDIR}/git"
=20
 export PRU_CGT =3D "${TI_CGT_PRU_INSTALL_DIR}"
+export PRU_PSSP =3D "${S}"
=20
 SUBDIRS =3D "examples pru_cape/pru_fw lib/src labs"
=20
--=20
2.17.1

