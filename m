Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17746C636D6
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 13:29:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.14628.1675949388192563637
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 05:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pn+iLB0n;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 319DTkE4128784;
	Thu, 9 Feb 2023 07:29:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675949386;
	bh=jvku5qjHOcUN8ymENqeV5zCI4ykzO4omMkWpkJNXXAw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Pn+iLB0nYdIkgkr0XrmnYIeBf12XnP9NmUTft9Z6mzurs9pnqIdP2eE3g+Y/590WX
	 ZczFWKhzyhpwcRTB/tsYeguCz2QifCPPBE4G2NktiLCEIoYdEuoq7W2cZeguvIhet0
	 Iu4re3/hL1hteP0C4dvfNAT19lZBFKeIoKE2cKGk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 319DTkdG003490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Feb 2023 07:29:46 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Feb 2023 07:29:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Feb 2023 07:29:46 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 319DTkla105401;
	Thu, 9 Feb 2023 07:29:46 -0600
Message-ID: <4b7c58a4-6d44-5df9-1567-7f2e1061643c@ti.com>
Date: Thu, 9 Feb 2023 07:29:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master/kirkstone][PATCH 6/8] ti-rtos-firmware: Use a
 table instead of a list of copy commands
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230207234239.30720-1-afd@ti.com>
 <20230207234239.30720-6-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230207234239.30720-6-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Feb 2023 13:29:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15769



On 2/7/2023 17:42, Andrew Davis wrote:
> Using a table makes it easier to see what firmware is included with
> each machine build. It also helps prevent errors here.

I like the table.  It makes it clearer to see what is available on which 
platform.  Nice change.

> Since the same functions run across machines we now sign all the firmware
> without needing to add a new signing function for each new machine.
> 
> Another fix is that we install the DM firmware to the deploy directory
> for all machines that use need it. This was added for J7x machines
> but missed for AM62x.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

*snip*

> +
> +ETH_FW_LIST = ""
> +ETH_FW_LIST:am65xx = ""
> +ETH_FW_LIST:j721e =  "${ETH_FW}"
> +ETH_FW_LIST:j7200 =  "${ETH_FW}"
> +ETH_FW_LIST:j721s2 = "${ETH_FW}"

j721s2 does not have the ETH_FW, so this line is incorrect.  The lines 
that likely made you think it did are commented out in the current 
version of the file.


> +ETH_FW_LIST:am64xx = ""
> +ETH_FW_LIST:am62xx = ""
> +ETH_FW_LIST:j784s4 = "${ETH_FW}"
>   


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

