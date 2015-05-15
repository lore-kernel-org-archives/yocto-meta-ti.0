Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E2C9E00945; Fri, 15 May 2015 11:16:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 774BAE00820
	for <meta-ti@yoctoproject.org>; Fri, 15 May 2015 11:16:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4FIGSpE028756
	for <meta-ti@yoctoproject.org>; Fri, 15 May 2015 13:16:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4FIGSsF027154
	for <meta-ti@yoctoproject.org>; Fri, 15 May 2015 13:16:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 May 2015 13:16:27 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4FIGMdO010000;
	Fri, 15 May 2015 13:16:24 -0500
Message-ID: <555637F6.5090006@ti.com>
Date: Fri, 15 May 2015 14:16:22 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
	<20150423201511.GT25236@edge> <55436D5E.8000900@ti.com>
	<20150514222151.GJ30969@edge>
In-Reply-To: <20150514222151.GJ30969@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC 0/2] Proposal for enabling CMEM
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2015 18:16:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/14/2015 6:21 PM, Denys Dmytriyenko wrote:
> On Fri, May 01, 2015 at 08:11:10AM -0400, Jacob Stiffler wrote:
>>
>> On 4/23/2015 4:15 PM, Denys Dmytriyenko wrote:
>>> On Thu, Apr 23, 2015 at 07:42:09AM -0400, Jacob Stiffler wrote:
>>>> This is a proposal for adding a CMEM region in the device tree.
>>>>
>>>> I wanted to get comments on the following:
>>>>
>>>> * implementation of using an inc file to enable this.
>>>> * Whether the actual configuration belongs in the kernel recipe, or if
>>>>    this is something that should be handled at the distro or branding
>>>>    level. (RFC sets the configuration in kernel recipe).
>>>>      - I have verified that this configuration may also be set in the
>>>>         branding file using, for example,
>>>>
>>>>           CMEM_BASE_pn-linux-ti-staging_omap-a15 = "a0000000"
>>>>           CMEM_SIZE_pn-linux-ti-staging_omap-a15 = "20000000"
>>> Hmm, on one hand I don't like this change being so invasive. But on the other
>>> hand, I'm not sure there's a better cleaner way to do a dts injection like
>>> that. Let me think about it...
>> Any thoughts on this yet?
> Jake,
>
> After discussing this matter internally, since cmem is something that LCPD
> currently doesn't support being an out-of-tree module and so on, I can accept
> the patchset, but it will be disabled by default and not tested by us. All the
> testing will be on you to make sure it's not broken by future changes in the
> kernel. Will that be sufficient?
>
This should be fine, but to be clear, is it OK to have the kernel recipe 
include the cmem include file? And, with CMEM being disabled by default 
for core sdk builds, would the CMEM configuration go into the branding file?


