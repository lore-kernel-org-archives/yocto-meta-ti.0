Return-Path: <trini@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5732E01484
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2013 09:44:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48GiKd0015509
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 11:44:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48GiKjE027572
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 11:44:20 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 11:44:19 -0500
Received: from [172.24.52.134] (h52-134.vpn.ti.com [172.24.52.134])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r48GiJ0u032341;
	Wed, 8 May 2013 11:44:19 -0500
Message-ID: <518A8107.2090603@ti.com>
Date: Wed, 8 May 2013 12:44:55 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
	<20130507224012.GJ12982@edge> <518A6B05.5000707@ti.com>
	<3E54258959B69E4282D79E01AB1F32B7044ED737@DFLE11.ent.ti.com>
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7044ED737@DFLE11.ent.ti.com>
X-Enigmail-Version: 1.5.1
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
X-List-Received-Date: Wed, 08 May 2013 16:44:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/08/2013 11:55 AM, Karicheri, Muralidharan wrote:
>>> -----Original Message-----
>>> From: Rini, Tom
>>> Sent: Wednesday, May 08, 2013 11:11 AM
>>> To: Dmytriyenko, Denys
>>> Cc: Karicheri, Muralidharan; Hernandez, Carlos; meta-ti@yoctoproject.org
>>> Subject: Re: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph
>>> support
>>>
>>> On 05/07/2013 06:40 PM, Denys Dmytriyenko wrote:
>>>> On Tue, May 07, 2013 at 06:07:10PM -0400, Karicheri, Muralidharan wrote:
>>> [snip]
>>>>>>>> +	cd ${DEPLOY_DIR_IMAGE}
>>>>>>>> +	rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>>>>>>>> +	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
>>>>>>>> +	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
>>>>>>>> +	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
>>>>>>>> +	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY} }
>>>>>>>
>>>>>>> As we just spoke - let's try to generalize this format and combine
>>>>>>> it with other similar requirements, like SPL-UART etc. There was a
>>>>>>> thread back in February about this...
>>>>>
>>>>> This is where I have disagreement. Let us restart the discussion. Who
>>>>> are the stake holders? Discuss it in this thread rather than using an
>>>>> old thread. I have copied here Carlos. I don't have bandwidth to
>>>>> spend too much time on this. Let us discuss it and identify what is required to be done.
>>>>
>>>> Sure, let's discuss. I encourage everyone to participate, especially
>>>> Carlos and Tom.
>>>
>>> We should try and get the generic u-boot.inc to allow for a few different variables to be
>>> set by the machine.conf file, and if they are, copy/symlink them as needed.  I think we
>>> should try and fit the SPI selection into the generic u-boot-with-spl.bin framework that
>>> exists in u-boot today if we can, and then add some logic so that we can package and
>>> symlink that single file instead.
> 
> I think we are unable to use the generic due to the specific header format requirement from RBL (Rom
> Boot loader). So we need to live with the format. How do we handle this with the existing u-boot-spl.gph
> formatting that we use?

I was off slightly it seems, we don't have everyone on
u-boot-with-spl.bin, but it's u-boot-with-spl.something (bin, imx).  So
in this case, make up the rules for a u-boot-with-spl.gph that does what
keystone needs, and we can finish up the rest of the logic around that
to pick up u-boot-with-spl.* and copy/link.

-- 
Tom

