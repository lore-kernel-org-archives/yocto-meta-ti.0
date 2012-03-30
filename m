Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DC08E0044D
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 15:17:22 -0700 (PDT)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q2UMHL0r005356;
	Fri, 30 Mar 2012 17:17:21 -0500
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q2UMHLYB009989;
	Fri, 30 Mar 2012 17:17:21 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 30 Mar 2012 17:17:21 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q2UMHK0O021598;	Fri, 30 Mar 2012 17:17:20 -0500
Message-ID: <4F7630F0.8010408@ti.com>
Date: Fri, 30 Mar 2012 18:17:20 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <F01BAC6C-9AA4-4D59-AB9B-067A9D1E9ED7@dominion.thruhere.net>	<20120319205854.GE19810@bill-the-cat>	<20120319210247.GD15554@denix.org>	<20120319210557.GF19810@bill-the-cat>
	<788A3D57-ACFD-4CA0-820F-0DD91DCB8196@dominion.thruhere.net>
In-Reply-To: <788A3D57-ACFD-4CA0-820F-0DD91DCB8196@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 30 Mar 2012 22:17:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2012 06:09 PM, Koen Kooi wrote:
>
> Op 19 mrt. 2012, om 14:05 heeft Tom Rini het volgende geschreven:
>
>> On Mon, Mar 19, 2012 at 05:02:47PM -0400, Denys Dmytriyenko wrote:
>>> On Mon, Mar 19, 2012 at 01:58:54PM -0700, Tom Rini wrote:
>>>> On Mon, Mar 19, 2012 at 01:58:36PM +0100, Koen Kooi wrote:
>>>>> Hi,
>>>>>
>>>>> Any volunteers for maintaining a releasebranch that matches the upcoming oe-core release in ~4 weeks?
>>>>
>>>> If Denys or Chase don't step-up, I'll do it.  As qualification, I do
>>>> such a thing for oe-classic currently :)  But if either of them would
>>>> rather, I'll defer to them.
>>>
>>> We'll probably need to set meta-oe-maintenance up anyway for meta-arago to
>>> work with, rather than chasing changes in the master...
>>
>> Yes, meta-oe will also need a maintenance release to match
>
> meta-oe branch is really close to having a maintainer, what's the (final) word on the meta-ti branch?

I have no objection to the branch to ensure the current working 
functionality remains working with yocto maintenance releases.

However, I don't think we should actively maintain new features on both 
branches.

So what is the goal of the branch?

