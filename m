Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7988.1643122218841133333
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Jan 2022 06:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cgdj194S;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20PEoFo6054734;
	Tue, 25 Jan 2022 08:50:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643122215;
	bh=1to+IzZh3Hkj9Zh0l3Zi+s2wGy9h4NOt1l+gYCnLmD0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cgdj194Sm5m1VE0pE3TnrqZ4YPvYuaBwznQ+eQG4xsoyb0NY2hm9UHYa8uBzZ/MUZ
	 0iUNpa8bfqaCW+laxMgpD6GNxAZG53X8mBqDFIl0pl9NyLjhk2EFKFDIWsukFHwDU7
	 d7eeAyNLVxAlYT15isxSsNvrcsE8QxRzJ4CXwTCs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20PEoFoE084477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Jan 2022 08:50:15 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 25
 Jan 2022 08:50:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 25 Jan 2022 08:50:15 -0600
Received: from [10.249.38.90] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20PEoEID018234;
	Tue, 25 Jan 2022 08:50:14 -0600
Message-ID: <acd0c486-42da-1645-3600-333882e32c5a@ti.com>
Date: Tue, 25 Jan 2022 08:50:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-ti][dunfell][PATCH] machine: Add j721s2 evm configuration
To: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220124151413.3861-1-reatmon@ti.com>
 <20220124172421.GT26229@denix.org>
 <20220124234755.rzdk3tzgnmdgihjy@exuberant>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20220124234755.rzdk3tzgnmdgihjy@exuberant>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

This needs to be a series with linux, u-boot, firmware and k3-image-gen 
recipes updated with the platform support. Unless the support is already 
present.

On 1/24/2022 5:47 PM, Nishanth Menon wrote:
> On 12:24-20220124, Denys Dmytriyenko wrote:
>> On Mon, Jan 24, 2022 at 09:14:13AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> From: Nishanth Menon <nm@ti.com>
>>>
> 
> Needs a commit message please.
> 
>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>>   conf/machine/j721s2-evm-k3r5.conf      | 11 +++++++++++
>>>   conf/machine/j721s2-evm.conf           | 22 ++++++++++++++++++++++
>>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 23 +++++++++++++++++++++--
>>>   recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
>>>   4 files changed, 60 insertions(+), 2 deletions(-)
>>>   create mode 100644 conf/machine/j721s2-evm-k3r5.conf
>>>   create mode 100644 conf/machine/j721s2-evm.conf
>>>
>>> diff --git a/conf/machine/j721s2-evm-k3r5.conf b/conf/machine/j721s2-evm-k3r5.conf
>>> new file mode 100644
>>> index 00000000..508e96e5
>>> --- /dev/null
>>> +++ b/conf/machine/j721s2-evm-k3r5.conf
>>> @@ -0,0 +1,11 @@
>>> +#@TYPE: Machine
>>> +#@NAME: J721S2 EVM (R5F)
>>> +#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +
>>> +SYSFW_SOC = "j721s2"
>>> +SYSFW_CONFIG = "evm"
>>> +SYSFW_SUFFIX = "gp"
>>> +
>>> +UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
>>> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
>>> new file mode 100644
>>> index 00000000..82fd33da
>>> --- /dev/null
>>> +++ b/conf/machine/j721s2-evm.conf
>>> @@ -0,0 +1,22 @@
>>> +#@TYPE: Machine
>>> +#@NAME: J721S2 EVM
>>> +#@DESCRIPTION: Machine configuration for the TI J721S2 EVM
>>> +
>>> +require conf/machine/include/j7.inc
>>> +
>>> +SERIAL_CONSOLES = "115200;ttyS10"
> 
> 
> See https://lore.kernel.org/all/20211223121650.26868-3-vigneshr@ti.com/
> 
> The intent is to go with ttyS2 using aliases, however, will use
> main_usart8 (traditionally ttyS10).
> 
> 
>>> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>>
>>
>>> +TFA_K3_USART = "0x8"
>>> +OPTEE_K3_USART = "0x8"
>>
>> Are these new variables? Where are they coming from?
> 
> Correct, there are patches before this that needs to be included as well.
> 
> A single patch does'nt suffice the needs to j721s2.
> 
> https://gist.github.com/nmenon/5e0d1125bb71f1575123ec9869f8693c are
> probably the preceding  patches - they need to be reviewed to make sure
> this is the correct way to do things.
> 
