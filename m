Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90102E00D35; Sat, 27 Apr 2019 08:32:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid *  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20B99E00CD6
	for <meta-ti@yoctoproject.org>; Sat, 27 Apr 2019 08:32:28 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3RFWSgk110049
	for <meta-ti@yoctoproject.org>; Sat, 27 Apr 2019 10:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556379148;
	bh=wq6SX/H6234gCTy978lhhY/s+mqK+qTOBasEsE9YVNM=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=wSy0Vhi/D0XJHRSPCIzjd0OCuCiJsnfpeIzYgeZF/b4BY4I9jzVh53dKhc0DhxN8Z
	cj2Is3X43UjvuMo5wO5qi3iJKZlLp1z67fXGyduooTxio+5I2r7O5tiqQ3rzjg3MAF
	4+bBPYJd6BbmcI17/sDsudYlbGbL36WyX25DPj3Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3RFWSCB039232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 27 Apr 2019 10:32:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 27 Apr 2019 10:32:28 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1713.004; Sat, 27 Apr 2019 10:32:28 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [rocko/master][PATCH] ti-cgt-arm-native: Upgrade to
	18.12.1.LTS
Thread-Index: AQHU+rStc/42cSK2q0yLHLvBv66626ZQJ1mA
Date: Sat, 27 Apr 2019 15:32:28 +0000
Message-ID: <afcec153daeb484ebdaa122424fea03a@ti.com>
References: <1556120685-59598-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1556120685-59598-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.208]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [rocko/master][PATCH] ti-cgt-arm-native: Upgrade to	18.12.1.LTS
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
X-List-Received-Date: Sat, 27 Apr 2019 15:32:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ERROR: QA Issue: ti-cgt-arm-native: The LIC_FILES_CHKSUM does not match for=
 file://ti-cgt-arm_18.12.1.LTS/README.txt;md5=3D3faed35326711d6596f03772793=
23df1


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Wednesday, April 24, 2019 11:45 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [rocko/master][PATCH] ti-cgt-arm-native: Upgrade to
> 18.12.1.LTS
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-cgt-arm-native_18.1.5.bb =3D> ti-cgt-arm-native_18.12.1.bb}     =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt-arm-native_18.1.5.bb =3D> ti-cgt-arm-
> native_18.12.1.bb} (47%)
>=20
> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb b/recipes-
> ti/devtools/ti-cgt-arm-native_18.12.1.bb
> similarity index 47%
> rename from recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> rename to recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
> index 0ed1939..232db1e 100644
> --- a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
> @@ -2,5 +2,5 @@ include ti-cgt-arm.inc
>=20
>  LIC_FILES_CHKSUM =3D "file://ti-cgt-
> arm_${PV}.LTS/README.txt;md5=3D3faed35326711d6596f0377279323df1"
>=20
> -BINFILE_MD5 =3D "d0559bccc323002a9256dd68e1d223ab"
> -BINFILE_SHA256 =3D
> "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
> +BINFILE_MD5 =3D "af2378cf8d5d6f200ef3329f5a065529"
> +BINFILE_SHA256 =3D
> "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

