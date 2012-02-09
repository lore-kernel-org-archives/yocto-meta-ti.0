Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4D06E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:36:55 -0800 (PST)
Received: from [192.168.0.29] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 671D920654
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 16:02:26 +0000 (GMT)
Message-ID: <4F33F605.9040901@communistcode.co.uk>
Date: Thu, 09 Feb 2012 16:36:21 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120205 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<7D46E86EC0A8354091174257B2FED10127667EB8@DLEE12.ent.ti.com>
	<4F33C61E.5080505@gmail.com>
	<4C3F7029-4844-4BA7-B378-BC30E27660F0@dominion.thruhere.net>
	<1328801627.9968.32.camel@ted> <4F33F4A0.6010303@gmail.com>
In-Reply-To: <4F33F4A0.6010303@gmail.com>
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
X-List-Received-Date: Thu, 09 Feb 2012 16:36:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/12 16:30, jfabernathy wrote:
> On 02/09/2012 10:33 AM, Richard Purdie wrote:
>> On Thu, 2012-02-09 at 14:54 +0100, Koen Kooi wrote:
>>> Op 9 feb. 2012, om 14:11 heeft jfabernathy het volgende geschreven:
>>>> On 02/09/2012 08:01 AM, Maupin, Chase wrote:
>>>>>> Wow!  Sorry I jumped into a mailing list I obviously don't
>>>>>> understand or belong in.  I apologize if I offended.  I did read
>>>>>> the README, but it didn't make a bit of sense to me because it
>>>>>> talked about angstrom, which I don't know anything about and
>>>>>> wondered what that had to do with yocto.  My current Yocto
>>>>>> knowledge is based on the meta-intel layer, which doesn't mention
>>>>>> angstrom.  It sounds like the hint/trick that Gary mentioned will
>>>>>> make bitbake build with just yocto, which is what I want.  My goal
>>>>>> is more of a proof of concept.  I'd like to prove if you could take
>>>>>> the same image recipe and move it from Pandaboard to Atom and vice
>>>>>> versa.  That way a developer could pick the hardware platform based
>>>>>> on the performance, features, and cost.  The software effort should
>>>>>> be minimal to move if the Yocto concept works as advertised.
>>>>> Jim, you are welcome here.  As was mentioned before there have been
>>> a lot of discussions about this layer.  One of the goals for the
>>> meta-ti layer will be to work with just oe-core and yocto and not
>>> require meta-angstrom.  We are moving that direction and the use case
>>> you are trying and your experiences with it are important.  Thanks for
>>> taking the time to give this a shot.
>>>> Thanks, glad the proof of concept falls into the groups thinking as
>>> well.  I will monitor for progress on the use of just the Yocto Linux
>>> for this POC.
>>>
>>> Yocto or Poky? Because if you want yocto, angstrom very much *is*
>>> yocto. If you want Poky, that's something different.
>> I think there are a few things need to get cleared up here as this is
>> likely confusing for people.
>>
>> The Yocto Project is the overall project which is working on improving
>> embedded Linux for people in whatever areas those improvements are
>> needed in. This involves things like eglibc, creating standard formats
>> for hardware definitions (BSPs) and has also involved some work on build
>> system which are derived from OpenEmbedded.
>>
>> The Yocto Project uses Poky as its reference build system which is a
>> combination of Bitbake, OE-Core, a load of documentation and a very
>> small shim called meta-yocto. Its purpose is to provide a known good
>> base system people can build on top of by adding layers.
>>
>> Angstrom is similar to Poky in that its a mix of components allowing
>> people to build things. It includes Bitbake and OE-Core and some other
>> pieces. It has an equivalent to meta-yocto with different functionality.
>> I'll let Koen as one of its maintainers describe what its purpose is.
>> One difference is that is has a specific set of hardware targets and
>> provides prebuilt package feeds which Poky does not (nor does the Yocto
>> Project).
>>
>> meta-ti is intended as a hardware support layer for various TI products.
>>
>> The trouble is that some of these components have been around for a
>> while and it hasn't always been possible to neatly layer things. In
>> particular, meta-ti historically has a dependency on Angstrom.
>>
>> Work is underway to remove that dependency so meta-ti can operate freely
>> with both Poky and Angstrom, or just with OE-Core and Bitbake as
>> separate pieces. There is no architectural problem with this and it is
>> the intention of everyone involved. There is the question of sorting
>> some of the mechanics and making the change whilst not causing problems
>> for existing users. I'm really happy to see progress on this!
>>
>> So in answer to Jim's question, you will be able to use meta-ti with
>> Poky directly but right now, there are some details being worked through
>> and it doesn't quite work. Perhaps we could mention that in the meta-ti
>> README so people can see what the plan is as well as the current
>> situation?
>>
>> Cheers,
>>
>> Richard
>>
> When you look at Yocto project from a marketing point of view, which 
> is not something the open source community usually concentrates on for 
> obvious reasons, it would be a very positive message to be able to 
> talk about, and demonstrate with examples of taking the same project 
> and moving it from one architecture to another with minimal effort, as 
> long as both architectures supported the key features like media 
> playback acceleration, 3D, sound, HDMI, etc.
>
> While hardware companies tend to cringe when you make it too easy to 
> move back and forth, the reality is, if you have a high volume product 
> you can't justify or afford to throw excess performance, thermals, 
> power, and cost where it is not needed.  For example a cheap digital 
> signage application that just throws advertisement, or menu data on 
> the screen could be done with an ARM processor like OMP3/4, but if you 
> had a higher end product that needed to do extensive video analytics 
> for customer profiling and advertising effectiveness, you're going to 
> want a Core i5/i7.  It would be of great benefit to take the Yocto 
> project that did the digital sign on the ARM and quickly get it up and 
> running on the Core i5 and then concentrate on the analytics application.
>
> I think this portability is a better sell, if it's all Yocto.  We all 
> know that really smart people can move around from different Linux 
> versions and development methods, but it's an easier sale to a 
> customer management when you say it can all be done on Yocto and that 
> it's easily demonstrated.
>
> JIm A
>
>>
>>
>>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

Jim,

This is the exact scenario that I am undergoing with my company. I am 
attempting to use Yocto to prove platform mobility under Linux with a 
common set of applications which can then be specialised on a per 
product/hardware basis. It seems as though this is a very lucrative idea 
with the speed of SoC development these days!

Regards,
Jack.

