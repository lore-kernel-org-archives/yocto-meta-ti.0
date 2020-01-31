Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.1269.1580432253924949589
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 16:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ag1HO8dw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00V0vWpV102554;
	Thu, 30 Jan 2020 18:57:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580432252;
	bh=RwBSKFD+80epF6E76V1B13bfvBTk6fWarvV9Cz1PnKA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ag1HO8dwl7MiuKEvsYVMfyAP3Iw5C5DTQ2m890bt0er1s68keza/ztNFqgmOJ7qI4
	 EOpF0tezUKEREquz8Udcm9ooUv+oc5gAHk1XU0ja9kSsRyp4CD5qFCo8tJka/gzBi+
	 rfgvvvhz5+i1NoMQfhJKzu/0bMXoY1RKNngAGbDY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00V0vWpA059324;
	Thu, 30 Jan 2020 18:57:32 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 30
 Jan 2020 18:57:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 30 Jan 2020 18:57:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00V0vWEV123540;
	Thu, 30 Jan 2020 18:57:32 -0600
Date: Thu, 30 Jan 2020 19:57:31 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Peter Griffin <peter.griffin@linaro.org>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] jailhouse_git: update to inherit python3 classes
Message-ID: <20200131005731.GX3658@beryl>
References: <1580339755-23335-1-git-send-email-peter.griffin@linaro.org>
 <15EE7ED3E5F24894.17230@lists.yoctoproject.org>
 <20200130033410.GV3658@beryl>
 <CADrjBPopF503QR2_d6T7-SWCNqG_hbAobN866jBSMWVTfdmJ1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrjBPopF503QR2_d6T7-SWCNqG_hbAobN866jBSMWVTfdmJ1w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 30, 2020 at 09:14:47AM +0000, Peter Griffin wrote:
> Hi Denys,
> 
> On Thu, 30 Jan 2020 at 03:34, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Let me elaborate:
> >
> > 1. Your patch is incomplete - it fixes parsing issues, but not build issues
> >
> 
> Thanks for the extra info, yes that is correct I didn't build any TI
> platform,
> but I needed to fix the parse issues to build the non meta-ti based platform
> I was working on (or disable your layer). I should have made that clearer
> in the commit message.
> 
> 2. There was a more complete patch submitted earlier in the day to address
> > that:
> > https://lists.yoctoproject.org/g/meta-ti/message/12625
> 
> 
> Ok great. I was trying to check your mailing list but seems I was using a
> old link from the README here
> https://www.yoctoproject.org/pipermail/meta-ti/.

Ah, good point! I need to update that. Thanks.


> Peter.
> 
> >
> >
> > --
> > Denys
> >
> >
> > On Wed, Jan 29, 2020 at 06:19:23PM -0500, Denys Dmytriyenko via
> > Lists.Yoctoproject.Org wrote:
> > > NAK
> > >
> > > On Wed, Jan 29, 2020 at 11:15:55PM +0000, Peter Griffin wrote:
> > > > This avoids the parsing errors, now that python2
> > > > has been removed.
> > > >
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > ---
> > > >  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb
> > b/recipes-kernel/jailhouse/jailhouse_git.bb
> > > > index 4186dc3..89833e6 100644
> > > > --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> > > > +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> > > > @@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
> > > >  S = "${WORKDIR}/git"
> > > >
> > > >  require jailhouse-arch.inc
> > > > -inherit module pythonnative bash-completion deploy setuptools
> > > > +inherit module python3native bash-completion deploy setuptools3
> > > >
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > >  COMPATIBLE_MACHINE = "(ti-soc)"
> > > > --
> > > > 2.7.4
> > > >
> >
> > > 
> >
> >
