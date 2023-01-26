Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29EAC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 20:12:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.84895.1674763955204089284
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 12:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FsOySrQ0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QKCYoe113782
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 14:12:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674763954;
	bh=LvshhczaVlPk8ENWmffasAjeLzukzHtlgdH3H4WW8j4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FsOySrQ0tW2uBSeHjiqi3bap6idA1cOe/UJDZcEVUzLQrYuSzLwtID1A/X4ij63iC
	 wbOayDCvusgMccxWDeys1i3dFMLnB2IVNwj4D5TRAsq8N2P3T9FpOGWIWnS06qr6o6
	 H52E9hAiakukd0+1WlJ9Mtczgco2yLmMpU+HYAMM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QKCYdC012270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 14:12:34 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 14:12:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 14:12:34 -0600
Received: from [10.250.32.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QKCXZu096268;
	Thu, 26 Jan 2023 14:12:33 -0600
Message-ID: <17b223ed-820b-5391-eead-4c533a421c08@ti.com>
Date: Thu, 26 Jan 2023 14:12:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [kirkstone PATCH 2/4] meta-ti-bsp: graphics: Resolve dependency
 chain
Content-Language: en-US
To: "Sapp, Randolph" <rs@ti.com>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
 <20230126030834.3889448-3-rs@ti.com>
 <d9a4cb78-2d78-1d33-d8d9-7ffeb2c8811f@ti.com> <WJY3PR.TPQTGC21E7EJ2@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <WJY3PR.TPQTGC21E7EJ2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 20:12:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15682

On 1/26/23 1:38 PM, Sapp, Randolph wrote:
> On Thu, Jan 26 2023 at 11:54:18 -06:00:00, Andrew Davis <afd@ti.com> wrote:
>>
>>     -# The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here -RPROVIDES:${PN} += "libGLESv2.so.1" +RDEPENDS:${PN} += "libdrm libdrm-omap" 
>>
>> These are not runtime dependencies, libdrm is still regular built time DEPENDS. (libdrm-omap can be dropped, we don't need that at all anymore) Runtime we do need udev so this should all be now: DEPENDS += "libdrm" DEPENDS:append:libc-musl = " gcompat" RDEPENDS:${PN} += "udev" 
> 
> There should be no build dependencies for a binary package. What new dependency did you engineer?

If the binaries depend on a lib then yocto will detect that and set it as a runtime dependency
for you. If not in the sysroot dir when we install the binaries then yocto will do
the opposite and complain that it cannot find some libraries that binaries in the package
link against. We solve both by using DEPENDS here.

Andrew

