Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.318.1582166631855917652
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 18:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ch3ct6Ev;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01K2hoNO064669;
	Wed, 19 Feb 2020 20:43:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582166630;
	bh=NUZh2CuDWb1ZYxUxT2qId0xn5N3lFB0dYjoX2Kb/H4o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ch3ct6EvogRWCwmQg/01J43av2TjiyXvbkcNWuJ1qkOJnN73PA22uPW3QWeJXFa67
	 qMlURLmuf1tWlEJ15OxtX8YHKgYJKHqRUD6nypyDKD9cPnBHNsiyU0WUSAQ3SpyLJq
	 j8n0Gym8AFXlxMLVfc/yRveejWBASoDtNvFkOa7U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K2ho9U117190;
	Wed, 19 Feb 2020 20:43:50 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 20:43:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 20:43:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K2hYQ8114017;
	Wed, 19 Feb 2020 20:43:34 -0600
Date: Wed, 19 Feb 2020 21:43:33 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: ti-cgt6x bundling libc.a with unreadable ELF file header
Message-ID: <20200220024331.GD720@beryl>
References: <CAMKF1sqBztnkEciT045JbkeYyacjCe91b3FNCkv8k77DLEY=-g@mail.gmail.com>
 <20200212200811.GE30768@beryl>
 <CAMKF1sqGMyrWEx1phE5XuP2=7_uxeu6q7itMvhvBOvxYJP0Jaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqGMyrWEx1phE5XuP2=7_uxeu6q7itMvhvBOvxYJP0Jaw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 12, 2020 at 02:19:38PM -0800, Khem Raj wrote:
> On Wed, Feb 12, 2020 at 12:08 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Sun, Feb 09, 2020 at 10:26:44AM -0800, Khem Raj wrote:
> > > Hi
> > >
> > > Recently, I am seeing below packaging error for ti-cgt6x
> > >
> > > https://errors.yoctoproject.org/Errors/Details/390526/
> >
> > Is this on master? Any specific configuration I should use to get this error?
> > I don't think I've ever seen this before or lately...
> 
> yes this is on qemuarm though, I find that it will be better to
> disable it for non-ti socs

Hmm, I still wonder why it's not breaking on ti-soc machines. May need to add 
INHIBIT_PACKAGE_DEBUG_SPLIT = "1", but I would like to reproduce the issue 
first, if possible...


> > > eu-readelf also fails to read this file as well as binutils readelf
> > > also complains
> > >
> > > readelf: Error:
> > > /mnt/b/yoe/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a(__TI_$$LIBINFO):
> > > Failed to read file header
> > >
> > > this libc.a is a binary blob so I cant find out how it is. built so
> > > pinpoint where the problem
> > > could be.
> > >
> > > since these are DSP blobs should this be ignored from processing and
> > > just dumped into rootfs
> > > this will help packager turn a blind eye towards its contents or
> > > should this be fixed and turned into
> > > a readable ELF file by normal binutils. I doubt it being a problem
> > > with tools, since I see same issue
> > > with elfutils tools as well as binutils ELF manipulation tools.
> > >
> > > Thanks
> > > -Khem
