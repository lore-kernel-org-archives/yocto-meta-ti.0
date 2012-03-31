Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8A05E01304
	for <meta-ti@yoctoproject.org>; Sat, 31 Mar 2012 07:27:50 -0700 (PDT)
Received: (qmail 695 invoked by uid 1003); 31 Mar 2012 14:27:50 -0000
Received: from unknown (HELO ?192.168.1.106?)
	(philip@opensdr.com@71.171.25.206)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	31 Mar 2012 14:27:49 -0000
Message-ID: <4F771465.7030708@balister.org>
Date: Sat, 31 Mar 2012 10:27:49 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: William Mills <wmills@ti.com>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>	<20120319205854.GE19810@bill-the-cat>	<20120319210247.GD15554@denix.org>	<20120319210557.GF19810@bill-the-cat>	<788A3D57-ACFD-4CA0-820F-0DD91DCB8196@dominion.thruhere.net>
	<4F7630F0.8010408@ti.com>
In-Reply-To: <4F7630F0.8010408@ti.com>
X-Enigmail-Version: 1.1.2
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org
Subject: Re: release branch for meta-ti?
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
X-List-Received-Date: Sat, 31 Mar 2012 14:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/30/2012 06:17 PM, William Mills wrote:
> On 03/30/2012 06:09 PM, Koen Kooi wrote:
>>
>> Op 19 mrt. 2012, om 14:05 heeft Tom Rini het volgende geschreven:
>>
>>> On Mon, Mar 19, 2012 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
>>>> On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
>>>>> On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Any volunteers for maintaining a releasebranch that matches the
>>>>>> upcoming oe-core release in ~4 weeks?
>>>>>
>>>>> If Denys or Chase don't step-up, I'll do it.  As qualification, I do
>>>>> such a thing for oe-classic currently :)  But if either of them would
>>>>> rather, I'll defer to them.
>>>>
>>>> We'll probably need to set meta-oe-maintenance up anyway for
>>>> meta-arago to
>>>> work with, rather than chasing changes in the master...
>>>
>>> Yes, meta-oe will also need a maintenance release to match
>>
>> meta-oe branch is really close to having a maintainer, what's the
>> (final) word on the meta-ti branch?
> 
> I have no objection to the branch to ensure the current working
> functionality remains working with yocto maintenance releases.
> 
> However, I don't think we should actively maintain new features on both
> branches.
> 
> So what is the goal of the branch?

People that ship OE based stuff to customers hate basing stuff that goes
to customers based on layers that are under active development. We are
much happier with layers that are getting fixes for existing problems only.

Philip

