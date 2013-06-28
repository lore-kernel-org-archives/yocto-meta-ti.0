Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DE11E003E3
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 06:38:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5SDcBbi002354
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 08:38:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5SDcB31006691
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 08:38:11 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 08:38:11 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5SDc4RH025756;	Fri, 28 Jun 2013 08:38:05 -0500
Message-ID: <51CD91BB.9060301@ti.com>
Date: Fri, 28 Jun 2013 19:08:03 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <20130627171636.GA7291@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961D1CF@DLEE11.ent.ti.com>
	<20130627191748.GD30195@edge> <51CD548A.806@ti.com>
	<7D46E86EC0A8354091174257B2FED101596206E4@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596206E4@DLEE11.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] libdrm: Add GLSDK specific staging tree for omap-a15
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
X-List-Received-Date: Fri, 28 Jun 2013 13:38:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/28/2013 4:55 PM, Maupin, Chase wrote:
> 
>> -----Original Message-----
>> From: Heroor, Siddharth
>> Sent: Friday, June 28, 2013 4:17 AM
>> To: Dmytriyenko, Denys
>> Cc: Maupin, Chase; meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH] libdrm: Add GLSDK specific staging
>> tree for omap-a15
>>
>> On 6/28/2013 12:47 AM, Denys Dmytriyenko wrote:
>>> On Thu, Jun 27, 2013 at 05:46:43PM +0000, Maupin, Chase wrote:
>>>>> -----Original Message-----
>>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>>>> bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
>>>>> Sent: Thursday, June 27, 2013 12:17 PM
>>>>> To: meta-ti@yoctoproject.org
>>>>> Subject: [meta-ti] [PATCH] libdrm: Add GLSDK specific staging
>> tree
>>>>> for omap-a15
>>>>>
>>>>> * Override SRC_URI to use TI's tree at
>>>>> https://git.ti.com/glsdk/libdrm
>>>>>  This tree includes patches on top of the upstream libdrm for
>>>>>  omap5 and dra7xx class of devices.
>>>>>
>>>>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>>>> ---
>>>>> recipes-graphics/drm/libdrm_2.4.41.bb |   15 +++++++++++++++
>>>>> 1 files changed, 15 insertions(+), 0 deletions(-)
>>>>> create mode 100644 recipes-graphics/drm/libdrm_2.4.41.bb
>>>>>
>>>>> diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-
>>>>> graphics/drm/libdrm_2.4.41.bb
>>>>> new file mode 100644
>>>>> index 0000000..31f7cee
>>>>> --- /dev/null
>>>>> +++ b/recipes-graphics/drm/libdrm_2.4.41.bb
>>>>
>>>> I thought you were going to bbappend this instead of overlaying
>> the whole
>>>> recipe.
>>>
>>> I was confused at first as well, but I guess it should be fine,
>> considering
>>> there's no 2.4.41 version to bbapend anyway.
>>
>> Sorry about that. The original code we were working on was a
>> .bbappend
>> to override recipes-graphics/drm/libdrm_git. However, the latest
>> version
>> in oe-core on danny is 2.4.39 and master is 2.4.45. I chose to use
>> libdrm_2.4.41.bb because that's easier to read for me :-)
>>
>>>
>>>
>>>>> @@ -0,0 +1,15 @@
>>>>> +require recipes-graphics/drm/libdrm.inc
>>>>> +
>>>>> +COMPATIBLE_MACHINE = "omap-a15"
>>>>> +
>>>>> +DEFAULT_PREFERENCE = "-1"
>>>>> +
>>>>> +EXTRA_OECONF += "--enable-omap-experimental-api"
>>>>> +
>>>>> +SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
>>>>> +SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
>>>>> +
>>>>> +# Append to the PR so that a new SRCREV will cause a rebuild
>>>>> +PR_append = "a+gitr${SRCPV}"
>>>>
>>>> I always had issue with this.  I'm not sure that this statement
>> holds true
>>>> because whether a new SRCREV will cause a rebuild would depend
>> on whether
>>>> that SRCREV sorts higher than the old one.  Unless something
>> else has
>>>> changed.  This is useful though if you want to know what SRCREV
>> was used for
>>>> a build.
>>>
>>> Well, if every time you update SRCREV you also increment the
>> first letter, it
>>> will work as expected - so the comment is kind of correct... :)
>>>
>>
>> Right, I just followed the existing kernel recipes for convention.
>> Would
>> the convention change between a kernel recipe (like
>> recipes-kernel/linux/linux-ti-staging_3.8.bb) where we have both
>> SRCPV
>> and the first letter, compared to userspace recipes which point to
>> git
>> trees for versions?
> 
> The kernel ones were to append the MACHINE_KERNEL_PR that was set with the letter.  The SRCPV use was also nice to make it easier to know which commitid was being used during the kernel build.
> 
>>
>>
>>>
>>>> That being said if you were going to overlay this recipe the PR
>> should be
>>>> something like
>>>>
>>>> PR = "${INC_PR}.0"
>>>>
>>>> Right now you are appending to the default since PR is not
>> defined.  With a
>>>> bbappend you should append a -arago flag.
>>>>
>>>> So this comes back to why no bbappend?  Is it because the base
>> version in
>>>> oe-core is 2.4.39 and not 2.4.41?  Can you not append the _git
>> version of
>>>> the recipe and update the PV appropriately?
>>>>
>>
>> That's also possible but the question I have is what's the
>> preferred
>> convention?
>>
>> All the GLSDK trees are on git. The choice really is between
>> having a
>> since .bbappend for each of the trees with an explicit PV and bump
>> the
>> PV everytime we update to latest on upstream *OR* have a recipe
>> for the
>> version and submit a new recipe when we update to latest.
>>
>> I can submit a v2 once I understand the expected convention to be
>> followed.
> 
> I get your point on clarity so I'm OK with a version specific addition.  You may have answered this before but what is the difference between your libdrm and the libdrm upstream?  Are your patches going upstream to the main libdrm so that going forward you can drop this recipe for a new version?

We should. It's on the backlog ;-)

Right now the focus is to have our software on meta-ti.

> 
> Denys, refresh my memory if we are doing a version but we are also changing things in our trees don't we normally do this as something like ti-libdrm and set the PROVIDES, etc for libdrm?  This was to distinguish between libdrv 2.4.41 for example and what TI is calling 2.4.41 right?  Or do you just want to do 2.4.41+?  What is your preferrence? 
> 
> Sidd, going the non _git route see my other input then about PR, etc.

Agreed. I'll send v2 with PR = "${INC_PR}.0".

> 
>>
>>>>> +
>>>>> +S = "${WORKDIR}/git"
>>>>> --
>>>>> 1.7.0.4
>>>>>
>>>>> _______________________________________________
>>>>> meta-ti mailing list
>>>>> meta-ti@yoctoproject.org
>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
> 


