Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C59AC48285
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 15:12:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.17583.1706541169176997418
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 07:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U1/Y6XgN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40TFCgXl090419;
	Mon, 29 Jan 2024 09:12:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706541162;
	bh=9qB2B8lAZRsaO3FC6rbU7vqnXx4wnr00vTstQ1ttLn4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U1/Y6XgNWVGTUHblox/fkS0Pixp7aBRL45QgSg/cxWBYaajtENQrZhPWBTWVW92SB
	 Moxp2F8+RF4RpVcm17gDQWyGcTOLlArJXgneyPW7nfXnn7X09jhaRde0BVstU/mwq6
	 FsfUQdAeLdOEOzrH96kzKrD9cpJaVrdNI4oUM6Qo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40TFCgpe112651
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 09:12:42 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jan 2024 09:12:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Jan 2024 09:12:41 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40TFCf8K077207;
	Mon, 29 Jan 2024 09:12:41 -0600
Message-ID: <8bdf8678-19e2-44fb-b4bd-bb0f447ed729@ti.com>
Date: Mon, 29 Jan 2024 09:12:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH 0/4] Add gstreamer 1.20
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20240129115342.9321-1-sinthu.raja@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240129115342.9321-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 15:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17430

NAK

This patch series is for meta-arago, not meta-ti.  You prepared the 
patches for the wrong repo and sent them to the wrong location.

Please address this and the other comment about the typo in the commit 
message and resubmit them.


On 1/29/2024 5:53 AM, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Hi All,
> This patch series add supports to gstreamer 1.20 plugins-bad for AM57x
> platform and also it enables the mmip along with VPE and Ducati plugins.
> 
> RFC Patch: https://www.mail-archive.com/meta-arago@lists.yoctoproject.org/msg01680.html
> 
> Sinthu Raja (4):
>    gstreamer1.0-plugins-bad: Add patches to support DRM allocator
>    gst-plugins-ti: fetch gstreamer common project sources
>    ti-test: Remove OAMP-DRM test
>    branding-core: enable mmip for AM57x platform
> 
>   .../conf/distro/include/branding-core.inc     |   3 -
>   .../conf/distro/include/branding-ltsprep.inc  |   3 -
>   .../gstreamer1.0-plugins-ducati_git.bb        |   4 +
>   .../gstreamer1.0-plugins-vpe_git.bb           |   4 +
>   ...mallocator-Add-DRM-allocator-support.patch | 367 ++++++++++++++++++
>   ...drm-and-tidss-in-the-list-of-drivers.patch | 160 ++++++++
>   .../gstreamer1.0-plugins-bad_1.20.%.bbappend  |  15 +
>   .../recipes-core/packagegroups/ti-test.bb     |   3 -
>   8 files changed, 550 insertions(+), 9 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

