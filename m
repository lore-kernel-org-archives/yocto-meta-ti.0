Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E214E016E0
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 03:29:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9IATMh7030960
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:29:22 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IATMP0017343
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:29:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 18 Oct 2013 05:29:22 -0500
Received: from [172.24.156.117] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IATL0L003277	for
	<meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:29:21 -0500
Message-ID: <52610D81.1020809@ti.com>
Date: Fri, 18 Oct 2013 15:59:21 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <1372849303-21311-1-git-send-email-mrinmayee@ti.com>
	<CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596D51CE@DLEE11.ent.ti.com>
	<20130821154954.GE24491@edge> <20130903174227.GF22235@edge>
In-Reply-To: <20130903174227.GF22235@edge>
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Fri, 18 Oct 2013 10:29:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/3/2013 11:12 PM, Denys Dmytriyenko wrote:
> Mrinmayee,
>
> Ping. Do you have an ETA for addressing the comments below? Thanks.
Sorry for the delayed response. I am sending the v3 for this patch
addressing all the comments.
>
>
> On Wed, Aug 21, 2013 at 11:49:54AM -0400, Denys Dmytriyenko wrote:
>> On Wed, Aug 21, 2013 at 03:31:42PM +0000, Maupin, Chase wrote:
>>>> -----Original Message-----
>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>>> bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>>>> Sent: Wednesday, August 21, 2013 6:48 AM
>>>> To: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org
>>>> Subject: Re: [meta-ti] [PATCHv2] abefw: Firmware for OMAP5 ABE
>>>>
>>>> Ping for comments!
>>> For some reason I don't see this in my e-mails for the original post.  Sorry 
>>> for the delay.
>> You are correct - there were no v2 submissions to the list on July 3rd. We 
>> only reviewed the original patch before.
>>
>>
>>>>> -----Original Message-----
>>>>> From: Hingolikar, Mrinmayee
>>>>> Sent: Wednesday, July 03, 2013 4:32 PM
>>>>> To: meta-ti@yoctoproject.org
>>>>> Cc: Hingolikar, Mrinmayee; Heroor, Siddharth
>>>>> Subject: [PATCHv2] abefw: Firmware for OMAP5 ABE
>>>>>
>>>>> * The OMAP5 Audio Backend requires a 'firmware' to enable
>>>>>   sound. This recipe installs a prebuilt firmware. This
>>>>>   part is a hack, as in the current form, the firmware
>>>>>   cannot be cross-compiled. There is a plan to fix this
>>>>>   and hopefully, this recipe is short-lived. Once the code
>>>>>   is fixed, we should have new recipes that build the firmware
>>>>>   and clean up this recipe.
>>>>>
>>>>> v2:
>>>>> * Merged contents from abefw.inc and removed abefw.inc based
>>>>>   on review.
>>>>>
>>>>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>>>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>>>>> ---
>>>>>  recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
>>>>>  1 files changed, 20 insertions(+), 0 deletions(-)  create mode
>>>> 100644
>>>>> recipes-bsp/abefw/abefw_1.0.14.bb
>>>>>
>>>>> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
>>>>> bsp/abefw/abefw_1.0.14.bb
>>>>> new file mode 100644
>>>>> index 0000000..8db71e4
>>>>> --- /dev/null
>>>>> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
>>>>> @@ -0,0 +1,20 @@
>>>>> +SUMMARY = "Firmware for OMAP5 ABE"
>>>>> +HOMEPAGE = "http://git.ti.com"
>>>>> +LICENSE = "BSD/GPLv2"
>>> This seems wrong.  I thought the convention is "BSD | GPLv2" for either 
>>> license or "BSD & GPLv2" if mixed license.
>>>
>>> If it is mixed then you probably need 2 entries in LIC_FILES_CHKSUM, one for 
>>> each license.
>>>
>>> Also, does the GPLv2 use the "or later" clause such that it should be GPLv2+ 
>>> ?
>> This was already mentioned in one of the other patches.
>>
>>
>>>>> +LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
>>>>> +
>>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>> +COMPATIBLE_MACHINE = "omap5-evm"
>>>>> +
>>>>> +SRC_URI = "git://git.ti.com/glsdk/abefw-
>>>> omap4plus.git;protocol=git"
>> The git repo itself says omap4plus - why is it limited to OMAP5 only? Can it 
>> be enabled for OMAP4/Pandaboard too?
>>
>>
>>> Not strictly required but PR = r0 here would help remind you to bump the PR 
>>> in the future.
>>>
>>>>> +
>>>>> +S = "${WORKDIR}/git"
>>>>> +
>>>>> +SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
>>>>> +
>>>>> +do_install() {
>>>>> +        mkdir -p ${D}/lib/firmware
>>>>> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
>>>>> +
>>>>> +FILES_${PN} += "/lib/firmware/omap4_abe_new"
>>> I'm sure this has been discussed before, but do you see any confusion about 
>>> this being omap5-evm only and yet the FW is omap4_abe_new?
>>>
>>>>> --
>>>>> 1.7.0.4
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


-- 
Regards,
Mrinmayee


