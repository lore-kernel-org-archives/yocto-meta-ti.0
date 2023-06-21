Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDE9EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 18:23:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6054.1687371821841758912
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 11:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E8okJ/uv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LINe9q041524
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 13:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687371820;
	bh=x66NWdKvQRRwuszja1CgGJVrF2TLDCNtFtompbjaIOA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=E8okJ/uvq+Rz8R62fcy4MdniltDWacs7JlDoN3wfcLbULfPooVJ5I2pmlHvMvldM4
	 3gNN8fcgN9xs7qXT1Y26dqCqGhD2Wo5ofTgqGf7xl5qC1ncWjoGUlXRrPHpc+zD1hR
	 lDUc8oXN63f3s9X4AZ6dMCqgDFqi9rlzw8huFLow=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LINenj054046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 13:23:40 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 13:23:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 13:23:40 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LINe0V098039
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 13:23:40 -0500
Message-ID: <53c849e0-bc31-16af-88f8-6eca03a2bb00@ti.com>
Date: Wed, 21 Jun 2023 13:23:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] [meta-ti] [kirkstone+][PATCH] ti-img-rogue-umlibs:
 Make x11 dependency optional
To: <meta-ti@lists.yoctoproject.org>
References: <20230621075811.1998481-1-d.schultz@phytec.de>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230621075811.1998481-1-d.schultz@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 18:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16763

On 6/21/23 02:58, Daniel Schultz wrote:
> libx11-xcb has a hard dependency for x11 but is included by the
> libvk-rogue package. Only include libvk-rogue when the
> DISTRO_FEATURES "vulkan x11 wayland" are enabled, which is identical
> to the RRECOMMENDS variable.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---

Hold on, let me get you a proper fix now that I'm packaging components 
separately.

