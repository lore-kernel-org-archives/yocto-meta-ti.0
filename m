Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2430.1614891360185747244
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 12:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S5JVSPtX;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CC86E38C0845
	for <meta-ti@yoctoproject.org>; Thu,  4 Mar 2021 20:55:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 124KttXm069155;
	Thu, 4 Mar 2021 14:55:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614891355;
	bh=JCLxjROyJP9mm3ApIfOzNUUpkKtKpU5ud9IAxCztmF0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S5JVSPtXAhfJCh46RR+O0b2PRlvuM4zEQCeC+j9/pJ26yXBpZtC5JKfknji5dPkM2
	 fu6uWfMBzX22NrJljWjYAF+Xoc8bRibD0pdE6Bw3wpKXlblsyA7mDh5oyrkx9pohxL
	 6BBCYizBUPwwE82pC/JfbkV+0b+bh16ijgkEr/Bo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 124Ktsgo009568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Mar 2021 14:55:54 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Mar
 2021 14:55:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Mar 2021 14:55:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 124KtsK1055253;
	Thu, 4 Mar 2021 14:55:54 -0600
Date: Thu, 4 Mar 2021 14:55:54 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti @ yoctoproject . org" <meta-ti@yoctoproject.org>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>
Subject: Re: [PATCH dunfell/dunfell-next/master 0/2] linux-ti-mainline: Move Linux to v5.11
Message-ID: <20210304205554.ajsxztbbtqeugthz@tightness>
References: <20210304042808.9389-1-nm@ti.com>
 <20210304193009.GG4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210304193009.GG4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14:30-20210304, Denys Dmytriyenko wrote:
> In the subject, -next is implied. It is part of the process (and is up to 
> the maintainer to follow), but you just specify the target branches you need 
> this in - dunfell and master.
> 
> 
> On Wed, Mar 03, 2021 at 10:28:06PM -0600, Nishanth Menon wrote:
> > Hi,
> > 
> > A series of minimal patches to bump up recision to the latest kernel ->
> 
> Recision? You probably meant revision? :)

hehe.. indeed.
> 
> 
> > we will need to maintain upstream-tools and kernel in sync on all
> > branches involved ofcourse.
> > 
> > NOTE: with kernels > 5.9 (aka 5.10, 5.11...) we do have problems with
> > cryptodev and kernel - we will have to try and see how best to integrate
> > those as well. This is solved in master of oe-core[1] by moving to 1.12,
> > however gatesgarth, dunfell are on 1.11 and 1.10 revs respectively
> > which wont work since the PR integrated version is 1.12
> 
> PV, not PR.

I had intended PR as in Pull Request[2] to indicate the specific pull
request, I now realize it is easy to mix it up against product revision
as well.. ooops..


> 
> 
> > Nishanth Menon (2):
> >   linux-ti-mainline: Bump up ti-upstream-tools SRCREV
> >   linux-ti-mainline: Bump kernel version to v5.11
> 
> Ok, as long as you are not bumping linux-ti-staging, which is still the 
> default kernel in meta-ti and 5.4 is being preferred, you should be fine 
> with cryptodev "fix" in meta-arago.

	Yup, that was my thought as well.
> 
> Will need to revisit that later, if/when 5.10 LTS is ready to become the 
> default in meta-ti dunfell...

true.


Thanks for your reviewed-bys..
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
