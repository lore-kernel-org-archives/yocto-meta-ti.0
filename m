Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2345E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 09:12:22 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6C8BCF8128D; Thu,  9 Feb 2012 10:12:22 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 22491F81202;
	Thu,  9 Feb 2012 10:12:21 -0700 (MST)
Message-ID: <4F33FE75.90907@mlbassoc.com>
Date: Thu, 09 Feb 2012 10:12:21 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>	<4F32F59B.7010804@mlbassoc.com>	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>	<4F32F87E.2070907@mlbassoc.com>	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>	<4F331E78.3000302@ti.com>	<CAFZh4h_dVaOnbYMZjnAc34upJqoPKK4AaPEOEHPTQL6ZEyU-6w@mail.gmail.com>	<CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
	<20120209163651.GA3917@denix.org> <4F33FB87.8030102@balister.org>
In-Reply-To: <4F33FB87.8030102@balister.org>
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Thu, 09 Feb 2012 17:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-09 09:59, Philip Balister wrote:
> On 02/09/2012 08:36 AM, Denys Dmytriyenko wrote:
>> On Thu, Feb 09, 2012 at 11:23:14AM -0500, Brian Hutchinson wrote:
>>>   On Wed, Feb 8, 2012 at 8:16 PM, William Mills<wmills@ti.com>  wrote:
>>>> As Gary said there has not been too many end user questions on meta-ti yet.
>>>
>>>   All I care about is meta-ti as that is what all our products are based
>>>   on. I've been watching subject for a while now trying to discern all
>>>   the issues and make a wise choice.
>>
>> Brian,
>>
>>>   I'm wanting to switch from Arago to whatever TI supports next as I
>>>   supply the rest of our development team with tools and images that
>>>   they build applications on for our products and I can't jerk them
>>>   around changing distros.
>>
>> As you are aware, Arago is not going away - there is work going on in
>> meta-arago layer to update/port it to the new Yocto infrastructure.
>>
>> Arago/meta-arago is still going to be the official platform distribution for
>> TI SDK products. But, a separate meta-ti layer was created early in the
>> process to detach and unify the BSP layer and allow people to use TI hardware
>> with different distributions. And that's actually part of the problem, as
>> distributions like religions conflict with each other in a single layer... :)
>>
>
> Denys, from my point of view, there are two issues we need to solve:
>
> 1) Defining the meta-ti toolchain dependencies. Angstrom uses gcc-4.5
> for various reasons. Will the TI programs work against all gcc versions
> available from oe-core/meta-oe?

I've had good luck with the meta-ti layer + Poky (oe-core & meta-yocto).
I have my own kernels (for other OMAP boards that are not mainline), so
I don't use the meta-ti kernel recipes, but I do use much of the rest,
including the DSP bits.

>
> 2) Image construction pieces in oe-core are not all there yet. This is
> what leads to angstrom specific bits creeping into the BSP layer. I've
> talked with Paul Eggleton and Koen about this at FOSDEM. We should sit
> down next week at ELC and see if we can come up with a set os tasks we
> can push into oe-core that let all layer/distro combinations produce
> working images.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

