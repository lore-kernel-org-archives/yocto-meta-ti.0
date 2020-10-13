Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6390.1602624459560550605
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 14:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VcW9rtWv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DLRbIt033882;
	Tue, 13 Oct 2020 16:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602624458;
	bh=0cluu7BJUguVz5wMtczrMJL/epfw7Eo3rBdqblbnRN4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VcW9rtWvjvJpYmhQHwF3Inm/+Mc5n8wjcbvhpxYNlTQTcSjXqHgvRbK8C5qTJCPBe
	 QOPkvg5ZWTNkRhzV1fKLORNlRuqfiyQUAGiHx7sZweZBmZ/4+FTEoO3JaG4776TNpK
	 LnJgYKqz9ny0ETt0JDFK3lvqMaly+pUe0vEU+V3E=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DLRbDD063035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Oct 2020 16:27:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 16:27:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 16:27:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DLRbv8106011;
	Tue, 13 Oct 2020 16:27:37 -0500
Date: Tue, 13 Oct 2020 17:27:37 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 1/2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
Message-ID: <20201013212736.GE14852@beryl>
References: <20201013183642.267548-1-raj.khem@gmail.com>
 <20201013205557.GB14852@beryl>
 <CAMKF1srt+gXsc9-xrcXrzu3-Q7eHGNA1vZwDrC0+Gf1wVyvdeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srt+gXsc9-xrcXrzu3-Q7eHGNA1vZwDrC0+Gf1wVyvdeQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2020 at 02:22:30PM -0700, Khem Raj wrote:
> On Tue, Oct 13, 2020 at 1:55 PM Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Tue, Oct 13, 2020 at 11:36:41AM -0700, Khem Raj wrote:
> > > latest OE-core does not promote using trailing slash to make pseudo's
> > > life easier
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  classes/ti-pdk-fetch.bbclass | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> > > index 0c9879be..4261e86d 100644
> > > --- a/classes/ti-pdk-fetch.bbclass
> > > +++ b/classes/ti-pdk-fetch.bbclass
> > > @@ -9,13 +9,13 @@ PV = "${TI_PDK_VERSION}"
> > >  PE = "2"
> > >
> > >  TI_PDK_COMP ?= ""
> > > -TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
> > > +TI_PDK_COMP_PATH = "/${@'${TI_PDK_COMP}'.replace('.','/')}"
> >
> > This one I don't understand - even when TI_PDK_COMP is empty,
> > TI_PDK_COMP_PATH will have a trailing slash, hence S below will
> > have it too...
> 
> 
> Right I think I was thinking of ensuring that we can make conditional to
> have the slash always and then remove it from S which is missing
> 
> I guess it needs to be solved differently
> 
> 
> >
> > Moreover, below in this class there's this line:
> >
> > src =
> > os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))
> >
> > If TI_PDK_COMP_PATH starts with a leading slash, os.path.join treats
> > it as absolute and the resulting "src" var will be completely wrong.
> 
> 
> This is not going to be problem it will just use // in worst case

Nope, I tested - it should combine $TI_PDK_SOURCE/packages/$TI_PDK_COMP_PATH

>>> print(os.path.join('a','b','c'))
a/b/c
>>> print(os.path.join('a','b','/c'))
/c

So, if TI_PDK_COMP_PATH starts with slash, it becomes absolute and the final 
src path will be wrong.


> > So, I believe this change is incorrect.
> >
> >
> > >  TI_PDK_SOURCE_PN = "ti-pdk-source"
> > >  TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
> > >  TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
> > >
> > > -S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
> > > +S = "${WORKDIR}/git${TI_PDK_COMP_PATH}"
> > >
> > >  # Hard-link only required sources from PDK
> > >  python do_unpack_append() {
> > > --
> > > 2.28.0
> > >
> >
> > >
> > > 
> > >
> >
> >
