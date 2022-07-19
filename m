Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CADC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 13:22:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.40545.1658236931587842801
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 06:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cTXAwCqQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26JDM2JK120961;
	Tue, 19 Jul 2022 08:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658236922;
	bh=JXxbcTbRJzO7H8cXrgbgW9WWPrCNxT9PeGaGvxCMrR4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cTXAwCqQ1ORvwYr1JP6V9GnF2uM7abEzzHSRwe3uJq28v7xTyDXkvKLpSU18zOLPl
	 noL6VVJp2aOIA0U+HRAdX07xfFucwYgDui1R+NUiWv7EfTXK2Y4yItRtTSl582KCMI
	 XOofKXKUllF+j6EXo+fyM6ghK7La1mUM5PSvjfAo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26JDM2q4073941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Jul 2022 08:22:02 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 08:22:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 08:22:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26JDM1Bl076702;
	Tue, 19 Jul 2022 08:22:01 -0500
Date: Tue, 19 Jul 2022 08:22:01 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Drew Fustini <dfustini@baylibre.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [PATCH dunfell 0/3] fix ARAGO_BRAND=mainline builds
Message-ID: <20220719132201.2r73plviktkkxnkf@wrecker>
References: <20220704030607.2292135-1-dfustini@baylibre.com>
 <20220719031841.GY18692@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220719031841.GY18692@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Jul 2022 13:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14880

On 23:18-20220718, Denys Dmytriyenko wrote:
> I was thinking that instead of keying off of ARAGO_BRAND=mainline, which 
> is very specific to Arago distro, long term we should instead key off of 
> PREFERRED_PROVIDER_virtual/kernel=linux-ti-mainline, that is specific to 
> meta-ti... Thoughts?


We'd want mainline kernel, u-boot, tf-a, optee ..... as many upstream
components as possible. is there a way to create a virtual package group
that points to all upstream base components?

I am looking for ways we can enable this beyond just arago brand.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

