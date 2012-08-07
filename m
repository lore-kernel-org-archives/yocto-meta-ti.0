Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56C3CE011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 09:36:25 -0700 (PDT)
Received: from localhost ([127.0.0.1]:56431 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Symlc-0000vM-5n
	for meta-ti@yoctoproject.org; Tue, 07 Aug 2012 16:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=mrrjdZFgVfuAEBMIcXudyYpxclM=; b=WkADKUwSB9+43V2s2RGKZ64pbZqp
	L+cjGoR0PZ7PgcQakXoQi6sOSIrZbV6aVn+cEsVmb7VWliB2YHyZFDGHFJj0Cbyz
	Ed4i/8vH4gt28R3HtbIg1TlI+yzsJ3dnHsQXD8vALQ4LOMNlB/nlMPf1RzzGXkeA
	0Az3AzKoSff9qHY=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:49745 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1Symlc-0000vJ-34
	for meta-ti@yoctoproject.org; Tue, 07 Aug 2012 16:36:24 +0000
Message-ID: <50214406.8000704@communistcode.co.uk>
Date: Tue, 07 Aug 2012 17:36:22 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5020D9A0.30000@communistcode.co.uk> <20120807153016.GA8716@edge>
	<015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
	<20120807153806.GC8716@edge> <1344354289.9756.276.camel@ted>
	<20120807155336.GE8716@edge>
In-Reply-To: <20120807155336.GE8716@edge>
Subject: Re: Turning off kernel config option
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 16:36:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2012 16:53, Denys Dmytriyenko wrote:
> On Tue, Aug 07, 2012 at 04:44:49PM +0100, Richard Purdie wrote:
>> On Tue, 2012-08-07 at 11:38 -0400, Denys Dmytriyenko wrote:
>>> On Tue, Aug 07, 2012 at 05:32:36PM +0200, Koen Kooi wrote:
>>>>
>>>> Op 7 aug. 2012, om 17:30 heeft Denys Dmytriyenko <denys@ti.com> het volgende geschreven:
>>>>
>>>>> On Tue, Aug 07, 2012 at 10:02:24AM +0100, Jack Mitchell wrote:
>>>>>> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from
>>>>>> meta-ti. I am using the poky distro configuration and I have changed
>>>>>> the defconfig in
>>>>>> meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
>>>>>> but it still builds with CONFIG_SPI_DEBUG enabled.
>>>>>
>>>>> That should be the correct location, please make sure you re-do the unpack
>>>>> task - if you previously built the kernel with the old defconfig, it will be
>>>>> stored in the work directory and won't be copied from the repository above,
>>>>> until you repeat the do_unpack task, i.e. by clenaing the build.
>>>
>>> BTW, no need to clean the entire build, just the kernel build:
>>>
>>> $ bitbake virtual/kernel -c clean
>>>
>>>> Or just increment PR as you're supposed to, it's an output change after all.
>>>> No need to check anything if you do it properly :)
>>>
>>> Well, but then you are staring to change the recipe, which might be overkill
>>> for a simple defconfig change you want to test. If you go that route, you may
>>> want to create your own custom layer with the modified defconfig overlayed on
>>> top of meta-ti and a simple .bbappend with PRINC. That way your changes will
>>> be detached from meta-ti and you won't need to merge the recipe changes every
>>> time meta-ti updates... Although, there's no way to bbappend the defconfig
>>> itself - that's where config fragments come to play.
>>
>> With the recent changes to OE-Core, you can edit the defconfig, the
>> system will notice the checksum change and automatically rerun the
>> unpack and subsequent steps automagically.
>
> Richard,
>
> That is quite useful, thanks for the info!
>
>
>> If the PR server is enabled, it will bump PR for you too.
>
> That is something I haven't looked at yet, honestly - too much Classic-OE
> baggage to carry... :)
>

Well, this thread took off when I turned my back!

Thanks for all the advice and different solutions - I found what my 
issue was and it is that the BeagleBone was booting using the kernel on 
the rootfs rather than the kernel in the fat partition as I believed. So 
I was only replacing the FAT partition uImage and not re-building and 
copying the whole rootfs.

Next step is indeed to have an overlay so I can customize the kernel 
config a bit more, along with a patch or two I have in there.

Cheers,
Jack

