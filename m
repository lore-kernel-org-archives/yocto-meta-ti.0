Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB81C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 09:33:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17752.1684834397295189673
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 May 2023 02:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Kj0F0Xdn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-luthra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34N9XFl8103656;
	Tue, 23 May 2023 04:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684834395;
	bh=naBKuqaCUdZfFhaFX06rnCyJBfAFLjVC2eOn5nH8XXQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kj0F0XdniAhmyxLhIk8/TLAG8JDUH4IbO9xFaXbTjqnBsVHDZlFHYivpjOJ3Kj92R
	 4CjNvIeOv6sVpZ+pR03LqjI08NxyUthuHltV3/rkIu53+hnUyURjJ06zeeZ/A9K/3F
	 lLIxI2COa1BP8UGNOIYXMOqiVPSWOo5aYlckzQ6g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34N9XF23002410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 May 2023 04:33:15 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 04:33:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 04:33:14 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34N9XESS045962;
	Tue, 23 May 2023 04:33:14 -0500
Date: Tue, 23 May 2023 15:03:10 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>,
        Rahul T R <r-ravikumar@ti.com>
Subject: Re: [master/kirkstone][PATCH 1/2] v4l-utils: Add recipe for v1.23.0
Message-ID: <bpt3xsl2hchj4ffz3rstjqrf67x23dpsfcc43jy7wwewoy3dkm@jwyabkop3y6p>
References: <20230523082101.1494890-1-j-luthra@ti.com>
 <1cc45554-0c98-3a36-3153-cf0dcae05f6a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1cc45554-0c98-3a36-3153-cf0dcae05f6a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 May 2023 09:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16579

Hi Devarsh,

On May 23, 2023 at 14:27:01 +0530, Devarsh Thakkar wrote:
> Hi Jai,
> 
> Thanks for the patch.
> 
> On 23/05/23 13:51, Jai Luthra wrote:
> > An older recipe (v1.22.0) is present in the meta-openembedded/meta-oe
> > layer for kirkstone.
> > 
> > TI's 6.1 based kernel has backported multistream routing APIs [1] from
> > upstream kernel, which requires a few patches to v4l-utils [2] that only
> > apply cleanly on top of v1.23.0.
> > 
> > Thus we override the recipe in this layer to the latest (v1.23.0) found
> > from meta-oe master.
> > 
> > Link: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ca55d70b41e [1]
> > Link: https://lore.kernel.org/all/20230210115546.199809-1-tomi.valkeinen@ideasonboard.com/ [2]
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> 
> Did you mean to send to meta-arago@lists.yoctoproject.org instead  ?

Oops, yes my bad - I should not re-use old scripts blindly sorry.
Will resend on meta-arago.

> 
> Regards
> Devarsh
> 

Thanks,
Jai


