Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C1A7E00B6C; Thu, 12 Jul 2018 08:23:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C634E004F6
	for <meta-ti@yoctoproject.org>; Thu, 12 Jul 2018 08:23:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6CFNIa3006808
	for <meta-ti@yoctoproject.org>; Thu, 12 Jul 2018 10:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531408998;
	bh=BiXLMjqPsCi7QtCmEgjp+LuXFoO0zgxFGQ3bwNWcuSM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=hNnE8MEICR/Sxj3Xjd3W8tVrYB0en8Bis+arXSwZYmQAxgJ44h5iKlgzqU3597fDa
	RtExCtJkwWFQjjEFY2LZWrDD4n6rufAj/LhTGmCM8FzB88EPA/8CRHI7n4jgZmao3e
	4hgDTAUqj/wAM5EAEDH0ohrMSQua7um+8XEOK2mg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CFNIKt021212
	for <meta-ti@yoctoproject.org>; Thu, 12 Jul 2018 10:23:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 12 Jul 2018 10:23:18 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
	DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
	15.01.1466.003; Thu, 12 Jul 2018 10:23:18 -0500
From: "Saulnier, Nick" <nsaulnier@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti][PATCH v1] pru-icss_git.bb: bug fixes for SDK 5.0,
	PRU_ADC
Thread-Index: AQHUGXDvPNgZRO8GBUCb7RCKce19IqSLsxyA
Date: Thu, 12 Jul 2018 15:23:18 +0000
Message-ID: <fa99cd30468b4233b5e5e3af9df1d83f@ti.com>
References: <1531352587-28264-1-git-send-email-nsaulnier@ti.com>
In-Reply-To: <1531352587-28264-1-git-send-email-nsaulnier@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [PATCH v1] pru-icss_git.bb: bug fixes for SDK 5.0, PRU_ADC
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 15:23:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The source revision of the bitbake patches doesn't match the tag of the PRU=
 Software support package repo.=20
		bitbake			SW Supp Pckg
previous	v5.2.0			v5.1.0 (unchanged)
current		v5.2.0 (unchanged)	v5.2.0

Should we cancel this bitbake patch and I update this patch and the SW Supp=
 Pckg tags so it matches?
		bitbake			SW Supp Pckg
previous	v5.2.0			v5.2.0
current		v5.2.1			v5.2.1

Thanks,
Nick

-----Original Message-----
From: Saulnier, Nick=20
Sent: Wednesday, July 11, 2018 6:43 PM
To: meta-ti@yoctoproject.org
Cc: Saulnier, Nick; Dmytriyenko, Denys; Stiffler, Jacob
Subject: [meta-ti][PATCH v1] pru-icss_git.bb: bug fixes for SDK 5.0, PRU_AD=
C

Updated commit hash for PRU Software Support Package.

PRU Software Support Package v5.2.0 integrates 3 bug fixes and adds am65x c=
ode
(as of previous commit) as well as am335x PRU_ADC example.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git=
.bb
index 5161e1f9dc4a..fb576bf797dc 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,7 +8,7 @@ inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-su=
pport-package.git;protocol=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "df1d9da2047385fdd27e8735af31000dfdcf7625"
+SRCREV =3D "8af83221c65e1982cd4828703ed50a352c01e684"
=20
 PV =3D "5.2.0"
 PR =3D "r1"
--=20
1.9.1


