Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3210.1580355253221857151
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 19:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lOUpomM6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00U3YBG9056445;
	Wed, 29 Jan 2020 21:34:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580355251;
	bh=YxhV01iUuZeQPJaGOCTjrRD6ul20hktCMGt4EZToviM=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=lOUpomM6viHv0KzxlCOuhXngLzLEgVnrNBPuKZItSmd9msRw7jxARNLB0tFily5x8
	 gH2nNj5/CHi2XqlnsQr2oDrnFgTAHmFmZy4tWZrsF21s7jsmb3LBjAjyix2aDMkyjL
	 yWXl9iwTMO9MIiRfpbPCc7m5Z1OHV88TvPfKIKbM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00U3YAnH097082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jan 2020 21:34:10 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 21:34:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 21:34:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00U3YArX108507;
	Wed, 29 Jan 2020 21:34:10 -0600
Date: Wed, 29 Jan 2020 22:34:10 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Peter Griffin <peter.griffin@linaro.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH] jailhouse_git: update to inherit python3 classes
Message-ID: <20200130033410.GV3658@beryl>
References: <1580339755-23335-1-git-send-email-peter.griffin@linaro.org>
 <15EE7ED3E5F24894.17230@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15EE7ED3E5F24894.17230@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Let me elaborate:

1. Your patch is incomplete - it fixes parsing issues, but not build issues
2. There was a more complete patch submitted earlier in the day to address that:
https://lists.yoctoproject.org/g/meta-ti/message/12625

-- 
Denys


On Wed, Jan 29, 2020 at 06:19:23PM -0500, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> NAK
> 
> On Wed, Jan 29, 2020 at 11:15:55PM +0000, Peter Griffin wrote:
> > This avoids the parsing errors, now that python2
> > has been removed.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> > index 4186dc3..89833e6 100644
> > --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> > +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> > @@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
> >  S = "${WORKDIR}/git"
> >  
> >  require jailhouse-arch.inc
> > -inherit module pythonnative bash-completion deploy setuptools
> > +inherit module python3native bash-completion deploy setuptools3
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  COMPATIBLE_MACHINE = "(ti-soc)"
> > -- 
> > 2.7.4
> > 

> 

