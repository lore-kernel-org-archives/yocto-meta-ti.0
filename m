Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50B26E0097C; Thu, 30 Mar 2017 04:44:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B584E00953
	for <meta-ti@yoctoproject.org>; Thu, 30 Mar 2017 04:44:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2UBiaJe026524
	for <meta-ti@yoctoproject.org>; Thu, 30 Mar 2017 06:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490874276;
	bh=9KmTqNcZefcZRZLVHNGHzAPYKFkFHpujqdwDhd1aQAM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rG3eWYcUJaYPu1tKNCV4RoBlewvnKT9FVicIMWxMJjcnZyzjLFJZa5ntgRQaFV/uF
	gPhlGS/qS3KcZCzVdaKFyvcydkYwo1nMRwr5qmgBXUZW/mGMYXe7RoD7V+e4jRcIfG
	jMTEM4bQoVfWpT34i21vBEOGSnDL93lLznDziyL4=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2UBiaBC031882
	for <meta-ti@yoctoproject.org>; Thu, 30 Mar 2017 06:44:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 06:44:35 -0500
Received: from [172.22.142.110] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2UBiZjv021891;
	Thu, 30 Mar 2017 06:44:35 -0500
Message-ID: <58DCEFB6.3000001@ti.com>
Date: Thu, 30 Mar 2017 06:44:54 -0500
From: Dan Murphy <dmurphy@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1490789015-3886-1-git-send-email-dmurphy@ti.com>
	<20170329141445.GB11364@edge>
In-Reply-To: <20170329141445.GB11364@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] k2hk-hs-evm: add new machine config
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
X-List-Received-Date: Thu, 30 Mar 2017 11:44:40 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

On 03/29/2017 09:14 AM, Denys Dmytriyenko wrote:
> On Wed, Mar 29, 2017 at 07:03:35AM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  conf/machine/k2hk-hs-evm.conf | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 conf/machine/k2hk-hs-evm.conf
>>
>> diff --git a/conf/machine/k2hk-hs-evm.conf b/conf/machine/k2hk-hs-evm.conf
>> new file mode 100644
>> index 0000000..e0b11eb
>> --- /dev/null
>> +++ b/conf/machine/k2hk-hs-evm.conf
>> @@ -0,0 +1,14 @@
>> +#@TYPE: Machine
>> +#@NAME: Keystone 2 K2HK HS EVM
>> +#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK HS EVM
>> +
>> +require conf/machine/k2hk-evm.conf
>> +
>> +UBOOT_MACHINE = "k2e_hs_evm_config"
> Dan,
>
> Is k2e used here on purpose because k2hk defconfig is not ready yet?

I was using that for testing I must have deleted the wrong line when I was cleaning up.

I will fix it

Dan

>
>> +UBOOT_ENTRYPOINT = "0x82000000"
>> +UBOOT_LOADADDRESS = "0x82000000"
>> +UBOOT_RD_LOADADDRESS = "0x84000000"
>> +UBOOT_RD_ENTRYPOINT = "0x84000000"
>> +
>> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2hk"
>> -- 
>> 2.7.3
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


-- 
------------------
Dan Murphy


