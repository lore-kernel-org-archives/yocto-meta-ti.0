Return-Path: <wmills@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD777E0140C
	for <meta-ti@yoctoproject.org>; Tue, 12 Jun 2012 07:22:37 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5CEMZI9024824;
	Tue, 12 Jun 2012 09:22:35 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5CEMZjM011563;
	Tue, 12 Jun 2012 09:22:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Jun 2012 09:22:35 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.102.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q5CEMZIg015960;	Tue, 12 Jun 2012 09:22:35 -0500
Message-ID: <4FD750AB.9040700@ti.com>
Date: Tue, 12 Jun 2012 10:22:35 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <20120612011706.GD30300@denix.org>
	<DD1A526D-B7EE-45D1-9DED-C2FB40897FBA@dominion.thruhere.net>
In-Reply-To: <DD1A526D-B7EE-45D1-9DED-C2FB40897FBA@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Tue, 12 Jun 2012 14:22:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2012 09:44 AM, Koen Kooi wrote:
>
> Op 11 jun. 2012, om 20:17 heeft Denys Dmytriyenko het volgende geschreven:
>
>> Koen, et al,
>>
>> This is a RFC for creating an additional "extras" layer inside meta-ti to
>> contain pieces and components that are either slightly outdated (i.e. old
>> Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, anything
>> DSP-related, etc.) or require non-standard dependencies besides OE-Core
>> (systemd?) with the possibility of moving them back to "main" meta-ti in the
>> future, once they become "first-class citizens", i.e. gain current and
>> continuing support.
>

> If it's going to be split this way I'd like to move all beagleboard.org related things out of meta-ti and into it's own seperate repo.

We should do whatever makes the most sense and serves all the user's 
use-cases.  Angstrom beagleboard is an important use case but so is 
oe-core only on beagleboard and AM335x etc.  We also need people to 
understand what things are being built and tested every night vs 
something that was pretty much working when it was tried 6 months ago.

> If the beagle recipes are demoted to 2nd class citizens we have no incentive anymore to be in meta-ti.

I thought it was just the older beagleboard stuff that was moving?  Or 
are you complaining that not every feature of your current builds are 
available using just oe-core?

It is true that we are trying to do two things here:
1) separate things that require layers beyond oe-core
2) separate things that are not tested and supported to the same level

It was your assertion that we did not want too many layers. 
Unfortunately that means things that require layers beyond oe-core need 
to be in the second layer.  Sorry if you see that as being a second 
class citizen.

There are large parts of beagleboard and beaglebone that do work with 
only oe-core and are built and tested regularly.  Finding the right 
place for these pieces should, I think, be the focus of the discussion.

As I have said before, If you want a seperate layer/repo to support the 
specifics of Angstrom beagleboard/beaglebone _I_ think that would be fine.


> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

