Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9630C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 05:27:27 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.45075.1739770046911256086
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 16 Feb 2025 21:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=COrz6hDH;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-dutta@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51H5RMXs1288640
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 16 Feb 2025 23:27:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739770042;
	bh=vQE61oR2zbWZTezktNV8oHQlIclNEMNyBSY47+6Jii8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=COrz6hDHk/snKDbYMeliCG4stUaUn6RRGTtzaCTyDOZcGwWBSG/UXeydI8O+J8pdX
	 u4UoqSkIl0T6lDTvmXtkaixKMI0HSS9O9OlnxYzZx8IdnfHg4DEWHb9J53EzZA7K6r
	 QVDWDdFiU1Ybwunm4gUgb2vABbJyLIyjMTeEjdhs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H5RMbL043024;
	Sun, 16 Feb 2025 23:27:22 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 16
 Feb 2025 23:27:21 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 16 Feb 2025 23:27:22 -0600
Received: from [172.24.24.19] (ltpw0bk3wf.dhcp.ti.com [172.24.24.19])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51H5RJhH047250;
	Sun, 16 Feb 2025 23:27:19 -0600
Message-ID: <bed17678-2deb-4c9e-9862-8adf94f581dc@ti.com>
Date: Mon, 17 Feb 2025 10:57:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: j722s: Change overlay
 in KERNEL_DEVICETREE_PREFIX
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>,
        <a-limaye@ti.com>
References: <20250211055530.16704-1-a-dutta@ti.com>
 <20250211202744.GT21608@denix.org>
Content-Language: en-US
From: "Dutta, Anurag" <a-dutta@ti.com>
In-Reply-To: <20250211202744.GT21608@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2025 05:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18323


On 12-02-2025 01:57, Denys Dmytriyenko wrote:
> Is it really scarthgap-specific?
Yes, this patch is scarthgap-specific because overlays are not upstreamed.
>
> On Tue, Feb 11, 2025 at 11:25:30AM +0530, Anurag Dutta via lists.yoctoproject.org wrote:
>> Currently, the overlay mentioned in KERNEL_DEVICETREE_PREFIX in case
>> of j722s is "k3-j7200-evm-mcspi-loopback" which is incorrect. Change
>> the overlay to "k3-am625-sk-mcspi-loopback.dtso" in order to carry
>> out SPI loopback tests successfully.
>>
>> Fixes: 13b691a9bc2d ("conf: machine: j722s: Add overlay to
>> KERNEL_DEVICETREE_PREFIX")
>>
>> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
>> ---
>>
>> Test link: https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948
>>
>>   meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
>> index 8f42866c..52a6cfbd 100644
>> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
>> @@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
>>   KERNEL_DEVICETREE_PREFIX = " \
>>       ti/k3-j722s \
>>       ti/k3-fpdlink \
>> -    ti/k3-j7200-evm-mcspi-loopback \
>> +    ti/k3-am625-sk-mcspi-loopback \
>>       ti/k3-v3link \
>>   "
>>   
>> -- 
>> 2.34.1

