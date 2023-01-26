Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E66C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 19:38:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.83838.1674761909888352432
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 11:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rMxXmPy3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QJcTwE127557
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 13:38:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674761909;
	bh=j6Sx/vGibxwiI+7paEveiBMOPN3Q1pq1yrGo/PZm/qQ=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=rMxXmPy3yxM6SaU74hb0m43oquV/FeVI3iwwKkq3Zq0rfYmnZoNWZ6Upq07HbUeiQ
	 equIdOJxGIBOGSqoeOmUMdH0+6hUrgUP0rYVnMoz/morM9HbzPXvpjbkQXyGL0/vu/
	 bLshtgVRXJ501GmT3oXZ/lmwjP9rCtn9OMmGaam4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QJcThh024125
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 13:38:29 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 13:38:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 13:38:28 -0600
Received: from [10.249.33.70] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QJcQaB018729;
	Thu, 26 Jan 2023 13:38:27 -0600
Date: Thu, 26 Jan 2023 13:38:20 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [kirkstone PATCH 2/4] meta-ti-bsp: graphics: Resolve dependency
 chain
To: Andrew Davis <afd@ti.com>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <WJY3PR.TPQTGC21E7EJ2@ti.com>
In-Reply-To: <d9a4cb78-2d78-1d33-d8d9-7ffeb2c8811f@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
	<20230126030834.3889448-3-rs@ti.com>
	<d9a4cb78-2d78-1d33-d8d9-7ffeb2c8811f@ti.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GtTE2jQ+W98T1nx6Bijm"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 19:38:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15681

--=-GtTE2jQ+W98T1nx6Bijm
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Thu, Jan 26 2023 at 11:54:18 -06:00:00, Andrew Davis <afd@ti.com> 
wrote:
>> -# The actual SONAME is libGLESv2.so.2, so need to explicitly 
>> specify RPROVIDES for .so.1 here
>> -RPROVIDES:${PN} += "libGLESv2.so.1"
>> +RDEPENDS:${PN} += "libdrm libdrm-omap"
> 
> These are not runtime dependencies, libdrm is still regular built 
> time DEPENDS.
> (libdrm-omap can be dropped, we don't need that at all anymore)
> 
> Runtime we do need udev so this should all be now:
> 
> DEPENDS += "libdrm"
> DEPENDS:append:libc-musl = " gcompat"
> RDEPENDS:${PN} += "udev"

There should be no build dependencies for a binary package. What new 
dependency did you engineer?


--=-GtTE2jQ+W98T1nx6Bijm
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Thu, Jan 26 2023 at 11:54:18 -06:00:00, Andrew Davis &lt;afd@ti.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"><blockquote>-# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
-RPROVIDES:${PN} += "libGLESv2.so.1"
+RDEPENDS:${PN} += "libdrm libdrm-omap"
</blockquote>
These are not runtime dependencies, libdrm is still regular built time DEPENDS.
(libdrm-omap can be dropped, we don't need that at all anymore)

Runtime we do need udev so this should all be now:

DEPENDS += "libdrm"
DEPENDS:append:libc-musl = " gcompat"
RDEPENDS:${PN} += "udev"
</div></blockquote><div><br></div><div>There should be no build dependencies for a binary package. What new dependency did you engineer?</div></div>
--=-GtTE2jQ+W98T1nx6Bijm--

