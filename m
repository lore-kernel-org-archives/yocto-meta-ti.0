Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA5D3E00D0F; Wed, 13 Mar 2019 09:11:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38E5CE00CAB
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 09:11:24 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2DGBN7B094837
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 11:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552493483;
	bh=Hmum5wVvfCByh+kSemdVIEHnwkpIYAaLZ9Fmt+Q02fA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=AD4hsnoluDdYc3POeVAIaERdM9LFuZup3Qe/i4Xw1UW00YxrCB2NueQ3FKNjPBOxb
	Cmtprie3a/pIJ/DrwXiTS/bZ5fKVTdbc/5rnD4tLMwMErm181WtZcJUF+VtHzqQzKN
	CW4jRyRAb9G0CKB7tJdhCatszq92qTwt+AADHtEQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2DGBNtE103001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2019 11:11:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Mar 2019 11:11:23 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1591.008; Wed, 13 Mar 2019 11:11:23 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti]  [rocko/master][PATCH] swtools: bump SRCREV
Thread-Index: AQHU2SrxfaI2reYkv0e2yILfy6kWTKYJvGEA
Date: Wed, 13 Mar 2019 16:11:23 +0000
Message-ID: <40e64f3399bf41fd9798666c7c48b30d@ti.com>
References: <1552338116-25917-1-git-send-email-xuj@ti.com>
	<20190312232555.GG28041@beryl>
In-Reply-To: <20190312232555.GG28041@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.116.215]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH] swtools: bump SRCREV
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
X-List-Received-Date: Wed, 13 Mar 2019 16:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, needed on rocko.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 12, 2019 7:26 PM
To: Xu, Jianzhong
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH] swtools: bump SRCREV

Needed on rocko?

On Mon, Mar 11, 2019 at 05:01:56PM -0400, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/swtools/swtools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtoo=
ls_git.bb
> index 425a069..16a8cc0 100644
> --- a/recipes-ti/swtools/swtools_git.bb
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -15,7 +15,7 @@ PR =3D "r0"
>  S =3D "${WORKDIR}/git"
>  BRANCH =3D "master"
>  SRC_URI =3D "git://git.ti.com/ep-processor-libraries/swtools.git;protoco=
l=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "881267836907de650edadc56b8e57ab45428021d"
> +SRCREV =3D "d0c1022954b489d5f3d8d2f5c81d8c6a392f4af4"
> =20
>  export C64PCODEGENTOOL =3D "${CGTOOLS_INSTALL_DIR}"
>  export C674CODEGENTOOL =3D "${CGTOOLS_INSTALL_DIR}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

