Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C6CC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 20:41:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3455.1682628106135245498
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 13:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NXbL+XlD;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RKfgml065006;
	Thu, 27 Apr 2023 15:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682628102;
	bh=6FNHux2V9W+hBcxZpi76edebPRYBR6QIj8uGhGv14GU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NXbL+XlDnkjSuaH0jpc6OjK+tVl8wC0ebr5H7xAkcRSxlo6M56zPjGUyOL1GosD0C
	 wcr8w9yeNuQ00FBhC+gLxLsMqMGTWzHYUAmqPpdD1JbGcR56C2E6rVN1YZTxyA/BxY
	 T175QB43c6Mo0OPYfikYGOISTwqos/n4YR0qqYno=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RKfgZx022190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 15:41:42 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 15:41:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 15:41:41 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RKfffA014668;
	Thu, 27 Apr 2023 15:41:41 -0500
Message-ID: <490b2423-f376-fa59-d2fb-9e1609a16fc1@ti.com>
Date: Thu, 27 Apr 2023 15:41:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [meta-ti][kirkstone][PATCH 3/4] cairo: resolve
 opengl version
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230426215538.3502212-1-rs@ti.com>
 <20230426215538.3502212-4-rs@ti.com> <20230427193039.GM9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230427193039.GM9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 20:41:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16444

On 4/27/23 14:30, Denys Dmytriyenko wrote:
> On Wed, Apr 26, 2023 at 04:55:37PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Cairo can either be built for use with OpenGL or OpenGLES. By default it
>> assumes it can use OpenGL if X11 is provided as a distro feature. This
>> assumption is not true anymore.
>>
>> Vulkan libraries need some X libs at runtime now, so we need to manually
>> override the PACKAGECONFIG for cairo to use OpenGLES.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 5 +++++
>>   1 file changed, 5 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> new file mode 100644
>> index 00000000..b41f1a01
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> @@ -0,0 +1,5 @@
>> +# This is required since cairo expects the opengl distro feature to refer to
>> +# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
>> +
>> +PACKAGECONFIG:remove = "opengl"
>> +PACKAGECONFIG:append = " glesv2"
> 
> NAK, this will fail Yocto Project compatibility checks, rendering meta-ti
> non-compliant!
> 
> No bbappends against upstream components should change the defaults
> unconditionally.
> 
> Usually, PACKAGECONFIG changes are Distro-specific:
> https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n117
> 
> If you absoluitely have to do it in a BSP layer, there are other ways
> to "guard" the change with layer-specific machine overrides, or other
> conditions.
> 

Fair enough. Will tweak cairo conditionally based on selected driver 
like we've done with Mesa. This should also leave us wiggle room for the 
open source driver when that comes around, thanks for reminding me! 
Expect v2.

