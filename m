Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C069E00968; Sat,  4 Apr 2015 12:12:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 598 seconds by postgrey-1.32 at yocto-www;
	Sat, 04 Apr 2015 12:12:04 PDT
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A575FE006E6
	for <meta-ti@yoctoproject.org>; Sat,  4 Apr 2015 12:12:04 -0700 (PDT)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 649D82F1CC
	for <meta-ti@yoctoproject.org>; Sat,  4 Apr 2015 21:01:59 +0200 (CEST)
Message-ID: <5520352C.2010100@pseudoterminal.org>
Date: Sat, 04 Apr 2015 21:02:04 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20141008161507.GE18916@piout.net>
	<20141008181338.GT1731@edge>	<20141008195358.GF18916@piout.net>
	<20141008220157.GG18916@piout.net>
In-Reply-To: <20141008220157.GG18916@piout.net>
Subject: Re: Issues installing libgles-omap3
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
X-List-Received-Date: Sat, 04 Apr 2015 19:12:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Very late reply, but I still write this so it may help others:

I've had the same problem. Turns out that by adding at the end of 
conf/local.conf the line:

   PACKAGE_CLASSES = "package_ipk"

the problem is fixed.
I don't know why RPM isn't handling this properly, but everything works 
fine with this change.


Am 2014-10-09 um 00:01 schrieb Alexandre Belloni:
> On 08/10/2014 at 21:53:58 +0200, Alexandre Belloni wrote :
>> On 08/10/2014 at 14:13:38 -0400, Denys Dmytriyenko wrote :
>>> On Wed, Oct 08, 2014 at 06:15:07PM +0200, Alexandre Belloni wrote:
>>>> Hi,
>>>>
>>>> I'm trying to build an image with poky (daisy) for the am335x-evm. While
>>>> libgles-omap3 builds fine. At the final installation step (do_rootfs for
>>>> my image), it fails with:
>>>>
>>>> Computing transaction...error: Can't install libgles-omap3-es5-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so
>>>>
>>>> On another build machine, it fails with:
>>>>
>>>> Computing transaction...error: Can't install libgles-omap3-es3-5.01.01.01-r38.1@cortexa8t2hf_vfp_neon: no package provides libews.so
>>>>
>>>>
>>>> What I don't understand is why it is not selecting libgles-omap3-es8
>>>> which as I understand would be the correct package for ti33x.
>>>>
>>>> Any insight on how to debug that ?
>>> Can you please show how do you pull it into your image. Thanks.
>>>
>> Sure, I tried multiple things, but basically, I have:
>>
>> PREFERRED_PROVIDER_virtual/egl ?= "libgles-omap3"
>> PREFERRED_PROVIDER_virtual/libgles1 ?= "libgles-omap3"
>> PREFERRED_PROVIDER_virtual/libgles2 ?= "libgles-omap3"
>> PREFERRED_PROVIDER_virtual/libgl ?= "mesa-gl"
>> PREFERRED_PROVIDER_virtual/mesa ?= "mesa-gl"
>>
>> and libgles-omap3 is coming as a dependency of qtbase (from meta-qt5).
>> But I also tried removing qtbase from my image recipe and putting
>> directly either libgles-omap3 or libgles-omap3-es8 in IMAGE_INSTALL,
>> with the same result.
>>
> Just to let you know, the same image recipe builds fine when using
> meta-arago.
>


