Return-Path: <trini@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 994CEE00312
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 13:25:25 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QLPOXs002239
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 15:25:24 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QLPOGM003421
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 15:25:24 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 15:25:23 -0600
Received: from [172.24.52.55] (h52-55.vpn.ti.com [172.24.52.55])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QLPN6H002412;
	Tue, 26 Feb 2013 15:25:23 -0600
Message-ID: <512D2865.9090806@ti.com>
Date: Tue, 26 Feb 2013 16:25:57 -0500
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com> <512D12D0.7090804@ti.com>
	<512D1714.6040805@ti.com> <512D1A7F.7030806@ti.com>
	<512D1D2B.7080909@ti.com> <20130226212219.GP6725@denix.org>
In-Reply-To: <20130226212219.GP6725@denix.org>
X-Enigmail-Version: 1.5
Cc: meta-ti@yoctoproject.org, Carlos Hernandez <ceh@ti.com>
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 21:25:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/26/2013 04:22 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 26, 2013 at 03:38:03PM -0500, Carlos Hernandez wrote:
>> On 02/26/2013 03:26 PM, Tom Rini wrote:
>>> On 02/26/2013 03:12 PM, Cyril Chemparathy wrote:
>>>> On 02/26/2013 02:53 PM, Murali Karicheri wrote:
>>>>> + Cyril,
>>>>>
>>>>> Cyril had worked on adding GPH format for u-boot. Want to hear from him
>>>>> why not used the u-boot-with-spl.bin build target.
>>>>>
>>>> Because u-boot-with-spl.bin does not wrap the spl image with a header
>>>> that the rom bootloader understands.
>>> What is the header we need?  I assume it's not compatible with our
>>> previous headers.  And if it's just a convenience for programming the
>>> flash, maybe we just stick with two files, to avoid further headaches
>>> upstream?  It's a general rule that concatenating files would make
>>> programming easier, but it's a small savings on either end, yes?  This
>>> would also make the packaging easier since it would just be
>>> SPL_IMAGE_FILE (or whatever) set to u-boot-spl.gph and so forth.  Thanks!
>>>
>> I believe this is what the patch I submitted (to meta-arago) few
>> days ago do.
>> You need to define SPL_UART_BINARY in your recipe to enable the
>> extra do_install and do_deploy functionality.
> 
> Correct, but it doesn't support GPH yet, only SPL, AFAIK. Can you look into 
> extending it in such a way it can be used for any/all of the use cases easily?

Well, if it's just a header on the SPL binary we already have that as "MLO".

-- 
Tom

