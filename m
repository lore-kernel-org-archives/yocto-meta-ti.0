Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.634.1618507774536417964
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 10:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J/8B8ZzE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FHTXr1032341;
	Thu, 15 Apr 2021 12:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618507773;
	bh=l670DXH2cqMiZTMOTmxL9o1xguv2ygK5O7L8rQi/uLA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=J/8B8ZzEKJx7ivOHP4BK5KrEh7GuTsOHpGwJZMSFoLhDvyVdBQ1e+/RPZqFfuROyj
	 YpbSBcJdAVlvOFdfMUyYRL69iFy4qrWHMrC9SUuEPYgqiiJNklHDDuJpg4fPlBEaKw
	 avLyJkPhps5N92enR+1cOf8ufVAdj/HaFEkEwx1k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FHTWH5117652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 12:29:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 12:29:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 12:29:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FHTWYi023075;
	Thu, 15 Apr 2021 12:29:32 -0500
Date: Thu, 15 Apr 2021 12:29:32 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti] [dunfell/master PATCH 3/3] AM64x Unification: Update ti-sci-fw recipe
Message-ID: <20210415172932.2b46s3imaf5adc5x@subpanel>
References: <20210408071654.63212-1-sinthu.raja@mistral.in>
 <20210408134409.u24qdeiindwia2hl@paralyses>
 <CAEd-yTRmTJm80fHNb9VVewxA8zYX4ymDH0OE6LbdQqXVBivFHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEd-yTRmTJm80fHNb9VVewxA8zYX4ymDH0OE6LbdQqXVBivFHA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 22:46-20210415, Sinthu Raja M wrote:
> On Thu, Apr 8, 2021 at 7:14 PM Nishanth Menon <nm@ti.com> wrote:
> >
> > On 12:46-20210408, Sinthu Raja M via lists.yoctoproject.org wrote:
> > > From: Sinthu Raja <x0257345@ti.com>
> > >
> > > Updtae ti-sci-fw recipe to build for both SK and EVM compilation and
> > s/Updtae/Update/
> >
> > > installation through one machine name
> >
> >
> > Why are we doing this? What happens to the wic file image? What is the
> > out of box experience for someone creating an SD image -> flash the
> > image then modify the sd card? how would that help?
> >
> The AM64x EVM and SK have similar rootfs, kernel and u-boot source
> except for R5 SPL where EVM and SK have two different DDR
> configurations.
> Two different processor SDK for EVM and SK creates overhead for
> customers just for the change in tiboot3.bin. Two avoid the overhead,
> we are creating two
> different images for EVM and SK under one MACHINE_NAME (which is am64xx-evm)
> 
> Two WIC files will be available separately for EVM and SK in the
> processor SDK installer. Users can use respective WIC files for
> flashing on to the respective boards.

since meta-yocto, meta-arago etc use the same meta-ti layer,

Could you explain how, in meta-arago/meta-ti am I generating two different wic
files with the current patch series? I am probably missing some nuance
in your patches..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
