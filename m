Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1143.1574710370393704072
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 11:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=QjQkCZIg;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDF14E00F84; Mon, 25 Nov 2019 11:32:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3AE4E0082A
	for <meta-ti@yoctoproject.org>; Mon, 25 Nov 2019 11:32:48 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPJWl27008958;
	Mon, 25 Nov 2019 13:32:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574710367;
	bh=J1kuWIluWD4wnu4opRWcVRumqS5KsG0RfnySfgDPw7g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QjQkCZIgBF/FRrP7WGJQzzsPB3SoRQjfuxEiOJYvG9868MOqCTs2wZpGT0+U6V+bE
	 teqn0ABR+uhLzgn+GPwO81s8mRTR+B++RwpHm0o3JqIq0JGpozTaF2hG9qiLYAmSuV
	 CCOH+aZMUmruunLH1hp3ONMJDuanAmiHxlVgeLos=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPJWlJn122997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Nov 2019 13:32:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 13:32:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 13:32:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPJWlWq130389;
	Mon, 25 Nov 2019 13:32:47 -0600
Date: Mon, 25 Nov 2019 14:32:47 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Jacob Stiffler <j-stiffler@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
Message-ID: <20191125193247.GE4706@beryl>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
 <1573830902-17409-2-git-send-email-j-stiffler@ti.com>
 <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
 <20191125174203.GC4706@beryl>
 <0606aa72-212f-94c8-82d4-1cfc0ab1930f@ti.com>
 <CAMKF1so=afwh92LnJQjgEMrYdw75jwM=WTNdW+hRgnyYbNcjQw@mail.gmail.com>
 <c7b182ec-858d-43b2-7caf-9f12a7fe67d6@ti.com>
 <CAMKF1spOAJ5fA2DZqra_VCB9HwGTijVuFuhifCTh1yRtZXEJ2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spOAJ5fA2DZqra_VCB9HwGTijVuFuhifCTh1yRtZXEJ2g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Would hard-linking be any better? Will need to recursively hard-link all =
the=20
files in a specific directory, but may be faster and less IO-intensive th=
an=20
copying or tarring/untarring all the files?

--=20
Denys


On Mon, Nov 25, 2019 at 11:24:12AM -0800, Khem Raj wrote:
> Ideally I agree it=E2=80=99s best to have per component git repos
> But traditional SDKs have been monolithic
>=20
> On Mon, Nov 25, 2019 at 10:50 AM Jacob Stiffler <j-stiffler@ti.com> wro=
te:
>=20
> >
> > On 11/25/2019 1:16 PM, Khem Raj wrote:
> >
> > On Mon, Nov 25, 2019 at 10:12 AM Jacob Stiffler <j-stiffler@ti.com> <=
j-stiffler@ti.com> wrote:
> >
> > On 11/25/2019 12:42 PM, Denys Dmytriyenko wrote:
> >
> > On Fri, Nov 15, 2019 at 09:14:15AM -0800, Khem Raj wrote:
> >
> > On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
> >
> > Recently individual components and LLD sources have been combined
> > into a single PDK repo. Use this class to specify the common source.
> > Also use this class to keep the sources separate from each other when
> > building. This keeps the build identical to previous recipes while
> > keeping control on interdependencies.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com> <j-stiffler@ti.com>
> > ---
> >
> > ...
> >
> > +# Extract only required sources from PDK
> > +python do_unpack_append() {
> > +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> > +        import subprocess
> > +
> > +        src =3D
> > os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
> > PATH'))
> > +
> > +        # Package up only the required sources
> > +        cmd =3D 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
> > d.getVar('S'))
> > +        subprocess.check_output(cmd, shell=3DTrue,
> > stderr=3Dsubprocess.STDOUT)
> > +
> > +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=3DTrue)
> > +}
> >
> > perhaps looking in work-shared idea from kernel or gcc or clang
> > packages could make it better where, you only untar sources once
> >
> > Jake,
> >
> > Any updates on this - will you be looking into the above suggestion?
> >
> > I had originally considered this approach, but decided against it so
> > that there would be no way a recipe could access other sources in the
> > pdk.git.
> >
> > It may be a bit paranoid, but the work-shared approach would make the
> > entire pdk sources available through a ti-pdk-fetch variable. I wante=
d
> > it so that the entire pdk.git will never be unpacked in its entirety.
> >
> > disk operations are not cheap, so you could save a lot by
> > having a monorepo. Is it due to access perms ? then its a single
> > tarballs you cant have ACLs. I am still not convinced if monorepo
> > approach has downsides, plus its a known approach elsewhere so
> > will be easy on users.
> >
> > We wanted to have this safety net to make sure that this pdk.git does=
 not
> > end up as spaghetti code. So this method was devised to ensure that o=
nly a
> > single component's sources and its DEPENDS are available during
> > compilation.
> >
> > It may be acceptable to clone to the work-shared path, and then symli=
nk
> > the specific directory into the WORKDIR. But we will need to remain
> > vigilant so that work-shared path is never referenced in the recipe.
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#12528): https://lists.yoctoproject.org/g/meta-ti/=
message/12528
> > Mute This Topic: https://lists.yoctoproject.org/mt/61321552/3619770
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [j-stiff=
ler@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
