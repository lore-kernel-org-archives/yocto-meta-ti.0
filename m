Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.3044.1620087311229520399
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 May 2021 17:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=okceyAkg;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id F14BB38C0652
	for <meta-ti@yoctoproject.org>; Tue,  4 May 2021 00:15:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1440F6B4063549;
	Mon, 3 May 2021 19:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620087306;
	bh=vydPCDB4BIAdNxwynxXl4Gsm8vKHTCrcK2tbYvdBwC0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=okceyAkg3PmLQdjzlid/tCNSUFEGEZrYSOx2XnlDBByjUO1eJQH9sq/sTmqs9xpOQ
	 0sChIfNN0oHscEv9xJGeDbWP61k2U8vm15cMfVDeNuvGOe7o7mt5kz/9ckcj2zLlXB
	 hZvet6/XuU3b6u6CRldpURxTlNPTtx6rKJNgN+2g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1440F53u044296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 May 2021 19:15:06 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 3 May
 2021 19:15:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 3 May 2021 19:15:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1440F42V021945;
	Mon, 3 May 2021 19:15:05 -0500
Date: Mon, 3 May 2021 19:15:04 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, <yogeshs@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [dunfell PATCH] recipes-kernel: perf: Add a perf.bbappend to handle RDEPENDS on newer kernel
Message-ID: <20210504001504.mzn7sz3paklbe722@tactile>
References: <20210503224303.15093-1-nm@ti.com>
 <167BB00A0B06C8B2.32536@lists.yoctoproject.org>
 <20210503232641.GJ21867@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210503232641.GJ21867@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:26-20210503, Denys Dmytriyenko wrote:
[..]
> > > +RDEPENDS_${PN}-tests =+ "bash"
> 
> Come to think of it, you might want to guard this change to meta-ti platforms:
> 
> +RDEPENDS_${PN}-tests_ti-soc += "bash"

True.. yeah, will post a v2.
> 
> BTW, any specific reason to prepend (=+) instead of appending (+=)?

Nothing specific.. oe-core was using += So, followed the same, but in a
higher order layer like meta-ti - yeah i think append makes more sense.

Thanks.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
