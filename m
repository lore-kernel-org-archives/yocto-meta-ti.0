Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16133E00A38; Tue, 14 Aug 2018 07:58:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C44DE00519
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 07:58:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EEwMPF053367
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 09:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534258702;
	bh=kA/jETkb3TQkBcke+VEr60/7YeeMUu1D3KtLAzZWYLA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=SL5erl7y+VBKUWS4W5BR5cyEQS3oH8X9JEFt4afzrSpN95/rUAEhR3aOamLTxo/SB
	2cdx7JO1/AwH+HmiaZKe4xKYbwVwVIlQn5Tm6TrNQoPSp+tqbUfbD5U4qkmPIsD21u
	YnanDTn9hhAAFoiSc+mHPBZ5OYoWmIy5bNCx06JM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EEwMWO020817
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 09:58:22 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 09:58:21 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1466.003; Tue, 14 Aug 2018 09:58:21 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] recipes-ti: devtools: add TI XDC tools
	3.50.07.20
Thread-Index: AQHUMLpY73m9D+dwK0CLUpK65BOFwaS+xYsAgACXSVA=
Date: Tue, 14 Aug 2018 14:58:21 +0000
Message-ID: <bd0cf0d2aa7441a48bb02bb3fb2bb064@ti.com>
References: <1533894867-29738-1-git-send-email-hzhang@ti.com>
	<20180814005610.GY2547@beryl>
In-Reply-To: <20180814005610.GY2547@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.179]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] recipes-ti: devtools: add TI XDC tools 3.50.07.20
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
X-List-Received-Date: Tue, 14 Aug 2018 14:58:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, August 13, 2018 8:56 PM
> To: Zhang, Hao
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/2] recipes-ti: devtools: add TI XDC tools
> 3.50.07.20
>=20
> On Fri, Aug 10, 2018 at 05:54:27AM -0400, hzhang@ti.com wrote:
> > From: Hao Zhang <hzhang@ti.com>
> >
> > Signed-off-by: Hao Zhang <hzhang@ti.com>
> > ---
> >  recipes-ti/devtools/ti-xdctools_3.50.07.20.bb | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644 recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
>=20
> Why is 3.50.03 being left around?
>=20
Please keep the old version for now, we will remove it later if it is not n=
eeded.
>=20
> > diff --git a/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb b/recipes-
> ti/devtools/ti-xdctools_3.50.07.20.bb
> > new file mode 100644
> > index 0000000..d45f373
> > --- /dev/null
> > +++ b/recipes-ti/devtools/ti-xdctools_3.50.07.20.bb
> > @@ -0,0 +1,9 @@
> > +require recipes-ti/devtools/ti-xdctools-core.inc
> > +
> > +PV =3D "3_50_07_20"
> > +PR =3D "r0"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://docs/license/xdc/shelf/package.html;beginline=3D1;endline=3D140;m=
d5=3D1
> 796f68c3d32d408415f5612f1f60652"
> > +
> > +SRC_URI[xdczip.md5sum] =3D "52e4b5ddf2e004c6acff52104840724e"
> > +SRC_URI[xdczip.sha256sum] =3D
> "bef631c110ca9243790de06cd51839170d7979b92e01396e4265009776ff7a07
> "
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

