Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.314.1616432055848316167
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 09:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wiqu4Kuy;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: l-weaver@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12MGsBrR066251;
	Mon, 22 Mar 2021 11:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616432051;
	bh=OMaytfIWpJ74/c2cUZdYY5PZ9BtkpwtX6OOFP/bfkZ8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=wiqu4Kuy3NLXyXG3lU64taT1yhyrgKnfeH2OM0dlMn6G19eDs6pDJ6b3c8vTCFnY+
	 NTQO6WDuhoRL4gnQDPCDO7n59cJaF+Ah9XcAwljuKrny82shhsV3JZY4Zh6ScNxAWD
	 aXEEXrTuLCrrtcmesB1COATN67kqzpBZ2zcIAtdU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12MGsBNP051622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Mar 2021 11:54:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 22
 Mar 2021 11:54:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 22 Mar 2021 11:54:10 -0500
Received: from [10.250.66.67] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12MGsAXt102097;
	Mon, 22 Mar 2021 11:54:10 -0500
Subject: Re: [EXTERNAL] Re: [meta-ti][dunfell/master][PATCH v2] ti-sci-fw: Update J7200 deploy to install ti-sci-fw
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <nikhil.nd@ti.com>, <praneeth@ti.com>
References: <20210322160706.3304-1-l-weaver@ti.com>
 <20210322162131.GH18041@denix.org>
From: l-weaver@ti.com
Message-ID: <59ed911f-a1ab-0f13-c6f1-c17b0458b729@ti.com>
Date: Mon, 22 Mar 2021 11:54:10 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210322162131.GH18041@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/22/2021 11:21 AM, Denys Dmytriyenko wrote:
> On Mon, Mar 22, 2021 at 09:37:06PM +0530, l-weaver via lists.yoctoproject.org wrote:
>> From: Lucas Weaver <l-weaver@ti.com>
>>
>> The J7200 ti-sci-fw needs to be installed in the deploy
>> directory so that it can be packaged in Processor SDK bundle
>>
>> This is required because the ti-sci-fw is needed in the
>> installer prebuilt-images in order to build the combined boot
>> image for J7200
>>
>> Signed-off-by: Lucas Weaver <l-weaver@ti.com>
>> ---
>>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index e7580a57..25fac359 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -99,6 +99,7 @@ do_deploy_j7200-evm-k3r5() {
>>   	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>>   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
>>   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
>> +	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> 
> This is already done for all platforms:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb#n87
> 
> do_deploy () {
> 	...
> 
> 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> }
> 
> 
 From my understanding, I thought that the do_deploy_j7200-evm-k3r5 
shown below will overwrite the do_deploy task for the j7200-evm-k3r5 
platform.  This was seemingly confirmed when I tried to bundle the 
ti-sci-fw for J7200 in the Processor SDK bundle but this file was not 
found.  After adding the change from this patch, the bundle step 
succeeded.  Could you please clarify my understanding?

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb#n97 


do_deploy_j7200-evm-k3r5() {
	install -d ${DEPLOYDIR}
	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} 
${DEPLOYDIR}/${UBOOT_IMAGE}
	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
}
>>   }
>>   
>>   do_install_am64xx-evm-k3r5() {
>> -- 
>> 2.17.1
>>
