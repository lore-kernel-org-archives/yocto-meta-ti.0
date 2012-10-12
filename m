Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9715AE0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 07:42:05 -0700 (PDT)
Received: from localhost ([127.0.0.1]:40664 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMgRA-0003vN-29
	for meta-ti@yoctoproject.org; Fri, 12 Oct 2012 14:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=y+Sgt6FrDvdzOyeL30oGpE34GhM=; b=FaKO+2YAVmtkftyruuV0i0r8czye
	s9rxD/hEElaR/3pVJKxoCAp5JqwQ6Cck2KGdXSPGisA5s2grs3QRQkvEjJfyimt7
	ts++n/mFrvc/nJQlqW0sCZUEByvg0eGvtnlEnruNITwV9Y+UWHbwsq8Hm7+ZEu+d
	peb2bjPCKiVm+tY=
Received: from [195.171.99.130] (port=47444 helo=[192.168.0.79])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMgR9-0003vK-W4
	for meta-ti@yoctoproject.org; Fri, 12 Oct 2012 14:42:04 +0000
Message-ID: <50782CAB.6050500@communistcode.co.uk>
Date: Fri, 12 Oct 2012 15:43:55 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CA+T6QPnq1dZOJ-D+C-FFodCBjxN5AOE_qC3dFj_Vtz86rdk0bg@mail.gmail.com>
	<5077EFE3.7000603@communistcode.co.uk>
	<20121012140425.GB26956@edge>
In-Reply-To: <20121012140425.GB26956@edge>
Subject: Re: Introducing meta-beagleboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 14:42:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/12 15:04, Denys Dmytriyenko wrote:
> On Fri, Oct 12, 2012 at 11:24:35AM +0100, Jack Mitchell wrote:
>> On 11/10/12 16:46, Jason Kridner wrote:
>>> To help foster fast development, future releases of the Angstrom
>>> Distribution that ships with BeagleBoard.org platforms (such as
>>> BeagleBone and BeagleBoard-xM) will be built using meta-beagleboard,
>>> rather than meta-ti. While this produces the seemingly undesirable
>>> effect of providing yet-another-BSP for BeagleBoard.org platforms,
>>> collaboration in the mainline kernel and bootloaders that are the key
>>> elements for the BSPs has made this possible and multiple goals for
>>> the various BSPs has made it desirable.
>>>
>>> The objectives for meta-beagleboard are:
>>> 1) Provide the best possible out-of-box-experience for BeagleBoard.org platforms
>>> 2) Enable as much add-on hardware as possible
>>> 3) Enable public contributions to extend the experience and hardware support
>>> 4) Deliver information to the BeagleBoard.org community regarding the
>>> development status
>>>
>>> The repository will be hosted at:
>>> https://github.com/beagleboard/meta-beagleboard
>> Great news! Will the kernel in this BSP be attempting to follow
>> mainline + public patches? I'm chomping at the bit for an easy way
>> to build a tested DT kernel with recent patches.
> Jack,
>
> Here's a little bit of information to help you and others understand the
> situation a bit better.
>
> The beagleboard kernel recipe in meta-ti was already following mainline +
> public patches. As of the beaglebone:
>
> The mainline kernel team for am335x inside TI has been hard at work pushing
> patches upstream for quite a while now. You can see significant improvements
> in the mainline kernel already, even in 3.6, when it comes to supporting
> am335x. But the goal is to have most, if not all, of the features in place by
> the time Linus releases 3.8 kernel. According to the schedule, that is around
> the end of this year or early next year.
>
> Due to limited resources of testing and validation, the integration team
> decided to not spend time on kernels between the last staging (i.e. PSP) 3.2
> kernel and 3.8, when everything is available in mainline.
>
> Unfortunately, that does not work for BeagleBoard.org and Koen needs mainline
> support sooner, integrating incomplete 3.6 and 3.7 with the work-in-progress
> patches. That's one of the points behind creating meta-beagleboard layer.
>
> That said, meta-ti will also be switching to the mainline kernel once it is
> available, i.e. with 3.8 release. It's just that meta-beagleboard gets there
> sooner... :)
>

Perfect, thank you Denys. That also explains why the PSP releases for 
the BBone haven't been very forthcoming. I have been watching the 
mainline patches come in but didn't realise that TI were heading for 3.8 
'full' support. I will be looking forward to it, I can almost taste that 
eDMA

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


