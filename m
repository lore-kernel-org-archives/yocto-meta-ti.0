Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98232E00B1B; Mon, 19 Aug 2019 10:58:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F60AE00A75
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 10:58:34 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JHwXvL040611
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 12:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1566237513;
	bh=Vp251SHeSkonCwCOIgcpIlxFRm/b9MBFD4HYJeqXpZE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=A4FyS4Cd8Uph7289vkIwNPmDLf8FYGUyMFTo8FH896w96gO8bxtaUvoBpy74MC9X5
	v9B4QBu/GBa22SvCY97lqfGsHzjdYvF5vIWMtnWkDk5PFAz2RHizcNZ6+XhDOmdX8i
	G6rB9QyiYjGE3FGpmufwzhP4BKYUjpbZOhWOtkDE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JHwXZr127851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2019 12:58:33 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 19 Aug 2019 12:58:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 19 Aug 2019 12:58:33 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JHwWMs110313;
	Mon, 19 Aug 2019 12:58:33 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1566219494-16248-1-git-send-email-j-stiffler@ti.com>
	<20190819174803.GJ2365@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d0ec7e07-9949-c882-9c2b-dc3f05eec716@ti.com>
Date: Mon, 19 Aug 2019 13:58:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819174803.GJ2365@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, lokeshvutla@ti.com
Subject: Re: [master/thud][PATCH] jailhouse: update to ti2019.03-rc2
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Aug 2019 17:58:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/19/2019 1:48 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 19, 2019 at 08:58:14AM -0400, Jacob Stiffler wrote:
>> * extend to am65xx family
>> * and correct am65xx cell and inmate filenames.
>> * remove earlycon bootargs for am65xx
> IIRC, earlycon was causing some issues and was supposed to be removed by an
> owner... As well as updating commit and fixing DTBs and cells...


I was not aware. I've been tasked with the OOB experience, so 
integration seemed like a logical first step. :)

I am also looking into packaging the tools and python modules so that 
users can play around with this and change the kernel image and bootargs 
on the target.


>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   recipes-kernel/jailhouse/jailhouse_git.bb | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
>> index 5e2c71b..e1d5263 100644
>> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
>> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>>   "
>>   
>>   PV = "0.10+git${SRCPV}"
>> -SRCREV = "e71fd2dc7e8494a44cc3c762a24824532a412807"
>> +SRCREV = "96329f098e655cd42d7d0dbb3cd2cc7c3492d633"
>>   BRANCH = "ti-jailhouse-0.10"
>>   
>>   SRC_URI = " \
>> @@ -47,19 +47,20 @@ JH_CELL_FILES ?= "*.cell"
>>   JH_CELL_FILES_k3 ?= "k3-*.cell"
>>   
>>   JH_INMATE_DTB ?= ""
>> -JH_INMATE_DTB_am65xx-evm ?= "inmate-k3-am654.dtb"
>> +JH_INMATE_DTB_am65xx ?= "inmate-k3-am654-idk.dtb"
>>   JH_INMATE_DTB_j7-evm ?= "inmate-k3-j721e-evm.dtb"
>>   
>>   JH_LINUX_DEMO_CELL ?= ""
>> -JH_LINUX_DEMO_CELL_am65xx-evm ?= "k3-am654-linux-demo.cell"
>> +JH_LINUX_DEMO_CELL_am65xx ?= "k3-am654-idk-linux-demo.cell"
>>   JH_LINUX_DEMO_CELL_j7-evm ?= "k3-j721e-evm-linux-demo.cell"
>>   
>>   JH_SYSCONFIG_CELL ?= ""
>> -JH_SYSCONFIG_CELL_am65xx-evm ?= "k3-am654.cell"
>> +JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
>>   JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
>>   
>>   JH_CMDLINE ?= ""
>> -JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait earlycon=ns16550a,mmio32,0x2810000"
>> +JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
>> +JH_CMDLINE_j7-evm ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait earlycon=ns16550a,mmio32,0x2810000"
>>   
>>   do_configure() {
>>   	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

