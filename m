Return-Path: <jfabernathy@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1397AE01370
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 05:11:58 -0800 (PST)
Received: by qauh8 with SMTP id h8so1187757qau.14
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 05:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=L34vYJB7Rhl617pRnWZCN8BaK5LIr7QGDHgTKU0lToM=;
	b=kGGvUKXrd/vvQoSiKI9LeyrQny+sOSOSgg4/BRw20x6U15CQrpckOTCGhRu326p7F0
	UvldwxM4ORLyEfn88x8jF90CzrpiEm+hApe3Jsv9LjoRGmF1/iq2SIS8bj2gcA3vGAqO
	ER5wb6XiWowxXmjke8aQ4rpNu5CIzuGeRwN2M=
Received: by 10.229.135.193 with SMTP id o1mr1180800qct.74.1328793118355;
	Thu, 09 Feb 2012 05:11:58 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-54-63.dhcp.embarqhsd.net. [184.3.54.63])
	by mx.google.com with ESMTPS id
	fh6sm5644846qab.22.2012.02.09.05.11.57 (version=SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 05:11:57 -0800 (PST)
Message-ID: <4F33C61E.5080505@gmail.com>
Date: Thu, 09 Feb 2012 08:11:58 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<7D46E86EC0A8354091174257B2FED10127667EB8@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10127667EB8@DLEE12.ent.ti.com>
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
X-List-Received-Date: Thu, 09 Feb 2012 13:11:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 08:01 AM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of James Abernathy
>> Sent: Wednesday, February 08, 2012 4:52 PM
>> To: Gary Thomas
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] building Yocto for Pandaboard
>>
>>
>> On Feb 8, 2012, at 5:34 PM, Gary Thomas wrote:
>>
>>> On 2012-02-08 15:27, Koen Kooi wrote:
>>>> Op 8 feb. 2012, om 23:22 heeft Gary Thomas het volgende
>> geschreven:
>>>>> On 2012-02-08 15:18, Koen Kooi wrote:
>>>>>> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende
>> geschreven:
>>>>>>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>>>>>>>> On 2012-02-08 14:58, jfabernathy wrote:
>>>>>>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned
>> the meta-ti repository in the poky directory and tried to build
>> core-image-sato for both machine pandaboard and
>>>>>>>>> omap4430-panda. However, I immediately get an error because
>> bitbake is looking for recipes-images/angstrom/systemd-image.bb,
>> which is required in the ti-hw-bringup-image.bb image
>>>>>>>>> recipe.
>>>>>>>>>
>>>>>>>>> All I really included was the machine name change in
>> local.conf and added the meta-ti layer in bblayers.conf.
>>>>>>>>> Did I miss a step?
>>>>>>>> This was discussed last week.  Add this line to your
>> local.conf
>>>>>>>>   BBMASK = ".*/meta-ti/recipes-misc/"
>>>>>>>> This will skip some BeagleBoard/BeagleBone recipes that are
>> not
>>>>>>>> currently working in a Yocto tree.
>>>>>>>>
>>>>>>> Thanks a bunch. That got it going.  The README said nothing
>>>>>> Stop spreading such lies!
>>>>> It's not a lie, just a perspective.
>>>> It *is* a lie, since the README is non-empty. Regardless of what
>> you want to do, the README does contain content.
>>> Sorry, I thought you were referring to my work-around to get this
>>> going in Yocto.  Obviously, he was looking for more info in the
>>> README than just how to use this layer with Angstrom and I agree
>>> that this "trick" probably does not belong in the README.
>>>
>>> --
>> Wow!  Sorry I jumped into a mailing list I obviously don't
>> understand or belong in.  I apologize if I offended.  I did read
>> the README, but it didn't make a bit of sense to me because it
>> talked about angstrom, which I don't know anything about and
>> wondered what that had to do with yocto.  My current Yocto
>> knowledge is based on the meta-intel layer, which doesn't mention
>> angstrom.  It sounds like the hint/trick that Gary mentioned will
>> make bitbake build with just yocto, which is what I want.  My goal
>> is more of a proof of concept.  I'd like to prove if you could take
>> the same image recipe and move it from Pandaboard to Atom and vice
>> versa.  That way a developer could pick the hardware platform based
>> on the performance, features, and cost.  The software effort should
>> be minimal to move if the Yocto concept works as advertised.
> Jim, you are welcome here.  As was mentioned before there have been a lot of discussions about this layer.  One of the goals for the meta-ti layer will be to work with just oe-core and yocto and not require meta-angstrom.  We are moving that direction and the use case you are trying and your experiences with it are important.  Thanks for taking the time to give this a shot.
>
Thanks, glad the proof of concept falls into the groups thinking as 
well.  I will monitor for progress on the use of just the Yocto Linux 
for this POC.  I've tested Angstrom, and while it works on Pandaboard 
does not achieve what my goal is.

I did post another question regarding an error I got while building just 
with Yocto. Not sure if a solution for it exists yet without going down 
the Angstrom route as others have suggested.

Thanks again,

JIm A

>> Jim A
>>
>>> ------------------------------------------------------------
>>> Gary Thomas                 |  Consulting for the
>>> MLB Associates              |    Embedded world
>>> ------------------------------------------------------------
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


