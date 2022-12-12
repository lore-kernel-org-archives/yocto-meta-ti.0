Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265CFC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 06:12:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.36851.1670825563266335215
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 22:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZORYFk0O;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BC6Cew2087207;
	Mon, 12 Dec 2022 00:12:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670825560;
	bh=G3nMe2wF4iyWGOfSeGMJxYxnpCD36bC/kx7Zmk8bMzk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZORYFk0OI/cY9f5hgWASrvIkwJ+cz9PwqDdIEnO3L8HIjwqTjFW4hnEEUGtyNCD4p
	 DliwIxRq8GuiogstxHLkTmconGYIDjGpP7RL7brBAKP0GezmWUHD705OTsGvRIFWJb
	 SE+FbEmmqUIKF10DtWC4rVxJC4dOns1QPXxNPnQE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BC6Cddl021615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Dec 2022 00:12:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 12
 Dec 2022 00:12:39 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 12 Dec 2022 00:12:39 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BC6Ccfm037758;
	Mon, 12 Dec 2022 00:12:39 -0600
Date: Mon, 12 Dec 2022 11:42:37 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH v2] optee: update optee-client,
 optee-test, optee-examples to 3.19 tag
Message-ID: <20221212061237.wh54ly3hcsbvgbkd@ula0497581>
References: <20221212054705.94060-1-m-chawdhry@ti.com>
 <20221212055558.GD22689@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221212055558.GD22689@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Dec 2022 06:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15449

On 00:55-20221212, Denys Dmytriyenko wrote:
> On Mon, Dec 12, 2022 at 11:17:05AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> > optee-os was updated to 3.19 tag but the others were still outdated.
> > 
> > Updates other optee components to 3.19 tag
> > 
> > Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> > ---
> > v1->v2:
> > - Fix build by adding depends
> > 
> >  recipes-security/optee/optee-client_%.bbappend   | 6 ++++--
> >  recipes-security/optee/optee-examples_%.bbappend | 4 ++--
> >  recipes-security/optee/optee-test_%.bbappend     | 4 ++--
> >  3 files changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
> > index 5675570a..19feaf6d 100644
> > --- a/recipes-security/optee/optee-client_%.bbappend
> > +++ b/recipes-security/optee/optee-client_%.bbappend
> > @@ -1,2 +1,4 @@
> > -PV_ti-soc = "3.17.0+git${SRCPV}"
> > -SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
> > +PV_ti-soc = "3.19.0+git${SRCPV}"
> > +SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
> > +
> > +DEPENDS += "pkgconfig"
> 
> NAK - any unconditional change of the upstream package will break YP compat 
> for meta-ti. Please see how it's done correctly - this patch actually captures 
> 2 such cases below...
> 

Ah okay, I see upstream including some patches to fix this one. Will update the
SHA once it's done.

Regards,
Manorit

> 
> > diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
> > index 9941b345..dda7cbbf 100644
> > --- a/recipes-security/optee/optee-examples_%.bbappend
> > +++ b/recipes-security/optee/optee-examples_%.bbappend
> > @@ -1,5 +1,5 @@
> > -PV_ti-soc = "3.17.0+git${SRCPV}"
> > -SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> > +PV_ti-soc = "3.19.0+git${SRCPV}"
> > +SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
> >  SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
> >  
> >  DEPENDS_append_ti-soc = " python3-cryptography-native"
> > diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
> > index d81ae521..79b4b4d6 100644
> > --- a/recipes-security/optee/optee-test_%.bbappend
> > +++ b/recipes-security/optee/optee-test_%.bbappend
> > @@ -1,5 +1,5 @@
> > -PV_ti-soc = "3.17.0+git${SRCPV}"
> > -SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
> > +PV_ti-soc = "3.19.0+git${SRCPV}"
> > +SRCREV_ti-soc = "ab9863cc187724e54c032b738c28bd6e9460a4db"
> >  SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
> >  
> >  DEPENDS_append_ti-soc = " python3-cryptography-native"
> > -- 
> > 2.34.1
> > 

