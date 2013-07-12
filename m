Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E802E013D6
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 21:54:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6C4sd4S020241
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 23:54:39 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6C4sdh7008397
	for <meta-ti@yoctoproject.org>; Thu, 11 Jul 2013 23:54:39 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 23:54:38 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r6C4sbox032013;	Thu, 11 Jul 2013 23:54:37 -0500
Message-ID: <51DF8C0C.9030001@ti.com>
Date: Fri, 12 Jul 2013 10:24:36 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <20130710130054.GA2217@ti.com> <20130711171248.GJ18647@edge>
In-Reply-To: <20130711171248.GJ18647@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv4] gbm: Add TI staging tree
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
X-List-Received-Date: Fri, 12 Jul 2013 04:54:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/11/2013 10:43 PM, Denys Dmytriyenko wrote:
> Also a question - do you still need it in danny, besides master and dylan?

We will need in Danny. I'm trying to make sure we finish all our work on
Danny. Patches would have been posted and we are only reworking them
based on feedback. Hopefully, this should complete within a week.

> 
> 
> On Wed, Jul 10, 2013 at 06:30:54PM +0530, Siddharth Heroor wrote:
>> * This is the gbm frontend used by (for example) weston
>>   compositor to load the GLES stack, and retrieve the
>>   backing buffer objects behind an eglImage (created
>>   with EGL_WAYLAND_BUFFER_WL), etc.  The frontend is really
>>   just a backend loader and shim. The backend library must
>>   be provided by the GLES implementation.
>> * The original libgbm is actually part of mesa but in the TI
>>   stack this is implemented as a separate and standalone package
>>   hosted at git://git.ti.com/glsdk/libgbm.git
>> * In the Danny branch, oe-core/meta/recipes-graphics/mesa
>>   has 8.0.0 as its version. For the GLSDK stack, the libgbm
>>   is more in line with 9.0.0 mesa. The goal is to move over
>>   to mesa for libgbm in future.
>>
>> v2:
>> * Cleaned up description and rewrote the commit.
>>
>> v3:
>>
>> * Rename as libgbm-glsdk to avoid clash with mesa-libgbm.
>>
>> v4:
>>
>> *  Move into a single versioned recipe and delete .inc file
>>
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>>  recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb |   17 +++++++++++++++++
>>  1 files changed, 17 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
>>
>> diff --git a/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb b/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
>> new file mode 100644
>> index 0000000..17207a1
>> --- /dev/null
>> +++ b/recipes-graphics/gbm/libgbm-glsdk_9.0.0.bb
>> @@ -0,0 +1,17 @@
>> +DESCRIPTION = "Userspace interface for the kernel GBM services."
>> +HOMEPAGE = "http://git.ti.com"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
>> +PROVIDES = "libgbm"
>> +
>> +COMPATIBLE_MACHINE = "omap-a15"
>> +
>> +DEFAULT_PREFERENCE = "-1"
>> +
>> +inherit autotools pkgconfig
>> +
>> +SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +SRCREV = "cb86a2f2cecd41023bf1bf12fbcf11be11220f31"
>> -- 
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


