Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2792BC27C53
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 16:07:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19562.1717603656628417736
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 09:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iJ97JvXH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 455G7X0s073679;
	Wed, 5 Jun 2024 11:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717603653;
	bh=Nosa2LPa8z+2JhqSrI/5uCZOvzfrcAp4XtAn8O7WDGs=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=iJ97JvXHSp0OmxVq96su3BVuEwfVtPgX8hOh0ykL5XfA5yPfAFJrSC9h/fU6dJXHX
	 S/vysiExHiitx1zcPRkLx7mIXBIKpfHRgFVyXeQZOFfnwOBYI6A39H6PL6ay85eU09
	 CVkU6d5848sXPHfoN+kqKCUNp5Rekcwsc2vBwWSk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 455G7WAU071819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jun 2024 11:07:32 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 11:07:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 11:07:32 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 455G7WlO124081;
	Wed, 5 Jun 2024 11:07:32 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 5 Jun 2024 11:07:32 -0500
Message-ID: <D1S7OGYL8GE4.2LX587YKETRP4@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH] gitignore: lift some sane
 defaults from others
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.17.0
References: <20240603195515.1089534-1-rs@ti.com>
 <20240604191231.GP21287@denix.org>
 <69324605-d0ab-40e1-bbe0-b13ce8712ade@ti.com>
In-Reply-To: <69324605-d0ab-40e1-bbe0-b13ce8712ade@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jun 2024 16:07:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17697

On Tue Jun 4, 2024 at 5:15 PM CDT, Ryan Eatmon wrote:
>
>
> On 6/4/2024 2:12 PM, Denys Dmytriyenko wrote:
> > On Mon, Jun 03, 2024 at 02:55:15PM -0500, rs@ti.com wrote:
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> Lift the common parts of the top level gitignore from oe-core and
> >> meta-openembedded. This masks out temporary python files, intermediate
> >> artifacts, and patches at the root of the project.
> >=20
> > FWIW, this is a matter of a personal preference, e.g. I don't like when
> > git ignores, essentially hiding patches in the top directory. I do pref=
er
> > them to be visible with "git status". But I'll leave it to Ryan.
>
> Yeah.  I was testing it, but I was also thinking the same thing and=20
> trying to decide if I wanted to take them.  Maybe a reduced set might=20
> good.  Like leave the patches, but hide the temp files and what not?=20
> What are your thoughts on that?  Just remove the *.patch from the list=20
> below?

Up to you guys. I just noticed the different behavior in this layer and wan=
ted
to get us more in sync with core.

> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>   .gitignore | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>   create mode 100644 .gitignore
> >>
> >> diff --git a/.gitignore b/.gitignore
> >> new file mode 100644
> >> index 00000000..c01df45e
> >> --- /dev/null
> >> +++ b/.gitignore
> >> @@ -0,0 +1,7 @@
> >> +*.pyc
> >> +*.pyo
> >> +/*.patch
> >> +*.swp
> >> +*.orig
> >> +*.rej
> >> +*~
> >> --=20
> >> 2.45.1


