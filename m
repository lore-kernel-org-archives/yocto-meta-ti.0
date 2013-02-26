Return-Path: <hzhang@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 73CADE0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:15:13 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QKFCrR023135
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:15:12 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKFCmr022901
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:15:12 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 14:15:12 -0600
Received: from [158.218.103.43] (gtla0868496.am.dhcp.ti.com [158.218.103.43])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKFBta008905;
	Tue, 26 Feb 2013 14:15:12 -0600
Message-ID: <512D17CE.1010105@ti.com>
Date: Tue, 26 Feb 2013 15:15:10 -0500
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1361908130-27683-1-git-send-email-hzhang@ti.com>
	<20130226200607.GN6725@denix.org>
In-Reply-To: <20130226200607.GN6725@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] keystone-evm config: add ubifs support
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
X-List-Received-Date: Tue, 26 Feb 2013 20:15:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/2013 3:06 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 26, 2013 at 02:48:50PM -0500, hzhang@ti.com wrote:
>> From: Hao Zhang<hzhang@ti.com>
>
> I assume you double-checked the actual UBI ARGS values below for the Keystone.
> Other than that looks fine to me - I'll push it shortly.
>

Yes, I did, thanks.

>> ---
>>   conf/machine/keystone-evm.conf |   19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
>> index e73d84b..3e44ddc 100644
>> --- a/conf/machine/keystone-evm.conf
>> +++ b/conf/machine/keystone-evm.conf
>> @@ -14,7 +14,7 @@ require conf/machine/include/keystone.inc
>>
>>   PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
>>
>> -IMAGE_FSTYPES += "tar.bz2 cpio"
>> +IMAGE_FSTYPES += "ubi tar.bz2 cpio"
>
> BTW, speaking of this - do you still need uncompressed cpio? Last time we
> talked, we were not sure if compressed cpio.gz would be sufficient.
>
>
>>   SERIAL_CONSOLE = "115200 ttyS0"
>>
>> @@ -23,3 +23,20 @@ SYSVINIT_ENABLED_GETTYS = ""
>>   UBOOT_MACHINE = "tci6638_evm_config"
>>
>>   MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
>> +# do ubiattach /dev/ubi_ctrl -m 4
>> +# From dmesg:
>> +# UBI: smallest flash I/O unit:    2048
>> +# UBI: logical eraseblock size:    126976 bytes
>> +# from ubiattach stdout:
>> +# UBI device number 0, total 857 LEBs
>> +# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
>> +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
>> +
>> +# do ubiattach /dev/ubi_ctrl -m 4
>> +# from dmesg:
>> +# UBI: smallest flash I/O unit:    2048
>> +# UBI: physical eraseblock size:   131072 bytes (128 KiB)
>> +# UBI: sub-page size:              2048
>> +UBINIZE_ARGS = "-m 2048 -p 128KiB -s 2048 -O 2048"
>> +
>> +
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>


