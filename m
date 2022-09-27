Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E19CC6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:53:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.14116.1664301215687281554
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 10:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EXrYBNpd;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28RHrU7b037032;
	Tue, 27 Sep 2022 12:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664301210;
	bh=nttGmrib5vCWwb1+IMXY5EW4FZXa4Rqoi7DLs+5XrUw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=EXrYBNpd9YO2BHgYdfzSQ0HeHpGd697xpZlM8NbBRUtxPXwVwbJS/MfhSfB310Yvo
	 SuKEiUPBZdbgioeJqTsS23ZE07HWznP1HkUIif2WgEf/+Nyw3+KtXbodticNEahI73
	 XhKsA9dxVEmWt3nCRDJ8kXguk4sVvcAKbDNWeS+A=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28RHrUCk003666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Sep 2022 12:53:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 27
 Sep 2022 12:53:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 27 Sep 2022 12:53:30 -0500
Received: from [10.250.33.43] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28RHrUwR100313;
	Tue, 27 Sep 2022 12:53:30 -0500
Message-ID: <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
Date: Tue, 27 Sep 2022 12:53:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
Content-Language: en-US
To: Paul Barker <paul.barker@sancloud.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Sep 2022 17:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15100

On 9/27/22 12:01 PM, Paul Barker wrote:
> Hi folks,
> 
> I'm trying to add support for the Yocto Project kirkstone release to our
> meta-sancloud BSP layer and I'm facing a build issue. I've reproduced the
> issue using just the meta-ti layer and its dependencies, targeting the
> beaglebone machine. I've used the kirkstone-next branch of meta-ti as
> the kirkstone branch has not been updated in 5 months and has the same
> issue.
> 
> The build fails due to a lack of buildable providers for virtual/libgl.
> Is this a known issue?
> 


I've run into this before, Cairo package pulls in desktop OpenGL when
GLES2 would be more appropriate. I'll look for the exact fix but
you can try putting this in your distro .conf file:

PACKAGECONFIG_remove_pn-cairo = "opengl"
PACKAGECONFIG_append_pn-cairo = " egl"
PACKAGECONFIG_append_pn-cairo = " glesv2"

Andrew


> The commits of each layer used are as follows:
> 
> poky: d64bef1c7d713b92a51228e5ade945835e5a94a4 (kirkstone)
> meta-arm: 0a5eba13d81f5c5722a13b816193ebf93c0fd198 (kirkstone)
> meta-ti: b742ced380b23d5c57b4280bc3c10165176ec072 (kirkstone-next)
> 
> With these layers checked out, the console session is as follows:
> 
> $ . poky/oe-init-build-env
> <output snipped>
> $ bitbake-layers add-layer ../meta-arm/meta-arm ../meta-arm/meta-arm-toolchain ../meta-ti/meta-ti-bsp
> NOTE: Starting bitbake server...
> $ MACHINE=beaglebone bitbake core-image-base
> Loading cache: 100% |#| Time: 0:00:00
> Loaded 1770 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'virtual/libgl' (but /workdir/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb DEPENDS on or otherwise requires it)
> mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to ti-sgx-ddk-um, not mesa
> mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa, not mesa-gl
> NOTE: Runtime target 'python3-pygobject' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pygobject', 'cairo', 'virtual/libgl']
> NOTE: Runtime target 'ofono' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['ofono', 'bluez5', 'python3-pygobject', 'cairo', 'virtual/libgl']
> NOTE: Runtime target 'packagegroup-base-extended' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-base-extended', 'ofono', 'bluez5', 'python3-pygobject', 'cairo', 'virtual/libgl']
> ERROR: Required build target 'core-image-base' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-base', 'packagegroup-base-extended', 'ofono', 'bluez5', 'python3-pygobject', 'cairo', 'virtual/libgl']
> 
> Thanks,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15099): https://lists.yoctoproject.org/g/meta-ti/message/15099
> Mute This Topic: https://lists.yoctoproject.org/mt/93954566/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

