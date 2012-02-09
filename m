Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93320E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:03:13 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q19G3BSR025845;
	Thu, 9 Feb 2012 10:03:11 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q19G3Bmr001554;
	Thu, 9 Feb 2012 10:03:11 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Thu, 9 Feb 2012
	10:03:11 -0600
Received: from [172.24.0.208] (h0-208.vpn.ti.com [172.24.0.208])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q19G378m014755;
	Thu, 9 Feb 2012 10:03:08 -0600
Message-ID: <4F331E78.3000302@ti.com>
Date: Wed, 8 Feb 2012 20:16:40 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: James Abernathy <jfabernathy@gmail.com>
References: <4F32F016.4020008@gmail.com>
	<4F32F1B3.8090000@mlbassoc.com>	<4F32F31B.2000303@gmail.com>	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>	<4F32F59B.7010804@mlbassoc.com>	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
In-Reply-To: <38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 09 Feb 2012 16:03:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/08/2012 05:51 PM, James Abernathy wrote:
>
> On Feb 8, 2012, at 5:34 PM, Gary Thomas wrote:
>
>> On 2012-02-08 15:27, Koen Kooi wrote:
>>>
>>> Op 8 feb. 2012, om 23:22 heeft Gary Thomas het volgende geschreven:
>>>
>>>> On 2012-02-08 15:18, Koen Kooi wrote:
>>>>>
>>>>> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende geschreven:
>>>>>
>>>>>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>>>>>>> On 2012-02-08 14:58, jfabernathy wrote:
>>>>>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the meta-ti repository in the poky directory and tried to build core-image-sato for both machine pandaboard and
>>>>>>>> omap4430-panda. However, I immediately get an error because bitbake is looking for recipes-images/angstrom/systemd-image.bb, which is required in the ti-hw-bringup-image.bb image
>>>>>>>> recipe.
>>>>>>>>
>>>>>>>> All I really included was the machine name change in local.conf and added the meta-ti layer in bblayers.conf.
>>>>>>>>
>>>>>>>> Did I miss a step?
>>>>>>>
>>>>>>> This was discussed last week.  Add this line to your local.conf
>>>>>>>   BBMASK = ".*/meta-ti/recipes-misc/"
>>>>>>> This will skip some BeagleBoard/BeagleBone recipes that are not
>>>>>>> currently working in a Yocto tree.
>>>>>>>
>>>>>> Thanks a bunch. That got it going.  The README said nothing
>>>>>
>>>>> Stop spreading such lies!
>>>>
>>>> It's not a lie, just a perspective.
>>>
>>> It *is* a lie, since the README is non-empty. Regardless of what you want to do, the README does contain content.

I for one read that as Gary intended, that the README did not say 
anything about how to get it to work with Yocto.  Can we word things is 
a less confrontational way please?

>>
>> Sorry, I thought you were referring to my work-around to get this
>> going in Yocto.  Obviously, he was looking for more info in the
>> README than just how to use this layer with Angstrom and I agree
>> that this "trick" probably does not belong in the README.
>>
>> --
>
> Wow!  Sorry I jumped into a mailing list I obviously don't understand or belong in.

There was nothing wrong with your question.

As Gary said there has not been too many end user questions on meta-ti 
yet.  Of course someone has to be first.

meta-ti is still in early development.  It started life working only in 
an Angstrom context.  We are making changes that will make most of it 
work with just oe-core or yocto/poky but that is not ready yet.  Gary's 
work around is an interesting approximation of what we are shooting for.

> I apologize if I offended.  I did read the README, but it didn't make a bit of sense to me because it talked about angstrom, which I don't know anything about and wondered what that had to do with yocto.  My current Yocto knowledge is based on the meta-intel layer, which doesn't mention angstrom.  It sounds like the hint/trick that Gary mentioned will make bitbake build with just yocto, which is what I want.  My goal is more of a proof of concept.  I'd like to prove if you could take the same image recipe and move it from Pandaboard to Atom and vice versa.  That way a developer could pick the hardware platform based on the performance, features, and cost.  The software effort should be minimal to move if the Yocto concept works as advertised.
>
> Jim A
>
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

