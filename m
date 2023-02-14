Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C06C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 23:38:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3308.1676417905612335174
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 15:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=y8tAcc+H;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31ENcK7f080439;
	Tue, 14 Feb 2023 17:38:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676417900;
	bh=6A/4yCRc+LOtkBWytKi8HbbjxJpmDOGCkPfH6WqJAJk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y8tAcc+HwD18f0EpUFr5EYwMyunDHORIG+9d2cVVG5X4aC288nYuAmsCZ2sddhEbi
	 brH4U1/SRiCXjyajs5QDrralOkWIukXLw6Fnt2CWzxkiKBO6ROBXukp2hgEM1dKRR9
	 NGtDG2HHYA8rbwcyL/bfWLnfnwbKra9US/XFhMPY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31ENcKHB125192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 17:38:20 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 17:38:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 17:38:20 -0600
Received: from [10.250.33.40] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31ENcJLK010229;
	Tue, 14 Feb 2023 17:38:20 -0600
Message-ID: <d8ec0235-89dd-0f65-d65f-fa69aa61ccd6@ti.com>
Date: Tue, 14 Feb 2023 17:38:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/4] conf: machine: Add proper
 SOC_FAMILY for R5 builds
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230214145352.12093-1-afd@ti.com>
 <20230214145352.12093-2-afd@ti.com> <20230214184810.GJ22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230214184810.GJ22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 23:38:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15845

On 2/14/23 12:48 PM, Denys Dmytriyenko wrote:
> NAK, you should not mix overrides for different archs.
> 

Why? This seems to work just fine, and the SOC_FAMILY is am64xx no matter
the core the code runs on, seems like an odd rule not to have that.

> I also have this cleanup for R5 machine overrides pending, but using unique
> names rather than the same ones with the main cores. I'll try to submit that
> one shortly...
> 
> 
> On Tue, Feb 14, 2023 at 08:53:50AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Having our SOC_FAMILY set to our SoC name can be useful in recipes
>> that need SoC specific configuration. Add SoC names.
>>
>> Setting the revision and security type is less useful here and not
>> used. Remove that while here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf           | 1 +
>>   meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf        | 1 +
>>   meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf        | 2 +-
>>   meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf | 2 +-
>>   meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf | 2 +-
>>   meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf       | 1 -
>>   meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf           | 1 +
>>   meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf    | 1 -
>>   meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf        | 1 +
>>   meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf      | 1 +
>>   meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf            | 1 +
>>   meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf         | 1 +
>>   meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf            | 1 +
>>   meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf         | 1 +
>>   meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf           | 1 +
>>   meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf        | 1 +
>>   meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf           | 1 +
>>   17 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>> index 724a8d4a..2fb43256 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":am62xx"
>>   
>>   SYSFW_SOC = "am62x"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>> index ca4ced5a..14246300 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":am62xx"
>>   
>>   SYSFW_SOC = "am62x"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
>> index 50bf6a07..e6a1a9d7 100644
>> --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
>> +++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
>> @@ -5,7 +5,7 @@
>>   # Booting GP requires different SYSFW, the rest is handled at runtime
>>   
>>   require conf/machine/include/k3r5.inc
>> -SOC_FAMILY:append = ":k3r5-gp"
>> +SOC_FAMILY:append = ":am64xx"
>>   
>>   SYSFW_SOC = "am64x"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>> index 42ddbb4c..29d000ef 100644
>> --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>> +++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>> @@ -5,7 +5,7 @@
>>   # Booting SR2.0 HS-FS requires different SYSFW, the rest is handled at runtime
>>   
>>   require conf/machine/include/k3r5.inc
>> -SOC_FAMILY:append = ":k3r5-sr2-hs-fs"
>> +SOC_FAMILY:append = ":am64xx"
>>   
>>   SYSFW_SOC = "am64x_sr2"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>> index a1c2b3e6..37457f00 100644
>> --- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>> +++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>> @@ -5,7 +5,7 @@
>>   # Booting SR2.0 HS-SE requires different SYSFW, the rest is handled at runtime
>>   
>>   require conf/machine/include/k3r5.inc
>> -SOC_FAMILY:append = ":k3r5-sr2-hs-se"
>> +SOC_FAMILY:append = ":am64xx"
>>   
>>   SYSFW_SOC = "am64x_sr2"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
>> index e74dd3ab..09625c51 100644
>> --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
>> +++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
>> @@ -5,7 +5,6 @@
>>   # Booting SR2 requires different SYSFW, the rest is handled at runtime
>>   
>>   require conf/machine/am65xx-evm-k3r5.conf
>> -SOC_FAMILY:append = ":k3r5-sr2"
>>   
>>   SYSFW_SOC = "am65x_sr2"
>>   SYSFW_SYMLINK = "sysfw.itb"
>> diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
>> index a484e444..f8afad9b 100644
>> --- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI AM65xx EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":am65xx"
>>   
>>   SYSFW_SOC = "am65x"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
>> index ff1645e4..90ad313b 100644
>> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
>> +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
>> @@ -5,7 +5,6 @@
>>   # Booting SR2 requires different SYSFW, the rest is handled at runtime
>>   
>>   require conf/machine/am65xx-hs-evm-k3r5.conf
>> -SOC_FAMILY:append = ":k3r5-sr2"
>>   
>>   SYSFW_SOC = "am65x_sr2"
>>   SYSFW_SYMLINK = "sysfw.itb"
>> diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>> index d9041c9d..49983ba9 100644
>> --- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":am65xx"
>>   
>>   SYSFW_SOC = "am65x"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> index 21b8702b..d0694122 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j721e"
>>   
>>   PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
>>   PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
>> diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
>> index 68061883..4cd6accf 100644
>> --- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J7200 EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j7200"
>>   
>>   SYSFW_SOC = "j7200"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>> index 3fe06e74..c3584193 100644
>> --- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J7200 HS EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j7200"
>>   
>>   SYSFW_SOC = "j7200_sr2"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
>> index 9544cdb6..678b79b1 100644
>> --- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j721e"
>>   
>>   SYSFW_SOC = "j721e"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>> index 56312c0c..d7f0cfcc 100644
>> --- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j721e"
>>   
>>   SYSFW_SOC = "j721e_sr1_1"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
>> index 508e96e5..7fb6ef28 100644
>> --- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j721s2"
>>   
>>   SYSFW_SOC = "j721s2"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>> index a4d51904..fa1284c3 100644
>> --- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j721s2"
>>   
>>   SYSFW_SOC = "j721s2"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
>> index 04feebc6..37dad149 100644
>> --- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI J784S4 EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +SOC_FAMILY:append = ":j784s4"
>>   
>>   SYSFW_SOC = "j784s4"
>>   SYSFW_CONFIG = "evm"
>> -- 
>> 2.39.1

