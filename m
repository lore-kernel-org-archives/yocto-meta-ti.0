Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5201AE00CB9; Thu, 11 Apr 2019 08:04:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1B04E00B5C
	for <meta-ti@yoctoproject.org>; Thu, 11 Apr 2019 08:04:28 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3BF4SeY011277
	for <meta-ti@yoctoproject.org>; Thu, 11 Apr 2019 10:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554995068;
	bh=PKFSVYhf8DhrvULNXViaAA+92fE/h9DLdcy4V43KoX8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=dYglC8vmadwvBL9semam6rbX+3LcnDm+JfGsTl+sLuTtZ8NP27tfCQn/3SdXNPjNV
	IDbJXeVgjF/IRPEY6RQkXFom0Lhjp26XdAN90+mEgBwY4wOV6ODA0wAPrBfLeQ7FXV
	MG12Bo6Y+L1c3rnMB+IfemIS7usvoC76clpdl1Vg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3BF4S9T074089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 11 Apr 2019 10:04:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 11 Apr 2019 10:04:27 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Thu, 11 Apr 2019 10:04:27 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [thud/master][PATCH 3/3] ti-gc320-libs: fix
	host contamination warnings
Thread-Index: AQHU8BxJUCaYxcx3PEqfZpgFXn3IzKY3DzPA
Date: Thu, 11 Apr 2019 15:04:27 +0000
Message-ID: <e353137e77e640f18309005139e03f81@ti.com>
References: <1554955641-1985-1-git-send-email-denys@ti.com>
	<1554955641-1985-3-git-send-email-denys@ti.com>
In-Reply-To: <1554955641-1985-3-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [thud/master][PATCH 3/3] ti-gc320-libs: fix host contamination warnings
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
X-List-Received-Date: Thu, 11 Apr 2019 15:04:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

Thanks,
Gowtham

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoprojec=
t.org] On Behalf Of
>Dmytriyenko, Denys
>Sent: Wednesday, April 10, 2019 11:07 PM
>To: meta-ti@yoctoproject.org
>Subject: [EXTERNAL] [meta-ti] [thud/master][PATCH 3/3] ti-gc320-libs: fix =
host contamination
>warnings
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-=
graphics/libgal/ti-gc320-
>libs_5.0.11.p7.bb
>index a2f8f19..df1a99e 100644
>--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
>+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
>@@ -34,6 +34,7 @@ EXTRA_OEMAKE +=3D "DESTDIR=3D${D} TARGET_PRODUCT=3D${TAR=
GET_PRODUCT} LIBDIR=3D${libdir}"
>
> do_install() {
>     oe_runmake install
>+    chown -R root:root ${D}
> }
>
> INSANE_SKIP_${PN} +=3D "ldflags"
>--
>2.7.4
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

