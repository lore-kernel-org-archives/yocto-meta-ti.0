Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 091EEE0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:03:06 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RK35kX012572;
	Fri, 27 Jan 2012 14:03:05 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RK35v8024119;
	Fri, 27 Jan 2012 14:03:05 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 14:03:05 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RK34hR018343;	Fri, 27 Jan 2012 14:03:05 -0600
Message-ID: <4F2302F8.1000307@ti.com>
Date: Fri, 27 Jan 2012 15:03:04 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from	arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:03:07 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

OK this part is off list.

Go look at meta-intel and then look at the meta-ti your guys are 
purposing.   Now, your an engineer in a hurry and you need to choose 
between intel ATOM and TI ARM.  Which one looks simpler, clearer, and 
well organized.  Which do you want to use?

We are already way behind on simplicity of message.  We need to keep as 
much stuff out of here as we can.

On 01/27/2012 02:46 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: Mills, William
>> Sent: Friday, January 27, 2012 11:51 AM
>> To: Maupin, Chase
>> Cc: Koen Kooi; meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
>> arago overlay
>>
>> On 01/27/2012 08:50 AM, Maupin, Chase wrote:
>>
>>   >  but I definitely don’t think matrix belongs in meta-arago
>>
>> Why, justify.  Yes matrix needs to be different than the distro
>> definition on arago but As you point out below the only people
>> using
>> Matrix are Arago and Koen in Angstrom.  I think this comes down to
>> not
>> wanting the word "arago" occurring in the Angstrom layer stack.
>>
>> meta-ti should be about using TI chips.  Matrix and other demo
>> programs
>> we put together for our demo distro are not essential to using TI
>> chips.
> I guess we have a difference of opinion on how we see meta-arago.  I don’t separate that layer into distro and non-distro.  I was really planning on meta-arago being all the stuff related to the arago/SDK distribution.  Meta-ti is for TI packages that can be used by other distros.  That being said I'm OK with meta-ti being split into a BSP layer and everthing else, but I don't know exactly what that buys us.  Does it particularly hurt someone that pulls in meta-ti to have access to matrix if they don't use it?  I pull in things from meta-oe or oe-core that I don’t "need" but they are there anyway.
>
>>> 1. As of now matrix is only maintained by TI and used by TI (and
>> Koen to some extent) on our products.  So I would put this in a
>> layer that we maintain because it would seem strange to me to have
>> to go through another set of maintainers to update the SRCREV of
>> the package we are developing.  Particularly if no one is using it.
>>> 2. If people wanted matrix they could still include our layer to
>> get it.  If we see that happening a lot a there is a request from a
>> group of people to have this then we could push it lower, but if we
>> are the only ones using it and who care about it then I don't see
>> the reason to move this lower in the layer stack.

