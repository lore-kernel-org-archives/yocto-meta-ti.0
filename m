Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91E14E014E4
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 06:02:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5SD24Id030872
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 08:02:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5SD24VE028863
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2013 08:02:04 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 08:02:04 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5SD21Ng014833;	Fri, 28 Jun 2013 08:02:02 -0500
Message-ID: <51CD8949.2040202@ti.com>
Date: Fri, 28 Jun 2013 18:32:01 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <CF956B779D819D41BBC043B7082161D543D2B9@DBDE04.ent.ti.com>
	<A4887BF146CD57468F700B415D2F47015AAF78@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED10159620724@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159620724@DLEE11.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] gbm: Add TI staging tree
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
X-List-Received-Date: Fri, 28 Jun 2013 13:02:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/28/2013 5:02 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Vishwanathrao Badarkhe,
>> Manish
>> Sent: Friday, June 28, 2013 6:21 AM
>> To: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [PATCH] gbm: Add TI staging tree
>>
>> Hi,
>>
>> On Fri, Jun 28, 2013 at 16:37:51, Hingolikar, Mrinmayee wrote:
>>>
>>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>> ---
>>>  recipes-graphics/gbm/libgbm.inc    |   15 +++++++++++++++
>>>  recipes-graphics/gbm/libgbm_git.bb |    7 +++++++
>>
>> There is no commit message for this patch.
>>
>>>  2 files changed, 22 insertions(+), 0 deletions(-)  create mode
>> 100644 recipes-graphics/gbm/libgbm.inc  create mode 100644
>> recipes-graphics/gbm/libgbm_git.bb
>>>
>>> diff --git a/recipes-graphics/gbm/libgbm.inc b/recipes-
>> graphics/gbm/libgbm.inc new file mode 100644 index
>> 0000000..07591e6
>>> --- /dev/null
>>> +++ b/recipes-graphics/gbm/libgbm.inc
>>> @@ -0,0 +1,15 @@
>>> +SUMMARY = "Userspace interface for the kernel GBM services."
>>> +DESCRIPTION = "This is the gbm frontend used by (for example)
>> weston \
>>> +compositor to load the GLES stack, and retrieve the backing
>> buffer \
>>> +objects behind an eglImage (created with
>> EGL_WAYLAND_BUFFER_WL), etc.\
>>> +The frontend is really just a backend loader and shim. \ The
>> backend
>>> +library must be provided by the GLES implementation."
> 
> This description looks more like the commit message :)
> 
> I would shorten this and use comments for more detail as well as adding a commit message.

I think the commit needs to give more information on why we have this
particular package in the first place. The original work was done by
Nicolas and Rob from the GLP team prior to us inheriting the codebase.

From what I understand this is extracted from mesa's libgbm into it's
own package.

> 
>>> +HOMEPAGE = "http://git.ti.com"
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM =
>> "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec43
>> 7b187f7"
>>> +PROVIDES = "gbm"
> 
> I'm not sure why you are setting this.  Does something DEPEND on gbm?
> 
> Also, what is the difference between this and the libgbm package in the mesa-common.inc file?
> 
> I worry that there is some potential conflict between your package and the libgbm in the mesa recipes.

Do you think we can have a virtual/libgbm in PROVIDES or put in a
PREFERRED_PROVIDER for libgbm to be this recipe? By default we set
DEFAULT_PREFERENCE = "-1" and override it in the branding.

> 
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +PACKAGES =+ "${PN}-dev"
>>> +FILES_${PN}-dev = "${libdir}/libgbm_*.so.*"
>>> diff --git a/recipes-graphics/gbm/libgbm_git.bb b/recipes-
>> graphics/gbm/libgbm_git.bb
>>> new file mode 100644
>>> index 0000000..d1fa38d
>>> --- /dev/null
>>> +++ b/recipes-graphics/gbm/libgbm_git.bb
>>> @@ -0,0 +1,7 @@
>>> +require libgbm.inc
>>> +
>>> +SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
>>> --
>>> 1.7.0.4
>>>
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>
>>
>>
>> Regards,
>> Manish
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


