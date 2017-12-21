Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A5D3E00E89; Thu, 21 Dec 2017 09:17:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B221BE00E3F
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 09:17:07 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBLHH6PX032335
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:17:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513876626;
	bh=ysFvs5m1yUPYtzKELTU4t/vQPwhCjlnmSNAf3klW9b8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=A40VS3SqgSwBtjdmY14w8ymWCqvrEXe4TEfct9iJPLNv9oNd9nAve879erLy+KUVx
	QsDEvwdjbrdb2lIt06GJhoPhxhMmTmgeTOl6NAnQ/+5WNrutDy55fwPu8FDhbxMC4o
	I0PB1RQ+ZRPVc7vcaBMbdVbU8lGJmZ8pJqbcVSm8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBLHH6er020854
	for <meta-ti@yoctoproject.org>; Thu, 21 Dec 2017 11:17:06 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 21 Dec 2017 11:17:06 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Thu, 21 Dec 2017 11:17:06 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [morty/master][PATCH ] ti-ndk: Updating to version
	2.26.00.08
Thread-Index: AQHTdRcAIHWlJOWXCUKBz77HbgWHMqNOZnQA//+uLEA=
Date: Thu, 21 Dec 2017 17:17:06 +0000
Message-ID: <3d776b07b7a045f28a2b30d62f4ea8aa@ti.com>
References: <1513281882-44118-1-git-send-email-m-radhakrishnan2@ti.com>
	<20171214200616.GH31492@edge> <20171221160906.GC5984@edge>
In-Reply-To: <20171221160906.GC5984@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.157]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty/master][PATCH ] ti-ndk: Updating to version 2.26.00.08
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
X-List-Received-Date: Thu, 21 Dec 2017 17:17:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
 I have resubmitted the patch with -M -C01 option added to the git send-ema=
il command.=20

Regards
Machu.
-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, December 21, 2017 11:09 AM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [morty/master][PATCH ] ti-ndk: Updating to version 2=
.26.00.08

Ping

On Thu, Dec 14, 2017 at 03:06:17PM -0500, Denys Dmytriyenko wrote:
> Please use -C/-M
>=20
> On Thu, Dec 14, 2017 at 03:04:42PM -0500, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 13 ------------- =20
> > recipes-ti/ndk/ti-ndk_2.26.00.08.bb | 13 +++++++++++++
> >  2 files changed, 13 insertions(+), 13 deletions(-)  delete mode=20
> > 100644 recipes-ti/ndk/ti-ndk_2.25.01.11.bb
> >  create mode 100644 recipes-ti/ndk/ti-ndk_2.26.00.08.bb
> >=20
> > diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb=20
> > b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
> > deleted file mode 100644
> > index d5d926b..0000000
> > --- a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
> > +++ /dev/null
> > @@ -1,13 +0,0 @@
> > -require ti-ndk.inc
> > -
> > -PV =3D "2_25_01_11"
> > -PR =3D "r0"
> > -
> > -LIC_FILES_CHKSUM =3D "file://ndk_${PV}_manifest.html;md5=3D80a8d9b76cf=
700929d3f5b6df09052d6"
> > -
> > -SRC_URI[ndkzip.md5sum] =3D "e42bfcc8c3a6d183d60f26ec01ccc79b"
> > -SRC_URI[ndkzip.sha256sum] =3D "a15bc9b570dc0628dd8b8c3665037a162610a6f=
86c5f17ebb6a329d3db60f071"
> > -
> > -INHIBIT_PACKAGE_STRIP =3D "1"
> > -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > -INHIBIT_SYSROOT_STRIP =3D "1"
> > diff --git a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb=20
> > b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
> > new file mode 100644
> > index 0000000..e587bf9
> > --- /dev/null
> > +++ b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
> > @@ -0,0 +1,13 @@
> > +require ti-ndk.inc
> > +
> > +PV =3D "2_26_00_08"
> > +PR =3D "r0"
> > +
> > +LIC_FILES_CHKSUM =3D "file://ndk_${PV}_manifest.html;md5=3De2a7d40cf1e=
7207ac3dd6d993d71ee8c"
> > +
> > +SRC_URI[ndkzip.md5sum] =3D "09c7ffaff305f3083d15c0a0db73d781"
> > +SRC_URI[ndkzip.sha256sum] =3D "5b22c6b8bfbf3a22c53f52bf880d5cf49daf386=
716942a4202569521bb30f4a8"
> > +
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > +INHIBIT_SYSROOT_STRIP =3D "1"
> > --
> > 1.9.1
> >=20
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

