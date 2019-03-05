Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FE73E00CCC; Tue,  5 Mar 2019 15:20:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC926E00C43
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2019 15:20:46 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25NKkPx102153
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 17:20:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551828046;
	bh=QtZ6E1qanPNf4+JGR75xU+1qWPcT8Pv2bCPhbuf+utU=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=FQSpl01231ZheI4MSed3Y3gckBxaHvj8sCHB/X3r1NFI+i5kOKVwe5DGpkiFbLGoT
	yQV2ge81ID3HfEyEXEnicrDSlXjH7hnL9NbfkqlNZ9m7nlo78ChQIbYPvtEvdGu125
	Kqe2Fj1r4ZyMkfvkBIjbh8aUOYUcMhf3v5qmBYiI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25NKj59075606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 17:20:45 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 17:20:45 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1591.008; Tue, 5 Mar 2019 17:20:45 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [rocko/master][PATCH] ti-ndk: Correcting
	the SRC_URI link
Thread-Index: AQHU0thiYCDzoeBEV0qKy8phEbQ/UaX9rmog
Date: Tue, 5 Mar 2019 23:20:45 +0000
Message-ID: <79e67be591c046c3bd4378932b9f77c3@ti.com>
References: <1551737951-45344-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551737951-45344-2-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1551737951-45344-2-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [rocko/master][PATCH] ti-ndk: Correcting the SRC_URI link
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
X-List-Received-Date: Tue, 05 Mar 2019 23:20:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please apply to rocko.

- Jake

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Monday, March 04, 2019 5:19 PM
> To: meta-ti@yoctoproject.org
> Subject: [EXTERNAL] [meta-ti] [rocko/master][PATCH] ti-ndk: Correcting th=
e
> SRC_URI link
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/ndk/ti-ndk.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
> index dfb09de..9afde31 100644
> --- a/recipes-ti/ndk/ti-ndk.inc
> +++ b/recipes-ti/ndk/ti-ndk.inc
> @@ -6,8 +6,7 @@ LICENSE =3D "BSD"
>  require recipes-ti/includes/ti-paths.inc
>=20
>  S =3D "${WORKDIR}/ndk_${PV}"
> -
> -SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/${PV}/exports/n
> dk_${PV}.zip;name=3Dndkzip"
> +SRC_URI =3D "http://software-
> dl.ti.com/targetcontent/ndk/${PV}/exports/ndk_${PV}.zip;name=3Dndkzip"
>=20
>  do_install() {
>      CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

