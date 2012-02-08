Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B4F0E004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:34:40 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1606EF8123F; Wed,  8 Feb 2012 15:34:40 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 82050F8123B;
	Wed,  8 Feb 2012 15:34:38 -0700 (MST)
Message-ID: <4F32F87E.2070907@mlbassoc.com>
Date: Wed, 08 Feb 2012 15:34:38 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
In-Reply-To: <8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 08 Feb 2012 22:34:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-08 15:27, Koen Kooi wrote:
>
> Op 8 feb. 2012, om 23:22 heeft Gary Thomas het volgende geschreven:
>
>> On 2012-02-08 15:18, Koen Kooi wrote:
>>>
>>> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende geschreven:
>>>
>>>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>>>>> On 2012-02-08 14:58, jfabernathy wrote:
>>>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the meta-ti repository in the poky directory and tried to build core-image-sato for both machine pandaboard and
>>>>>> omap4430-panda. However, I immediately get an error because bitbake is looking for recipes-images/angstrom/systemd-image.bb, which is required in the ti-hw-bringup-image.bb image
>>>>>> recipe.
>>>>>>
>>>>>> All I really included was the machine name change in local.conf and added the meta-ti layer in bblayers.conf.
>>>>>>
>>>>>> Did I miss a step?
>>>>>
>>>>> This was discussed last week.  Add this line to your local.conf
>>>>>   BBMASK = ".*/meta-ti/recipes-misc/"
>>>>> This will skip some BeagleBoard/BeagleBone recipes that are not
>>>>> currently working in a Yocto tree.
>>>>>
>>>> Thanks a bunch. That got it going.  The README said nothing
>>>
>>> Stop spreading such lies!
>>
>> It's not a lie, just a perspective.
>
> It *is* a lie, since the README is non-empty. Regardless of what you want to do, the README does contain content.

Sorry, I thought you were referring to my work-around to get this
going in Yocto.  Obviously, he was looking for more info in the
README than just how to use this layer with Angstrom and I agree
that this "trick" probably does not belong in the README.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

