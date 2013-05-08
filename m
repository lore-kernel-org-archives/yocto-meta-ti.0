Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F896E01484
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2013 08:32:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48FWxTH009386
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 10:32:59 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48FWxOb006896
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 10:32:59 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 10:32:58 -0500
Received: from [158.218.103.10] (a0850405-off1.am.dhcp.ti.com
	[158.218.103.10])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r48FWwrn002870;	Wed, 8 May 2013 10:32:58 -0500
Message-ID: <518A702A.6090704@ti.com>
Date: Wed, 8 May 2013 11:32:58 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Tom Rini <trini@ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
	<20130507224012.GJ12982@edge> <518A6B05.5000707@ti.com>
In-Reply-To: <518A6B05.5000707@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Wed, 08 May 2013 15:33:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2013 11:11 AM, Tom Rini wrote:
> On 05/07/2013 06:40 PM, Denys Dmytriyenko wrote:
>> On Tue, May 07, 2013 at 06:07:10PM -0400, Karicheri, Muralidharan wrote:
> [snip]
>>>>>> +	cd ${DEPLOY_DIR_IMAGE}
>>>>>> +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>>>>>> +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
>>>>>> +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
>>>>>> +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
>>>>>> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
>>>>>> +}
>>>>> As we just spoke - let's try to generalize this format and combine it with
>>>>> other similar requirements, like SPL-UART etc. There was a thread back in
>>>>> February about this...
>>> This is where I have disagreement. Let us restart the discussion. Who are
>>> the stake holders? Discuss it in this thread rather than using an old
>>> thread. I have copied here Carlos. I don't have bandwidth to spend too much
>>> time on this. Let us discuss it and identify what is required to be done.
>> Sure, let's discuss. I encourage everyone to participate, especially Carlos
>> and Tom.
> We should try and get the generic u-boot.inc to allow for a few
> different variables to be set by the machine.conf file, and if they are,
> copy/symlink them as needed.  I think we should try and fit the SPI
> selection into the generic u-boot-with-spl.bin framework that exists in
> u-boot today if we can, and then add some logic so that we can package
> and symlink that single file instead.
>
+1



