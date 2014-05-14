Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F001FE00724; Wed, 14 May 2014 12:02:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AD90E0053B
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 12:02:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4EJ2ick030935
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 14:02:44 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EJ2i6b012000
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 14:02:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 May 2014 14:02:44 -0500
Received: from [158.218.103.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EJ2iVx029450;
	Wed, 14 May 2014 14:02:44 -0500
Message-ID: <5373BDD5.3060809@ti.com>
Date: Wed, 14 May 2014 15:02:45 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1400009529-12246-1-git-send-email-hzhang@ti.com>
	<20140514184257.GP18053@edge>
In-Reply-To: <20140514184257.GP18053@edge>
X-Enigmail-Version: 1.6
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone: u-boot: change UBOOT_MACHINE name to "k2hk_evm_config"
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
X-List-Received-Date: Wed, 14 May 2014 19:02:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/14/2014 2:42 PM, Denys Dmytriyenko wrote:
> On Tue, May 13, 2014 at 03:32:09PM -0400, hzhang@ti.com wrote:
>> From: Hao Zhang <hzhang@ti.com>
>>
>> Signed-off-by: Hao Zhang <hzhang@ti.com>
>> ---
>>  conf/machine/include/keystone.inc |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
>> index b961ad3..63f069c 100644
>> --- a/conf/machine/include/keystone.inc
>> +++ b/conf/machine/include/keystone.inc
>> @@ -12,7 +12,7 @@ MACHINE_KERNEL_PR = "r7"
>>  
>>  KERNEL_IMAGETYPE = "uImage"
>>  
>> -UBOOT_MACHINE = "tci6638_evm_config"
>> +UBOOT_MACHINE = "k2hk_evm_config"
> 
> What's the difference? Which one do you use for MCSDK builds? Are all the 
> versions and variants covered by that config?
> 
> 

k2hk is a generic device name for both CI and mass market product
(tcixxxx is a CI part number), and should be used.

I will submit a 2nd patch to add k2l_evm_config and k2e_evm_config for
k2l and k2e devices. Is there any example code to support U-boot build
on multiple devices with the same Keystone machine?

>>  UBOOT_ENTRYPOINT = "0x80008000"
>>  UBOOT_LOADADDRESS = "0x80008000"
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


