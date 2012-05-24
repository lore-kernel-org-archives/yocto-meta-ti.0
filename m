Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E483E01363
	for <meta-ti@yoctoproject.org>; Thu, 24 May 2012 08:04:11 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E803EF811EA; Thu, 24 May 2012 09:04:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id BE37AF811EA;
	Thu, 24 May 2012 09:04:09 -0600 (MDT)
Message-ID: <4FBE4DE9.30501@mlbassoc.com>
Date: Thu, 24 May 2012 09:04:09 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <4FBBB531.8020401@communistcode.co.uk>
	<4FBBB786.8030501@mlbassoc.com>
	<4FBBB8E9.1040700@communistcode.co.uk>
	<20120522163158.GB15020@denix.org>
	<4FBCA367.701@communistcode.co.uk> <4FBCC147.90606@mlbassoc.com>
	<4FBCE8E4.6010208@communistcode.co.uk>
	<4FBE44EE.2070909@communistcode.co.uk>
In-Reply-To: <4FBE44EE.2070909@communistcode.co.uk>
Subject: Re: Beaglebone + Poky
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 15:04:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-24 08:25, Jack Mitchell wrote:
> On 23/05/12 14:40, Jack Mitchell wrote:
>> On 23/05/12 11:51, Gary Thomas wrote:
>>> On 2012-05-23 02:44, Jack Mitchell wrote:
>>>> On 22/05/12 17:31, Denys Dmytriyenko wrote:
>>>>> On Tue, May 22, 2012 at 05:03:53PM +0100, Jack Mitchell wrote:
>>>>>> On 22/05/12 16:57, Gary Thomas wrote:
>>>>>>> On 2012-05-22 09:48, Jack Mitchell wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I am currently trying to boot my beagleboard with a mix of
>>>>>>>> Poky/Meta-ti/meta-oe, I can build the image without error
>>>>>>>> however when I start booting the board the kernel gets to
>>>>>>>> 'freeing init memory' and seems to hang, although the beaglebone
>>>>>>>> light is still flashing and it will still accept keystrokes.
>>>>>>>> Could anyone shed any light on the situation?
>>>>>>>>
>>>>>>>> I am on the denzil branch for all three repositories.
>>>>>>>>
>>>>>>>> I have tried with USB only and USB + AC Adapter.
>>>>>>> What image did you use?
>>>>>> core-image-minimal - it does have a few extra programs added via
>>>>>> IMAGE_INSTALL but they are userspace only so shouldn't be affecting
>>>>>> the boot.
>>>>> Couple suggestions:
>>>>>
>>>>> 1. What's your init system? Since you have meta-oe mixed with poky, check if
>>>>> there are any problems with sysvinit or systemd, in case there is some mix up
>>>>> or confusion between those two...
>>>>>
>>>>> 2. Check your /etc/inittab for the correct tty used for getty, but it doesn't
>>>>> look like it reaches the prompt yet...
>>>>>
>>>>
>>>> I am using Poky defaults so I assume it will be sysvinit... however I did see systemd being built, what would be the outline procedure to check that mixing of systems isn't
>>>> occurring? None of my reciepes have systemd support, but I assume something being pulled in from meta-oe does...
>>>>
>>>> My getty is being pushed to ttyO0, is this correct for the beaglebone?
>>>
>>> Can you put your images somewhere where I can access them? I can give
>>> you an FTP push site if that helps? I'd like to run through your image
>>> here on my BeagleBone.
>>>
>>> BTW, the only way meta-oe could be causing problems would be if you are
>>> using some recipe from it. If you build exactly 'core-image-minimal' with
>>> no extra packages, does it work for you?
>>>
>>
>> Hi Gary,
>>
>> I just tried without my addional programs to build a core-image-minimal and it still halts on the same kernel message. Something that I forgot to mention the yesterday was that I
>> have a very high debugging level set, here is my local conf line:
>>
>> EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile dbg-pkgs"
>>
>> Which could cause other programs to be brought in?
>>
>> Regards,
>> Jack.
>>
>
> Just a quick note that removing meta-oe and just porting over the specific recipes that I needed fixed my problems. I still don't know specifically what they were but I am inclined
> to say they were init system related as Denys pointed out.

I agree - there seem to be some recipes in meta-oe that don't play
nice with a non-systemd setup like Poky.

Note: I was able to boot core-image-minimal built with meta-yocto + meta-oe
in all configurations of EXTRA_IMAGE_FEATURES as long as 'dbg-pkgs' was
not specified.  As soon as I added that feature, it fails to come up just
as you observed.  I'm not sure why (and I'm not too motivated to research
more, I've already built this thing about 20 times in different ways...)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

