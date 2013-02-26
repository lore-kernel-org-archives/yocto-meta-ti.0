Return-Path: <ceh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id D2DC2E0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:38:04 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1QKc3wG025540
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:38:03 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1QKc3Ei016884
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 14:38:03 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 26 Feb 2013 14:38:03 -0600
Received: from [158.218.103.10] (a0850405-off1.am.dhcp.ti.com
	[158.218.103.10])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1QKc3wb015547;	Tue, 26 Feb 2013 14:38:03 -0600
Message-ID: <512D1D2B.7080909@ti.com>
Date: Tue, 26 Feb 2013 15:38:03 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: Tom Rini <trini@ti.com>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com> <512D12D0.7090804@ti.com>
	<512D1714.6040805@ti.com> <512D1A7F.7030806@ti.com>
In-Reply-To: <512D1A7F.7030806@ti.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Tue, 26 Feb 2013 20:38:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 03:26 PM, Tom Rini wrote:
> On 02/26/2013 03:12 PM, Cyril Chemparathy wrote:
>> On 02/26/2013 02:53 PM, Murali Karicheri wrote:
>>> + Cyril,
>>>
>>> Cyril had worked on adding GPH format for u-boot. Want to hear from him
>>> why not used the u-boot-with-spl.bin build target.
>>>
>> Because u-boot-with-spl.bin does not wrap the spl image with a header
>> that the rom bootloader understands.
> What is the header we need?  I assume it's not compatible with our
> previous headers.  And if it's just a convenience for programming the
> flash, maybe we just stick with two files, to avoid further headaches
> upstream?  It's a general rule that concatenating files would make
> programming easier, but it's a small savings on either end, yes?  This
> would also make the packaging easier since it would just be
> SPL_IMAGE_FILE (or whatever) set to u-boot-spl.gph and so forth.  Thanks!
>
I believe this is what the patch I submitted (to meta-arago) few days 
ago do.
You need to define SPL_UART_BINARY in your recipe to enable the extra 
do_install and do_deploy functionality.



